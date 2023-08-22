local S = minetest.get_translator(minetest.get_current_modname())
mcl_campfires = {}

local food_entities = {}

local COOK_TIME = 30 -- Time it takes to cook food on a campfire.

local campfire_spots = {
	vector.new(-0.25, -0.04, -0.25),
	vector.new( 0.25, -0.04, -0.25),
	vector.new( 0.25, -0.04,  0.25),
	vector.new(-0.25, -0.04,  0.25),
}

local function count_table(tbl)
	local count = 0
	for _,_ in pairs(tbl) do count = count + 1 end
	return count
end

local function drop_items(pos, node, oldmeta)
	local ph = minetest.hash_node_position(vector.round(pos))
	if food_entities[ph] then
		for k,v in pairs(food_entities[ph]) do
			if v and v.object and v.object:get_pos() then
				v.object:remove()
				minetest.add_item(pos, v._item)
			end
		end
		food_entities[ph] = nil
	end
end

local function campfire_drops(pos, digger, drops, nodename)
	local wield_item = digger:get_wielded_item()
	local inv = digger:get_inventory()
	if not minetest.is_creative_enabled(digger:get_player_name()) then
		if mcl_enchanting.has_enchantment(wield_item, "silk_touch") then
			minetest.add_item(pos, nodename)
		else
			minetest.add_item(pos, drops)
		end
	elseif inv:room_for_item("main", nodename) and not inv:contains_item("main", nodename) then
		inv:add_item("main", nodename)
	end
end

local function on_blast(pos)
	local node = minetest.get_node(pos)
	drop_items(pos, node)
	minetest.remove_node(pos)
end

function mcl_campfires.light_campfire(pos)
	local campfire = minetest.get_node(pos)
	local name = campfire.name .. "_lit"
	minetest.set_node(pos, {name = name, param2 = campfire.param2})
end

local function get_free_spot(ph)
	if not food_entities[ph] then
		food_entities[ph] = {}
		return 1
	end
	for i = 1,4 do
		local v = food_entities[ph][i]
		if not v or not v.object or not v.object:get_pos() then
			food_entities[ph][i] = nil
			return i
		end
	end
end

-- on_rightclick function to take items that are cookable in a campfire, and put them in the campfire inventory
function mcl_campfires.take_item(pos, node, player, itemstack)
	if minetest.get_item_group(itemstack:get_name(), "campfire_cookable") ~= 0 then
		local cookable = minetest.get_craft_result({method = "cooking", width = 1, items = {itemstack}})
		if cookable then
			local ph = minetest.hash_node_position(vector.round(pos))
			local spot = get_free_spot(ph)
			if not spot then return end

			local def = itemstack:get_definition()
			local o = minetest.add_entity(pos + campfire_spots[spot], "mcl_campfires:food_entity")
			o:set_properties({
				wield_item = itemstack:get_name(),
				wield_image = def.wield_image,
				-- "mcl_mobitems_"..string.sub(itemstack:get_name(), 14).."_raw.png"
			})
			local l = o:get_luaentity()
			l._campfire_poshash = ph
			l._start_time = minetest.get_gametime()
			--l._cook_time = cookable.time --apparently it always takes 30 secs in mc?
			l._item = itemstack:get_name()
			l._drop = cookable.item:get_name()
			l._spot = spot
			food_entities[ph][spot] = l
			if not minetest.is_creative_enabled(player:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack
		end
	end
end

function mcl_campfires.register_campfire(name, def)
	-- Define Campfire
	minetest.register_node(name, {
		description = def.description,
		_tt_help = S("Cooks food and keeps bees happy."),
		_doc_items_longdesc = S("Campfires have multiple uses, including keeping bees happy, cooking raw meat and fish, and as a trap."),
		inventory_image = def.inv_texture,
		wield_image = def.inv_texture,
		drawtype = "mesh",
		mesh = "mcl_campfires_campfire.obj",
		tiles = {{name="mcl_campfires_log.png"},},
		use_texture_alpha = "clip",
		groups = { handy=1, axey=1, material_wood=1, not_in_creative_inventory=1, campfire=1, },
		paramtype = "light",
		paramtype2 = "4dir",
		_on_ignite = function(player, node)
			mcl_campfires.light_campfire(node.under)
			return true
		end,
		drop = "",
		sounds = mcl_sounds.node_sound_wood_defaults(),
		selection_box = {
			type = 'fixed',
			fixed = {-.5, -.5, -.5, .5, -.05, .5}, --left, bottom, front, right, top
		},
		collision_box = {
			type = 'fixed',
			fixed = {-.5, -.5, -.5, .5, -.05, .5},
		},
		_mcl_blast_resistance = 2,
		_mcl_hardness = 2,
		after_dig_node = function(pos, node, oldmeta, digger)
			campfire_drops(pos, digger, def.drops, name.."_lit")
		end,
	})

	--Define Lit Campfire
	minetest.register_node(name.."_lit", {
		description = def.description,
		_tt_help = S("Cooks food and keeps bees happy."),
		_doc_items_longdesc = S("Campfires have multiple uses, including keeping bees happy, cooking raw meat and fish, and as a trap."),
		inventory_image = def.inv_texture,
		wield_image = def.inv_texture,
		drawtype = "mesh",
		mesh = "mcl_campfires_campfire.obj",
		tiles = {
			{name=def.fire_texture,
			animation={
				type="vertical_frames",
				aspect_w=32,
				aspect_h=16,
				length=2.0
			}}
		},
		overlay_tiles = {{
			name=def.lit_logs_texture,
			animation = {
				type = "vertical_frames",
				aspect_w = 32,
				aspect_h = 16,
				length = 2.0,
			}},
		},
		use_texture_alpha = "clip",
		groups = { handy=1, axey=1, material_wood=1, lit_campfire=1 },
		paramtype = "light",
		paramtype2 = "4dir",
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			inv:set_size("main", 4)
		end,
		on_rightclick = function (pos, node, player, itemstack, pointed_thing)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if not inv then inv:set_size("main", 4) end

			if minetest.get_item_group(itemstack:get_name(), "shovel") ~= 0 then
				local protected = mcl_util.check_position_protection(pos, player)
				if not protected then
					if not minetest.is_creative_enabled(player:get_player_name()) then
						-- Add wear (as if digging a shovely node)
						local toolname = itemstack:get_name()
						local wear = mcl_autogroup.get_wear(toolname, "shovely")
						if wear then
							itemstack:add_wear(wear)
						end
					end
					node.name = name
					minetest.set_node(pos, node)
					minetest.sound_play("fire_extinguish_flame", {pos = pos, gain = 0.25, max_hear_distance = 16}, true)
				end
			elseif minetest.get_item_group(itemstack:get_name(), "campfire_cookable") ~= 0 then
				mcl_campfires.take_item(pos, node, player, itemstack)
			else
				minetest.item_place_node(itemstack, player, pointed_thing)
			end
		end,
		on_timer = mcl_campfires.cook_item,
		drop = "",
		light_source = def.lightlevel,
		sounds = mcl_sounds.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-.5, -.5, -.5, .5, -.05, .5}, --left, bottom, front, right, top
		},
		collision_box = {
			type = "fixed",
			fixed = {-.5, -.5, -.5, .5, -.05, .5},
		},
		_mcl_blast_resistance = 2,
		_mcl_hardness = 2,
		damage_per_second = def.damage, -- FIXME: Once entity burning is fixed, this needs to be removed.
		on_blast = on_blast,
		after_dig_node = function(pos, node, oldmeta, digger)
			drop_items(pos, node, oldmeta)
			campfire_drops(pos, digger, def.drops, name.."_lit")
		end,
		_mcl_campfires_smothered_form = name,
	})
end

local function burn_in_campfire(obj)
	local p = obj:get_pos()
	if p then
		local n = minetest.find_node_near(p,0.4,{"group:lit_campfire"},true)
		if n then
			mcl_burning.set_on_fire(obj, 5)
		end
	end
end

local etime = 0
minetest.register_globalstep(function(dtime)
	etime = dtime + etime
	if etime < 0.5 then return end
	etime = 0
	for _,pl in pairs(minetest.get_connected_players()) do
		local armor_feet = pl:get_inventory():get_stack("armor", 5)
		if pl and pl:get_player_control().sneak or (minetest.global_exists("mcl_enchanting") and mcl_enchanting.has_enchantment(armor_feet, "frost_walker")) or (minetest.global_exists("mcl_potions") and mcl_potions.player_has_effect(pl, "fire_proof")) then
			return
		end
		burn_in_campfire(pl)
	end
	for _,ent in pairs(minetest.luaentities) do
		if ent.is_mob then
			burn_in_campfire(ent.object) -- FIXME: Mobs don't seem to burn properly anymore.
		end
	end
end)

function mcl_campfires.generate_smoke(pos)
	local smoke_timer

	if minetest.get_node(vector.offset(pos, 0, -1, 0)).name == "mcl_farming:hay_block" then
		smoke_timer = 8
	else
		smoke_timer = 4.75
	end

	minetest.add_particle({
		pos = vector.offset(pos, math.random(-0.5, 0.5), 0.5, math.random(-0.5, 0.5)),
		velocity = vector.new(0, 1, 0),
		texture = "mcl_particles_smoke.png",
		size = 10,
		acceleration = vector.new(0, 0.5, 0),
		collisiondetection = true,
		expirationtime = smoke_timer,
	})
end

-- Register Visual Food Entity
minetest.register_entity("mcl_campfires:food_entity", {
	initial_properties = {
		physical = false,
		visual = "wielditem",
		wield_item = "",
		wield_image = "blank.png",
		visual_size = {x=0.25, y=0.25},
		collisionbox = {0,0,0,0,0,0},
		pointable = false,
	},
	on_step = function(self,dtime)
		self._timer = (self._timer or 1) - dtime
		if self._timer > 0 then return end
		if minetest.get_gametime() - self._start_time > (self._cook_time or COOK_TIME) then
			minetest.add_item(self.object:get_pos(), self._drop)
			food_entities[self._campfire_poshash][self._spot] = nil
			if count_table(food_entities[self._campfire_poshash]) == 0 then
				food_entities[self._campfire_poshash] = nil
			end
			self.object:remove()
		end
	end,
	on_activate = function(self, staticdata)
		self.object:set_rotation({x = math.pi / -2, y = 0, z = 0})
	end,
})

minetest.register_abm({
	label = "Campfire Smoke",
	nodenames = {"group:lit_campfire"},
	interval = 2,
	chance = 2,
	action = mcl_campfires.generate_smoke,
})
