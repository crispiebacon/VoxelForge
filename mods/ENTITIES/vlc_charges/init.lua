local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Cooldown time and global storing of cooldown
local cooldown_time = 1
vlc_charges_cooldown = {}
if minetest.global_exists("vlc_charges_cooldown") == false then
	minetest.register_globalstep(function(dtime)
		minetest.set_global_exists("vlc_charges_cooldown", {})
	end)
end
vlc_charges = {}
local S = minetest.get_translator("vlc_charges")
--Wind Charge Particle effects
wind_burst_spawner = {
	texture = "vlc_charges_wind_burst_1.png",
	texpool = {},
	amount = 6,
	time = 0.2,
	minvel = vector.zero(),
	maxvel = vector.zero(),
	minacc = vector.new(-0.2, 0.0, -0.2),
	maxacc = vector.new(0.2, 0.1, 0.2),
	minexptime = 0.95,
	maxexptime = 0.95,
	minsize = 12.0,
	maxsize= 18.0,
	glow = 100,
	collisiondetection = true,
	collision_removal = true,
}
for i=1,2 do
	table.insert(wind_burst_spawner.texpool, {
		name = "vlc_charges_wind_burst_"..i..".png",
		animation={type="vertical_frames", aspect_w=8, aspect_h=8, length=1},
	})
end
-- Chorus flower destruction effects
function vlc_charges.chorus_flower_effects(pos, radius)
		minetest.add_particlespawner({
			amount = 10,
			time = 0.3,
			minpos = vector.subtract(pos, radius / 2),
			maxpos = vector.add(pos, radius / 2),
			minvel = vector.new(-5, 0, -5),
			maxvel = vector.new(5, 3, 5),
			minacc = vector.new(0, -10, 0),
			minexptime = 0.8,
			maxexptime = 2.0,
			minsize = radius * 0.66,
			maxsize = radius * 1.00,
			texpool = {"vlc_end_chorus_flower_1.png", "vlc_end_chorus_flower_2.png", "vlc_end_chorus_flower_3.png", "vlc_end_chorus_flower_4.png", "vlc_end_chorus_flower_5.png", "vlc_end_chorus_flower_6.png", "vlc_end_chorus_flower_7.png", "vlc_end_chorus_flower_8.png", "vlc_end_chorus_flower_9.png", "vlc_end_chorus_flower_10.png"},
			collisiondetection = true,
		})
end
-- decorated pot destruction effects
function vlc_charges.pot_effects(pos, radius)
		minetest.add_particlespawner({
			amount = 10,
			time = 0.3,
			minpos = vector.subtract(pos, radius / 2),
			maxpos = vector.add(pos, radius / 2),
			minvel = vector.new(-5, 0, -5),
			maxvel = vector.new(5, 3, 5),
			minacc = vector.new(0, -10, 0),
			minexptime = 0.8,
			maxexptime = 2.0,
			minsize = radius * 0.66,
			maxsize = radius * 1.00,
			texpool = {"vlc_pottery_sherds_pot_1.png", "vlc_pottery_sherds_pot_2.png", "vlc_pottery_sherds_pot_3.png", "vlc_pottery_sherds_pot_4.png", "vlc_pottery_sherds_pot_5.png", "vlc_pottery_sherds_pot_6.png", "vlc_pottery_sherds_pot_7.png", "vlc_pottery_sherds_pot_8.png", "vlc_pottery_sherds_pot_9.png", "vlc_pottery_sherds_pot_10.png"},
			collisiondetection = true,
		})
end
-- Initial knockback function
function vlc_charges.wind_burst_velocity(pos1, pos2, old_vel, power)
		if vector.equals(pos1, pos2) then
	return old_vel
end

	local vel = vector.direction(pos1, pos2)
		vel = vector.normalize(vel)
		vel = vector.multiply(vel, power)

	local dist = vector.distance(pos1, pos2)
		dist = math.max(dist, 1)
		vel = vector.divide(vel, dist)
		vel = vector.add(vel, old_vel)
		vel = vector.add(vel, {
		x = math.random() - 0.5,
		y = math.random() - 0.5,
		z = math.random() - 0.5,
	})

	dist = vector.length(vel)
		if dist > 250 then
			vel = vector.divide(vel, dist / 250)
		end
	return vel
end
local RADIUS = 4
-- Wind Burst registry
function vlc_charges.wind_burst(pos, radius)
	local objs = minetest.get_objects_inside_radius(pos, radius)
		for _, obj in pairs(objs) do
			local obj_pos = obj:get_pos()
			local dist = math.max(1, vector.distance(pos, obj_pos))
			local damage = (0 / dist) * radius
				if obj:is_player() then
					local dir = vector.normalize(vector.subtract(obj_pos, pos))
					local moveoff = vector.multiply(dir, math.random(1.5, 1.8) / dist * RADIUS)
						obj:add_velocity(moveoff)
						obj:set_hp(obj:get_hp() - damage)
				else
					local luaobj = obj:get_luaentity()
						if luaobj then
							local do_knockback = true
							local objdef = minetest.registered_entities[luaobj.name]
								if objdef and objdef.on_blast then
									do_knockback = objdef.on_blast(luaobj, damage)
								end
									if do_knockback then
										local obj_vel = obj:get_velocity()
											obj:set_velocity(vlc_charges.wind_burst_velocity(pos, obj_pos, obj_vel, radius * 3))
								end
						end
				end
		end
end
--throwable charge registry
function register_charge(name, descr, def)
	minetest.register_craftitem("vlc_charges:" .. name .. "", {
		description = S(descr),
		inventory_image = "vlc_charges_" .. name .. ".png",

		on_place = function(itemstack, placer, pointed_thing)
			local playername = placer:get_player_name()
			if vlc_charges_cooldown[playername] == nil then
				vlc_charges_cooldown[playername] = 0
			end
		local current_time = minetest.get_gametime()
			if current_time - vlc_charges_cooldown[playername] >= cooldown_time then
				vlc_charges_cooldown[playername] = current_time
					local velocity = 30
					local dir = placer:get_look_dir()
					local playerpos = placer:get_pos()
					local obj = minetest.add_entity({
						x = playerpos.x + dir.x,
						y = playerpos.y + 1.3 + dir.y,
						z = playerpos.z + dir.z
					}, "vlc_charges:" .. name .. "_flying")
					local vec = {x = dir.x * velocity, y = dir.y * velocity, z = dir.z * velocity}
					local acc = {x = 0, y = 0, z = 0}
					obj:set_velocity(vec)
					obj:set_acceleration(acc)
					local ent = obj:get_luaentity() ; ent.posthrow = playerpos
					itemstack:take_item()
				return itemstack
		end
	end,
on_secondary_use = function(itemstack, placer, pointed_thing)
		local playername = placer:get_player_name()
		if vlc_charges_cooldown[playername] == nil then
			vlc_charges_cooldown[playername] = 0
		end
	local current_time = minetest.get_gametime()
		if current_time - vlc_charges_cooldown[playername] >= cooldown_time then
			vlc_charges_cooldown[playername] = current_time
				local velocity = 30
					local dir = placer:get_look_dir()
					local playerpos = placer:get_pos()
					local obj = minetest.add_entity({
						x = playerpos.x + dir.x,
						y = playerpos.y + 2 + dir.y,
						z = playerpos.z + dir.z
					}, "vlc_charges:" .. name .. "_flying")
					local vec = {x = dir.x * velocity, y = dir.y * velocity, z = dir.z * velocity}
					local acc = {x = 0, y = 0, z = 0}
					obj:set_velocity(vec)
					obj:set_acceleration(acc)
					local ent = obj:get_luaentity() ; ent.posthrow = playerpos
					itemstack:take_item()
				return itemstack
			--[[	else
					local remaining_cooldown = math.ceil(cooldown_time - (ig_time - vlc_charges_vlc_charges_cooldown[playername]))]]
			end
end,
_on_dispense = function(stack, pos, droppos, dropnode, dropdir)
	local shootpos = vector.add(pos, vector.multiply(dropdir, 0.51))
	local charge = minetest.add_entity(shootpos, "vlc_charges:" .. name .. "_flying")
		if charge and charge:get_pos() then
			local ent_charge = charge:get_luaentity()
				ent_charge._shot_from_dispenser = true
			local v = ent_charge.velocity or 20
				charge:set_velocity(vector.multiply(dropdir, v))
				ent_charge.switch = 1
			end
				stack:take_item()
	end,
})
-- Entity registry
minetest.register_entity("vlc_charges:" .. name .. "_flying", {
	initial_properties = {
		visual = "mesh",
		mesh = name..".obj",
		visual_size = {x=2, y=1.5},
		textures = {"vlc_charges_" .. name .. "_entity.png"},
		hp_max = 20,
		collisionbox = {-0.1,-0.1,-0.1, 0.1,0.0,0.1},
		collide_with_objects = true,
	},
		hit_player = def.hit_player,
		hit_mob = def.hit_mob,
		on_activate = def.on_activate,
		on_step = function(self, dtime)
			local pos = self.object:get_pos()
			local node = minetest.get_node(pos)
			local n = node.name
			local dpos = vector.round(vector.new(pos)) -- digital pos
				if n ~= "air" then
					def.hit_node(self, pos, node)
					self.object:remove()
				end
				local bdef = minetest.registered_nodes[node.name]
				if (bdef and bdef._on_wind_charge_hit) then
					bdef._on_wind_charge_hit(dpos, self)
				end
					if self.hit_player or self.hit_mob or self.hit_object then
						for _,player in pairs(minetest.get_objects_inside_radius(pos, 0.6)) do
							if self.hit_player and player:is_player() then
								self.hit_player(self, player)
								def.hit_player_alt(self, pos)
								minetest.after(0.01, function()
									if self.object:get_luaentity() then
										self.object:remove()
									end
								end)
					return
			end
			local entity = player:get_luaentity()
				if entity then
					if self.hit_mob	and entity.is_mob then
						self.hit_mob(self, player)
						def.hit_mob_alt(self, pos)
						self.object:remove()
					return
				end
					if self.hit_object and (not entity.is_mob) and tostring(player) ~= self.owner_id and entity.name ~= self.object:get_luaentity().name then
						self.hit_object(self, player)
						def.hit_player_alt(self, pos)
						self.object:remove()
					return
				end
			end
		end
	end
		self.lastpos = pos
	end,
	})
end

dofile(modpath.."/wind_charge.lua")