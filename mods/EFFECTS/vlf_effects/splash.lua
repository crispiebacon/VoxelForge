local S = minetest.get_translator(minetest.get_current_modname())
local GRAVITY = tonumber(minetest.settings:get("movement_gravity"))

local mod_target = minetest.get_modpath("vlf_target")

local function splash_image(colorstring, opacity)
	if not opacity then
		opacity = 127
	end
	return "vlf_entity_effects_splash_overlay.png^[colorize:"..colorstring..":"..tostring(opacity).."^vlf_entity_effects_splash_bottle.png"
end


function vlf_entity_effects.register_splash(name, descr, color, def)
	local id = "vlf_entity_effects:"..name.."_splash"
	local longdesc = def.longdesc
	if not def.no_effect then
		longdesc = S("A throwable entity_effect that will shatter on impact, where it gives all nearby players and mobs a status effect.")
		if def.longdesc then
			longdesc = longdesc .. "\n" .. def.longdesc
		end
	end
	local groups = {brewitem=1, bottle=1, splash_entity_effect=1, _vlf_entity_effect=1}
	if def.nocreative then groups.not_in_creative_inventory = 1 end
	minetest.register_craftitem(id, {
		description = descr,
		_tt_help = def.tt,
		_doc_items_longdesc = longdesc,
		_doc_items_usagehelp = S("Use the “Punch” key to throw it."),
		inventory_image = splash_image(color),
		groups = groups,
		on_use = function(item, placer, pointed_thing)
			local velocity = 10
			local dir = placer:get_look_dir();
			local pos = placer:get_pos();
			minetest.sound_play("vlf_throwing_throw", {pos = pos, gain = 0.4, max_hear_distance = 16}, true)
			local obj = minetest.add_entity({x=pos.x+dir.x,y=pos.y+2+dir.y,z=pos.z+dir.z}, id.."_flying")
			obj:set_velocity({x=dir.x*velocity,y=dir.y*velocity,z=dir.z*velocity})
			obj:set_acceleration({x=dir.x*-3, y=-9.8, z=dir.z*-3})
			obj:get_luaentity()._thrower = placer:get_player_name()
			if not minetest.is_creative_enabled(placer:get_player_name()) then
				item:take_item()
			end
			return item
		end,
		stack_max = 1,
		_on_dispense = function(stack, dispenserpos, droppos, dropnode, dropdir)
			local s_pos = vector.add(dispenserpos, vector.multiply(dropdir, 0.51))
			local pos = {x=s_pos.x+dropdir.x,y=s_pos.y+dropdir.y,z=s_pos.z+dropdir.z}
			minetest.sound_play("vlf_throwing_throw", {pos = pos, gain = 0.4, max_hear_distance = 16}, true)
			local obj = minetest.add_entity(pos, id.."_flying")
			if obj and obj:get_pos() then
				local velocity = 22
				obj:set_velocity({x=dropdir.x*velocity,y=dropdir.y*velocity,z=dropdir.z*velocity})
				obj:set_acceleration({x=dropdir.x*-3, y=-9.8, z=dropdir.z*-3})
			end
		end
	})

	local w = 0.7

	minetest.register_entity(id.."_flying",{
		initial_properties = {
			textures = {splash_image(color)},
			hp_max = 1,
			visual_size = {x=w/2,y=w/2},
			collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
			pointable = false,
		},
		on_step = function(self, dtime)
			local pos = self.object:get_pos()
			local node = minetest.get_node(pos)
			local n = node.name
			local g = minetest.get_item_group(n, "liquid")
			local d = 0.1
			local redux_map = {7/8,0.5,0.25}
			if mod_target and n == "vlf_target:target_off" then
				vlf_target.hit(vector.round(pos), 0.4) --4 redstone ticks
			end
			if n ~= "air" and n ~= "vlf_portals:portal" and n ~= "vlf_portals:portal_end" and g == 0 or vlf_entity_effects.is_obj_hit(self, pos) then
				minetest.sound_play("vlf_entity_effects_breaking_glass", {pos = pos, max_hear_distance = 16, gain = 1})
				local texture, acc
				if name == "water" then
					texture = "vlf_particles_droplet_bottle.png"
					acc = {x=0, y=-GRAVITY, z=0}
				else
					if def.instant then
						texture = "vlf_particles_instant_effect.png"
					else
						texture = "vlf_particles_effect.png"
					end
					acc = {x=0, y=0, z=0}
				end
				minetest.add_particlespawner({
					amount = 50,
					time = 0.1,
					minpos = {x=pos.x-d, y=pos.y+0.5, z=pos.z-d},
					maxpos = {x=pos.x+d, y=pos.y+0.5+d, z=pos.z+d},
					minvel = {x=-2, y=0, z=-2},
					maxvel = {x=2, y=2, z=2},
					minacc = acc,
					maxacc = acc,
					minexptime = 0.5,
					maxexptime = 1.25,
					minsize = 1,
					maxsize = 2,
					collisiondetection = true,
					vertical = false,
					texture = texture.."^[colorize:"..color..":127"
				})

				if name == "water" then
					vlf_entity_effects._extinguish_nearby_fire(pos)
				end
				self.object:remove()
				for _,obj in pairs(minetest.get_objects_inside_radius(pos, 4)) do

					local entity = obj:get_luaentity()
					if obj:is_player() or entity and entity.is_mob then
						local potency = 1
						local plus = 1
						local pos2 = obj:get_pos()
						local rad = math.floor(math.sqrt((pos2.x-pos.x)^2 + (pos2.y-pos.y)^2 + (pos2.z-pos.z)^2))
						if def._effect_list then
							local ef_level
							local dur
							for name, details in pairs(def._effect_list) do
								if details.uses_level then
									ef_level = details.level + details.level_scaling * (potency)
								else
									ef_level = details.level
								end
								if details.dur_variable then
									dur = details.dur * math.pow(vlf_entity_effects.PLUS_FACTOR, plus)
									if potency>0 and details.uses_level then
										dur = dur / math.pow(vlf_entity_effects.POTENT_FACTOR, potency)
									end
									dur = dur * vlf_entity_effects.SPLASH_FACTOR
								else
									dur = details.dur
								end
								if details.effect_stacks then
									ef_level = ef_level + vlf_entity_effects.get_effect_level(obj, name)
								end
								if rad > 0 then
									vlf_entity_effects.give_effect_by_level(name, obj, ef_level, redux_map[rad]*dur)
								else
									vlf_entity_effects.give_effect_by_level(name, obj, ef_level, dur)
								end
							end
						end

						if def.custom_effect then
							local power = (potency+1) * vlf_entity_effects.SPLASH_FACTOR
							if rad > 0 then
								def.custom_effect(obj, redux_map[rad] * power, plus)
							else
								def.custom_effect(obj, power, plus)
							end
						end
					end
				end

			end
		end,
	})
end

--[[local function time_string(dur)
	return math.floor(dur/60)..string.format(":%02d",math.floor(dur % 60))
end]]
