--[------[ TRADING ]------]

-- LIST OF VILLAGER PROFESSIONS AND TRADES

-- TECHNICAL RESTRICTIONS (FIXME):
-- * You can't use a clock as requested item
-- * You can't use a compass as requested item if its stack size > 1
-- * You can't use a compass in the second requested slot
<<<<<<< HEAD
-- This is a problem in the vlc_compass and vlc_clock mods,
=======
-- This is a problem in the vlf_compass and vlf_clock mods,
>>>>>>> 3eb27be82 (change naming in mods)
-- these items should be implemented as single items, then everything
-- will be much easier.


local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)

local function E(f, t)
<<<<<<< HEAD
	return { "vlc_core:emerald", f or 1, t or f or 1 }
=======
	return { "vlf_core:emerald", f or 1, t or f or 1 }
>>>>>>> 3eb27be82 (change naming in mods)
end

return {
	unemployed = {
		name = S("Unemployed"),
		textures = {
				"mobs_mc_villager.png",
				"mobs_mc_villager.png",
			},
		trades = nil,
	},
	farmer = {
		name = S("Farmer"),
		texture = "mobs_mc_villager_farmer.png",
<<<<<<< HEAD
		jobsite = "vlc_composters:composter",
		trades = {
			{
			{ { "vlc_farming:wheat_item", 20, 20, }, E() },
			{ { "vlc_farming:potato_item", 26, 26, }, E() },
			{ { "vlc_farming:carrot_item", 22, 22, }, E() },
			{ { "vlc_farming:beetroot_item", 15, 15 }, E() },
			{ E(), { "vlc_farming:bread", 6, 6 } },
			},

			{
			{ { "vlc_farming:pumpkin", 6, 6 }, E() },
			{ E(), { "vlc_farming:pumpkin_pie", 4, 4 } },
			{ E(), { "vlc_core:apple", 4, 4 } },
			},

			{
			{ { "vlc_farming:melon", 4, 4 }, E() },
			{ E(3), {"vlc_farming:cookie", 18, 18 }, },
			},

			{
			{ E(), { "vlc_cake:cake", 1, 1 } },
			{ E(), { "vlc_sus_stew:stew", 1, 1 } },
			},

			{
			{ E(3), { "vlc_farming:carrot_item_gold", 3, 3 } },
			{ E(4), { "vlc_potions:speckled_melon", 3, 3 } },
=======
		jobsite = "vlf_composters:composter",
		trades = {
			{
			{ { "vlf_farming:wheat_item", 20, 20, }, E() },
			{ { "vlf_farming:potato_item", 26, 26, }, E() },
			{ { "vlf_farming:carrot_item", 22, 22, }, E() },
			{ { "vlf_farming:beetroot_item", 15, 15 }, E() },
			{ E(), { "vlf_farming:bread", 6, 6 } },
			},

			{
			{ { "vlf_farming:pumpkin", 6, 6 }, E() },
			{ E(), { "vlf_farming:pumpkin_pie", 4, 4 } },
			{ E(), { "vlf_core:apple", 4, 4 } },
			},

			{
			{ { "vlf_farming:melon", 4, 4 }, E() },
			{ E(3), {"vlf_farming:cookie", 18, 18 }, },
			},

			{
			{ E(), { "vlf_cake:cake", 1, 1 } },
			{ E(), { "vlf_sus_stew:stew", 1, 1 } },
			},

			{
			{ E(3), { "vlf_farming:carrot_item_gold", 3, 3 } },
			{ E(4), { "vlf_potions:speckled_melon", 3, 3 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		}
	},
	fisherman = {
		name = S("Fisherman"),
		texture = "mobs_mc_villager_fisherman.png",
<<<<<<< HEAD
		jobsite = "vlc_barrels:barrel_closed",
		trades = {
			{
			{ { "vlc_mobitems:string", 20, 20 }, E() },
			{ { "vlc_core:coal_lump", 10, 10 }, E() },
			{ { "vlc_core:emerald", 1, 1, "vlc_fishing:fish_raw", 6, 6 }, { "vlc_fishing:fish_cooked", 6, 6 } },
			{ E(3), { "vlc_buckets:bucket_cod", 1, 1 } },
			},

			{
			{ { "vlc_fishing:fish_raw", 15, 15 }, E() },
			{ { "vlc_core:emerald", 1, 1, "vlc_fishing:salmon_raw", 6, 6 }, { "vlc_fishing:salmon_cooked", 6, 6 } },
			{ E(2), {"vlc_campfires:campfire_lit", 1, 1 } },
			},

			{
			{ { "vlc_fishing:salmon_raw", 13, 13 }, E() },
			{ E(8,22), { "vlc_fishing:fishing_rod_enchanted", 1, 1 } },
			},

			{
			{ { "vlc_fishing:clownfish_raw", 6, 6 }, E() },
			},

			{
			{ { "vlc_fishing:pufferfish_raw", 4, 4 }, E() },

			--Boat cherry?
			{ { "vlc_boats:boat", 1, 1 }, E() },
			{ { "vlc_boats:boat_acacia", 1, 1 }, E() },
			{ { "vlc_boats:boat_spruce", 1, 1 }, E() },
			{ { "vlc_boats:boat_dark_oak", 1, 1 }, E() },
			{ { "vlc_boats:boat_birch", 1, 1 }, E() },
=======
		jobsite = "vlf_barrels:barrel_closed",
		trades = {
			{
			{ { "vlf_mobitems:string", 20, 20 }, E() },
			{ { "vlf_core:coal_lump", 10, 10 }, E() },
			{ { "vlf_core:emerald", 1, 1, "vlf_fishing:fish_raw", 6, 6 }, { "vlf_fishing:fish_cooked", 6, 6 } },
			{ E(3), { "vlf_buckets:bucket_cod", 1, 1 } },
			},

			{
			{ { "vlf_fishing:fish_raw", 15, 15 }, E() },
			{ { "vlf_core:emerald", 1, 1, "vlf_fishing:salmon_raw", 6, 6 }, { "vlf_fishing:salmon_cooked", 6, 6 } },
			{ E(2), {"vlf_campfires:campfire_lit", 1, 1 } },
			},

			{
			{ { "vlf_fishing:salmon_raw", 13, 13 }, E() },
			{ E(8,22), { "vlf_fishing:fishing_rod_enchanted", 1, 1 } },
			},

			{
			{ { "vlf_fishing:clownfish_raw", 6, 6 }, E() },
			},

			{
			{ { "vlf_fishing:pufferfish_raw", 4, 4 }, E() },

			--Boat cherry?
			{ { "vlf_boats:boat", 1, 1 }, E() },
			{ { "vlf_boats:boat_acacia", 1, 1 }, E() },
			{ { "vlf_boats:boat_spruce", 1, 1 }, E() },
			{ { "vlf_boats:boat_dark_oak", 1, 1 }, E() },
			{ { "vlf_boats:boat_birch", 1, 1 }, E() },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	fletcher = {
		name = S("Fletcher"),
		texture = "mobs_mc_villager_fletcher.png",
<<<<<<< HEAD
		jobsite = "vlc_fletching_table:fletching_table",
		trades = {
			{
			{ { "vlc_core:stick", 32, 32 }, E() },
			{ E(), { "vlc_bows:arrow", 16, 16 } },
			{ { "vlc_core:emerald", 1, 1, "vlc_core:gravel", 10, 10 }, { "vlc_core:flint", 10, 10 } },
			},

			{
			{ { "vlc_core:flint", 26, 26 }, E() },
			{ E(2), { "vlc_bows:bow", 1, 1 } },
			},

			{
			{ { "vlc_mobitems:string", 14, 14 }, E() },
			{ E(3), { "vlc_bows:crossbow", 1, 1 } },
			},

			{
			{ { "vlc_mobitems:feather", 24, 24 }, E() },
			{ E(7, 21) , { "vlc_bows:bow_enchanted", 1, 1 } },
=======
		jobsite = "vlf_fletching_table:fletching_table",
		trades = {
			{
			{ { "vlf_core:stick", 32, 32 }, E() },
			{ E(), { "vlf_bows:arrow", 16, 16 } },
			{ { "vlf_core:emerald", 1, 1, "vlf_core:gravel", 10, 10 }, { "vlf_core:flint", 10, 10 } },
			},

			{
			{ { "vlf_core:flint", 26, 26 }, E() },
			{ E(2), { "vlf_bows:bow", 1, 1 } },
			},

			{
			{ { "vlf_mobitems:string", 14, 14 }, E() },
			{ E(3), { "vlf_bows:crossbow", 1, 1 } },
			},

			{
			{ { "vlf_mobitems:feather", 24, 24 }, E() },
			{ E(7, 21) , { "vlf_bows:bow_enchanted", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},

			{
			--FIXME: supposed to be tripwire hook{ { "tripwirehook", 8, 8 }, E() },
<<<<<<< HEAD
			{ E(8, 22) , { "vlc_bows:crossbow_enchanted", 1, 1 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:healing_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:harming_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:night_vision_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:swiftness_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:slowness_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:leaping_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:poison_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:regeneration_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:invisibility_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:water_breathing_arrow", 5, 5 } },
			{ { "vlc_core:emerald", 2, 2, "vlc_bows:arrow", 5, 5 }, { "vlc_potions:fire_resistance_arrow", 5, 5 } },
=======
			{ E(8, 22) , { "vlf_bows:crossbow_enchanted", 1, 1 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:healing_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:harming_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:night_vision_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:swiftness_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:slowness_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:leaping_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:poison_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:regeneration_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:invisibility_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:water_breathing_arrow", 5, 5 } },
			{ { "vlf_core:emerald", 2, 2, "vlf_bows:arrow", 5, 5 }, { "vlf_potions:fire_resistance_arrow", 5, 5 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		}
	},
	shepherd ={
		name = S("Shepherd"),
		texture =  "mobs_mc_villager_sheperd.png",
<<<<<<< HEAD
		jobsite = "vlc_loom:loom",
		trades = {
			{
			{ { "vlc_wool:white", 18, 18 }, E() },
			{ { "vlc_wool:brown", 18, 18 }, E() },
			{ { "vlc_wool:black", 18, 18 }, E() },
			{ { "vlc_wool:grey", 18, 18 }, E() },
			{ E(2), { "vlc_tools:shears", 1, 1 } },
			},

			{
			{ { "vlc_dyes:black", 12, 12 }, E() },
			{ { "vlc_dyes:dark_grey", 12, 12 }, E() },
			{ { "vlc_dyes:green", 12, 12 }, E() },
			{ { "vlc_dyes:lightblue", 12, 12 }, E() },
			{ { "vlc_dyes:white", 12, 12 }, E() },

			{ E(), { "vlc_wool:white", 1, 1 } },
			{ E(), { "vlc_wool:grey", 1, 1 } },
			{ E(), { "vlc_wool:silver", 1, 1 } },
			{ E(), { "vlc_wool:black", 1, 1 } },
			{ E(), { "vlc_wool:yellow", 1, 1 } },
			{ E(), { "vlc_wool:orange", 1, 1 } },
			{ E(), { "vlc_wool:red", 1, 1 } },
			{ E(), { "vlc_wool:magenta", 1, 1 } },
			{ E(), { "vlc_wool:purple", 1, 1 } },
			{ E(), { "vlc_wool:blue", 1, 1 } },
			{ E(), { "vlc_wool:cyan", 1, 1 } },
			{ E(), { "vlc_wool:lime", 1, 1 } },
			{ E(), { "vlc_wool:green", 1, 1 } },
			{ E(), { "vlc_wool:pink", 1, 1 } },
			{ E(), { "vlc_wool:light_blue", 1, 1 } },
			{ E(), { "vlc_wool:brown", 1, 1 } },

			{ E(), { "vlc_wool:white_carpet", 4, 4 } },
			{ E(), { "vlc_wool:grey_carpet", 4, 4 } },
			{ E(), { "vlc_wool:silver_carpet", 4, 4 } },
			{ E(), { "vlc_wool:black_carpet", 4, 4 } },
			{ E(), { "vlc_wool:yellow_carpet", 4, 4 } },
			{ E(), { "vlc_wool:orange_carpet", 4, 4 } },
			{ E(), { "vlc_wool:red_carpet", 4, 4 } },
			{ E(), { "vlc_wool:magenta_carpet", 4, 4 } },
			{ E(), { "vlc_wool:purple_carpet", 4, 4 } },
			{ E(), { "vlc_wool:blue_carpet", 4, 4 } },
			{ E(), { "vlc_wool:cyan_carpet", 4, 4 } },
			{ E(), { "vlc_wool:lime_carpet", 4, 4 } },
			{ E(), { "vlc_wool:green_carpet", 4, 4 } },
			{ E(), { "vlc_wool:pink_carpet", 4, 4 } },
			{ E(), { "vlc_wool:light_blue_carpet", 4, 4 } },
			{ E(), { "vlc_wool:brown_carpet", 4, 4 } },
			},

			{
			{ { "vlc_dyes:red", 12, 12 }, E() },
			{ { "vlc_dyes:grey", 12, 12 }, E() },
			{ { "vlc_dyes:pink", 12, 12 }, E() },
			{ { "vlc_dyes:yellow", 12, 12 }, E() },
			{ { "vlc_dyes:orange", 12, 12 }, E() },

			{ E(3), { "vlc_beds:bed_red_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_blue_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_cyan_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_grey_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_silver_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_black_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_yellow_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_green_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_magenta_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_orange_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_purple_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_brown_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_pink_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_lime_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_light_blue_bottom", 1, 1 } },
			{ E(3), { "vlc_beds:bed_white_bottom", 1, 1 } },
			},

			{
			{ { "vlc_dyes:dark_green", 12, 12 }, E() },
			{ { "vlc_dyes:brown", 12, 12 }, E() },
			{ { "vlc_dyes:blue", 12, 12 }, E() },
			{ { "vlc_dyes:violet", 12, 12 }, E() },
			{ { "vlc_dyes:cyan", 12, 12 }, E() },
			{ { "vlc_dyes:magenta", 12, 12 }, E() },

			{ E(3), { "vlc_banners:banner_item_white", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_grey", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_silver", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_black", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_red", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_yellow", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_green", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_cyan", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_blue", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_magenta", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_orange", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_purple", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_brown", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_pink", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_lime", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_light_blue", 1, 1 } },
			},

			{
			{ E(2), { "vlc_paintings:painting", 3, 3 } },
=======
		jobsite = "vlf_loom:loom",
		trades = {
			{
			{ { "vlf_wool:white", 18, 18 }, E() },
			{ { "vlf_wool:brown", 18, 18 }, E() },
			{ { "vlf_wool:black", 18, 18 }, E() },
			{ { "vlf_wool:grey", 18, 18 }, E() },
			{ E(2), { "vlf_tools:shears", 1, 1 } },
			},

			{
			{ { "vlf_dyes:black", 12, 12 }, E() },
			{ { "vlf_dyes:dark_grey", 12, 12 }, E() },
			{ { "vlf_dyes:green", 12, 12 }, E() },
			{ { "vlf_dyes:lightblue", 12, 12 }, E() },
			{ { "vlf_dyes:white", 12, 12 }, E() },

			{ E(), { "vlf_wool:white", 1, 1 } },
			{ E(), { "vlf_wool:grey", 1, 1 } },
			{ E(), { "vlf_wool:silver", 1, 1 } },
			{ E(), { "vlf_wool:black", 1, 1 } },
			{ E(), { "vlf_wool:yellow", 1, 1 } },
			{ E(), { "vlf_wool:orange", 1, 1 } },
			{ E(), { "vlf_wool:red", 1, 1 } },
			{ E(), { "vlf_wool:magenta", 1, 1 } },
			{ E(), { "vlf_wool:purple", 1, 1 } },
			{ E(), { "vlf_wool:blue", 1, 1 } },
			{ E(), { "vlf_wool:cyan", 1, 1 } },
			{ E(), { "vlf_wool:lime", 1, 1 } },
			{ E(), { "vlf_wool:green", 1, 1 } },
			{ E(), { "vlf_wool:pink", 1, 1 } },
			{ E(), { "vlf_wool:light_blue", 1, 1 } },
			{ E(), { "vlf_wool:brown", 1, 1 } },

			{ E(), { "vlf_wool:white_carpet", 4, 4 } },
			{ E(), { "vlf_wool:grey_carpet", 4, 4 } },
			{ E(), { "vlf_wool:silver_carpet", 4, 4 } },
			{ E(), { "vlf_wool:black_carpet", 4, 4 } },
			{ E(), { "vlf_wool:yellow_carpet", 4, 4 } },
			{ E(), { "vlf_wool:orange_carpet", 4, 4 } },
			{ E(), { "vlf_wool:red_carpet", 4, 4 } },
			{ E(), { "vlf_wool:magenta_carpet", 4, 4 } },
			{ E(), { "vlf_wool:purple_carpet", 4, 4 } },
			{ E(), { "vlf_wool:blue_carpet", 4, 4 } },
			{ E(), { "vlf_wool:cyan_carpet", 4, 4 } },
			{ E(), { "vlf_wool:lime_carpet", 4, 4 } },
			{ E(), { "vlf_wool:green_carpet", 4, 4 } },
			{ E(), { "vlf_wool:pink_carpet", 4, 4 } },
			{ E(), { "vlf_wool:light_blue_carpet", 4, 4 } },
			{ E(), { "vlf_wool:brown_carpet", 4, 4 } },
			},

			{
			{ { "vlf_dyes:red", 12, 12 }, E() },
			{ { "vlf_dyes:grey", 12, 12 }, E() },
			{ { "vlf_dyes:pink", 12, 12 }, E() },
			{ { "vlf_dyes:yellow", 12, 12 }, E() },
			{ { "vlf_dyes:orange", 12, 12 }, E() },

			{ E(3), { "vlf_beds:bed_red_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_blue_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_cyan_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_grey_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_silver_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_black_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_yellow_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_green_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_magenta_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_orange_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_purple_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_brown_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_pink_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_lime_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_light_blue_bottom", 1, 1 } },
			{ E(3), { "vlf_beds:bed_white_bottom", 1, 1 } },
			},

			{
			{ { "vlf_dyes:dark_green", 12, 12 }, E() },
			{ { "vlf_dyes:brown", 12, 12 }, E() },
			{ { "vlf_dyes:blue", 12, 12 }, E() },
			{ { "vlf_dyes:violet", 12, 12 }, E() },
			{ { "vlf_dyes:cyan", 12, 12 }, E() },
			{ { "vlf_dyes:magenta", 12, 12 }, E() },

			{ E(3), { "vlf_banners:banner_item_white", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_grey", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_silver", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_black", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_red", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_yellow", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_green", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_cyan", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_blue", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_magenta", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_orange", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_purple", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_brown", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_pink", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_lime", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_light_blue", 1, 1 } },
			},

			{
			{ E(2), { "vlf_paintings:painting", 3, 3 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	librarian = {
		name = S("Librarian"),
		texture = "mobs_mc_villager_librarian.png",
<<<<<<< HEAD
		jobsite = "vlc_lectern:lectern",
		trades = {
			{
			{ { "vlc_core:paper", 24, 24 }, E() },
			{ { "vlc_core:emerald", 5, 64, "vlc_books:book", 1, 1 }, { "vlc_enchanting:book_enchanted", 1 ,1 } },
			{ E(9), { "vlc_books:bookshelf", 1 ,1 } },
			},

			{
			{ { "vlc_books:book", 4, 4 }, E() },
			{ { "vlc_core:emerald", 5, 64, "vlc_books:book", 1, 1 }, { "vlc_enchanting:book_enchanted", 1 ,1 } },
			{ E(), { "vlc_lanterns:lantern_floor", 1, 1 } },
			},

			{
			{ { "vlc_mobitems:ink_sac", 5, 5 }, E() },
			{ { "vlc_core:emerald", 5, 64, "vlc_books:book", 1, 1 }, { "vlc_enchanting:book_enchanted", 1 ,1 } },
			{ E(), { "vlc_core:glass", 4, 4 } },
			},

			{
			{ { "vlc_books:writable_book", 1, 1 }, E() },
			{ { "vlc_core:emerald", 5, 64, "vlc_books:book", 1, 1 }, { "vlc_enchanting:book_enchanted", 1 ,1 } },
			{ E(5), { "vlc_clock:clock", 1, 1 } },
			{ E(4), { "vlc_compass:compass", 1 ,1 } },
			},

			{
			{ E(20), { "vlc_mobs:nametag", 1, 1 } },
=======
		jobsite = "vlf_lectern:lectern",
		trades = {
			{
			{ { "vlf_core:paper", 24, 24 }, E() },
			{ { "vlf_core:emerald", 5, 64, "vlf_books:book", 1, 1 }, { "vlf_enchanting:book_enchanted", 1 ,1 } },
			{ E(9), { "vlf_books:bookshelf", 1 ,1 } },
			},

			{
			{ { "vlf_books:book", 4, 4 }, E() },
			{ { "vlf_core:emerald", 5, 64, "vlf_books:book", 1, 1 }, { "vlf_enchanting:book_enchanted", 1 ,1 } },
			{ E(), { "vlf_lanterns:lantern_floor", 1, 1 } },
			},

			{
			{ { "vlf_mobitems:ink_sac", 5, 5 }, E() },
			{ { "vlf_core:emerald", 5, 64, "vlf_books:book", 1, 1 }, { "vlf_enchanting:book_enchanted", 1 ,1 } },
			{ E(), { "vlf_core:glass", 4, 4 } },
			},

			{
			{ { "vlf_books:writable_book", 1, 1 }, E() },
			{ { "vlf_core:emerald", 5, 64, "vlf_books:book", 1, 1 }, { "vlf_enchanting:book_enchanted", 1 ,1 } },
			{ E(5), { "vlf_clock:clock", 1, 1 } },
			{ E(4), { "vlf_compass:compass", 1 ,1 } },
			},

			{
			{ E(20), { "vlf_mobs:nametag", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			}
		},
	},
	cartographer = {
		name = S("Cartographer"),
		texture = "mobs_mc_villager_cartographer.png",
<<<<<<< HEAD
		jobsite = "vlc_cartography_table:cartography_table",
		trades = {
			{
			{ { "vlc_core:paper", 24, 24 }, E() },
			{ E(7), { "vlc_maps:empty_map", 1, 1 } },
			},

			{
			{ { "vlc_panes:pane_natural_flat", 11, 11 }, E() },
			--{ { "vlc_core:emerald", 13, 13, "vlc_compass:compass", 1, 1 }, { "FIXME:ocean explorer map" 1, 1 } },
			},

			{
			{ { "vlc_compass:compass", 1, 1 }, E() },
			--{ { "vlc_core:emerald", 14, 14, "vlc_compass:compass", 1, 1 }, { "FIXME:woodland explorer map" 1, 1 } },
			},

			{
			{ E(7), { "vlc_itemframes:frame", 1, 1 } },

			{ E(3), { "vlc_banners:banner_item_white", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_grey", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_silver", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_black", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_red", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_yellow", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_green", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_cyan", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_blue", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_magenta", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_orange", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_purple", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_brown", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_pink", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_lime", 1, 1 } },
			{ E(3), { "vlc_banners:banner_item_light_blue", 1, 1 } },
			},

			{
			{ E(8), { "vlc_banners:pattern_globe", 1, 1 } },
=======
		jobsite = "vlf_cartography_table:cartography_table",
		trades = {
			{
			{ { "vlf_core:paper", 24, 24 }, E() },
			{ E(7), { "vlf_maps:empty_map", 1, 1 } },
			},

			{
			{ { "vlf_panes:pane_natural_flat", 11, 11 }, E() },
			--{ { "vlf_core:emerald", 13, 13, "vlf_compass:compass", 1, 1 }, { "FIXME:ocean explorer map" 1, 1 } },
			},

			{
			{ { "vlf_compass:compass", 1, 1 }, E() },
			--{ { "vlf_core:emerald", 14, 14, "vlf_compass:compass", 1, 1 }, { "FIXME:woodland explorer map" 1, 1 } },
			},

			{
			{ E(7), { "vlf_itemframes:frame", 1, 1 } },

			{ E(3), { "vlf_banners:banner_item_white", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_grey", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_silver", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_black", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_red", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_yellow", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_green", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_cyan", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_blue", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_magenta", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_orange", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_purple", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_brown", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_pink", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_lime", 1, 1 } },
			{ E(3), { "vlf_banners:banner_item_light_blue", 1, 1 } },
			},

			{
			{ E(8), { "vlf_banners:pattern_globe", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	armorer = {
		name = S("Armorer"),
		texture = "mobs_mc_villager_armorer.png",
<<<<<<< HEAD
		jobsite = "vlc_blast_furnace:blast_furnace",
		trades = {
			{
			{ { "vlc_core:coal_lump", 15, 15 }, E() },
			{ E(5), { "vlc_armor:helmet_iron", 1, 1 } },
			{ E(9), { "vlc_armor:chestplate_iron", 1, 1 } },
			{ E(7), { "vlc_armor:leggings_iron", 1, 1 } },
			{ E(4), { "vlc_armor:boots_iron", 1, 1 } },
			},

			{
			{ { "vlc_core:iron_ingot", 4, 4 }, E() },
			{ { "vlc_core:emerald", 36, 36 }, { "vlc_bells:bell", 1, 1 } },
			{ E(3), { "vlc_armor:leggings_chain", 1, 1 } },
			{ E(), { "vlc_armor:boots_chain", 1, 1 } },
			},

			{
			{ { "vlc_buckets:bucket_lava", 1, 1 }, E() },
			{ { "vlc_core:diamond", 1, 1 }, E() },
			{ E(), { "vlc_armor:helmet_chain", 1, 1 } },
			{ E(4), { "vlc_armor:chestplate_chain", 1, 1 } },
			{ E(5), { "vlc_shields:shield", 1, 1 } },
			},

			{
			{ E(19, 33), { "vlc_armor:leggings_diamond_enchanted", 1, 1 } },
			{ E(13, 27), { "vlc_armor:boots_diamond_enchanted", 1, 1 } },
			},

			{
			{ E(13, 27), { "vlc_armor:helmet_diamond_enchanted", 1, 1 } },
			{ E(21, 35), { "vlc_armor:chestplate_diamond_enchanted", 1, 1 } },
=======
		jobsite = "vlf_blast_furnace:blast_furnace",
		trades = {
			{
			{ { "vlf_core:coal_lump", 15, 15 }, E() },
			{ E(5), { "vlf_armor:helmet_iron", 1, 1 } },
			{ E(9), { "vlf_armor:chestplate_iron", 1, 1 } },
			{ E(7), { "vlf_armor:leggings_iron", 1, 1 } },
			{ E(4), { "vlf_armor:boots_iron", 1, 1 } },
			},

			{
			{ { "vlf_core:iron_ingot", 4, 4 }, E() },
			{ { "vlf_core:emerald", 36, 36 }, { "vlf_bells:bell", 1, 1 } },
			{ E(3), { "vlf_armor:leggings_chain", 1, 1 } },
			{ E(), { "vlf_armor:boots_chain", 1, 1 } },
			},

			{
			{ { "vlf_buckets:bucket_lava", 1, 1 }, E() },
			{ { "vlf_core:diamond", 1, 1 }, E() },
			{ E(), { "vlf_armor:helmet_chain", 1, 1 } },
			{ E(4), { "vlf_armor:chestplate_chain", 1, 1 } },
			{ E(5), { "vlf_shields:shield", 1, 1 } },
			},

			{
			{ E(19, 33), { "vlf_armor:leggings_diamond_enchanted", 1, 1 } },
			{ E(13, 27), { "vlf_armor:boots_diamond_enchanted", 1, 1 } },
			},

			{
			{ E(13, 27), { "vlf_armor:helmet_diamond_enchanted", 1, 1 } },
			{ E(21, 35), { "vlf_armor:chestplate_diamond_enchanted", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	leatherworker = {
		name = S("Leatherworker"),
		texture = "mobs_mc_villager_leatherworker.png",
		jobsite = "group:cauldron",
		trades = {
			{
<<<<<<< HEAD
			{ { "vlc_mobitems:leather", 6, 6 }, E() },
			{ E(3), { "vlc_armor:leggings_leather", 1, 1 } },
			{ E(7), { "vlc_armor:chestplate_leather", 1, 1 } },
			},

			{
			{ { "vlc_core:flint", 26, 26 }, E() },
			{ E(5), { "vlc_armor:helmet_leather", 1, 1 } },
			{ E(4), { "vlc_armor:boots_leather", 1, 1 } },
			},

			{
			{ { "vlc_mobitems:rabbit_hide", 9, 9 }, E() },
			{ E(7), { "vlc_armor:chestplate_leather", 1, 1 } },
=======
			{ { "vlf_mobitems:leather", 6, 6 }, E() },
			{ E(3), { "vlf_armor:leggings_leather", 1, 1 } },
			{ E(7), { "vlf_armor:chestplate_leather", 1, 1 } },
			},

			{
			{ { "vlf_core:flint", 26, 26 }, E() },
			{ E(5), { "vlf_armor:helmet_leather", 1, 1 } },
			{ E(4), { "vlf_armor:boots_leather", 1, 1 } },
			},

			{
			{ { "vlf_mobitems:rabbit_hide", 9, 9 }, E() },
			{ E(7), { "vlf_armor:chestplate_leather", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},

			{
			--{ { "FIXME: scute", 4, 4 }, E() },
<<<<<<< HEAD
			{ E(8, 10), { "vlc_mobitems:saddle", 1, 1 } },
			--FIXME: { { "vlc_core:emerald", 6, 6 }, { "vlc_mobitems:leather_horse_armor", 1, 1 } },
			},

			{
			{ E(6), { "vlc_mobitems:saddle", 1, 1 } },
			{ E(5), { "vlc_armor:helmet_leather", 1, 1 } },
=======
			{ E(8, 10), { "vlf_mobitems:saddle", 1, 1 } },
			--FIXME: { { "vlf_core:emerald", 6, 6 }, { "vlf_mobitems:leather_horse_armor", 1, 1 } },
			},

			{
			{ E(6), { "vlf_mobitems:saddle", 1, 1 } },
			{ E(5), { "vlf_armor:helmet_leather", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	butcher = {
		name = S("Butcher"),
		texture = "mobs_mc_villager_butcher.png",
<<<<<<< HEAD
		jobsite = "vlc_smoker:smoker",
		trades = {
			{
			{ { "vlc_mobitems:chicken", 14, 14 }, E() },
			{ { "vlc_mobitems:porkchop", 7, 7 }, E() },
			{ { "vlc_mobitems:rabbit", 4, 4 }, E() },
			{ E(), { "vlc_mobitems:rabbit_stew", 1, 1 } },
			},

			{
			{ { "vlc_core:coal_lump", 15, 15 }, E() },
			{ E(), { "vlc_mobitems:cooked_porkchop", 5, 5 } },
			{ E(), { "vlc_mobitems:cooked_chicken", 8, 8 } },
			},

			{
			{ { "vlc_mobitems:mutton", 7, 7 }, E() },
			{ { "vlc_mobitems:beef", 10, 10 }, E() },
			},

			{
			{ { "vlc_ocean:dried_kelp_block", 10, 10 }, E() },
			},

			{
			{ { "vlc_farming:sweet_berry", 10, 10 }, E() },
=======
		jobsite = "vlf_smoker:smoker",
		trades = {
			{
			{ { "vlf_mobitems:chicken", 14, 14 }, E() },
			{ { "vlf_mobitems:porkchop", 7, 7 }, E() },
			{ { "vlf_mobitems:rabbit", 4, 4 }, E() },
			{ E(), { "vlf_mobitems:rabbit_stew", 1, 1 } },
			},

			{
			{ { "vlf_core:coal_lump", 15, 15 }, E() },
			{ E(), { "vlf_mobitems:cooked_porkchop", 5, 5 } },
			{ E(), { "vlf_mobitems:cooked_chicken", 8, 8 } },
			},

			{
			{ { "vlf_mobitems:mutton", 7, 7 }, E() },
			{ { "vlf_mobitems:beef", 10, 10 }, E() },
			},

			{
			{ { "vlf_ocean:dried_kelp_block", 10, 10 }, E() },
			},

			{
			{ { "vlf_farming:sweet_berry", 10, 10 }, E() },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	weapon_smith = {
		name = S("Weapon Smith"),
		texture = "mobs_mc_villager_weaponsmith.png",
<<<<<<< HEAD
		jobsite = "vlc_grindstone:grindstone",
		trades = {
			{
			{ { "vlc_core:coal_lump", 15, 15 }, E() },
			{ E(3), { "vlc_tools:axe_iron", 1, 1 } },
			{ E(7, 21), { "vlc_tools:sword_iron_enchanted", 1, 1 } },
			},

			{
			{ { "vlc_core:iron_ingot", 4, 4 }, E() },
			{ E(36), { "vlc_bells:bell", 1, 1 } },
			},

			{
			{ { "vlc_core:flint", 24, 24 }, E() },
			},

			{
			{ { "vlc_core:diamond", 1, 1 }, E() },
			{ E(17, 31), { "vlc_tools:axe_diamond_enchanted", 1, 1 } },
			},

			{
			{ E(13, 27), { "vlc_tools:sword_diamond_enchanted", 1, 1 } },
=======
		jobsite = "vlf_grindstone:grindstone",
		trades = {
			{
			{ { "vlf_core:coal_lump", 15, 15 }, E() },
			{ E(3), { "vlf_tools:axe_iron", 1, 1 } },
			{ E(7, 21), { "vlf_tools:sword_iron_enchanted", 1, 1 } },
			},

			{
			{ { "vlf_core:iron_ingot", 4, 4 }, E() },
			{ E(36), { "vlf_bells:bell", 1, 1 } },
			},

			{
			{ { "vlf_core:flint", 24, 24 }, E() },
			},

			{
			{ { "vlf_core:diamond", 1, 1 }, E() },
			{ E(17, 31), { "vlf_tools:axe_diamond_enchanted", 1, 1 } },
			},

			{
			{ E(13, 27), { "vlf_tools:sword_diamond_enchanted", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	tool_smith = {
		name = S("Tool Smith"),
		texture = "mobs_mc_villager_toolsmith.png",
<<<<<<< HEAD
		jobsite = "vlc_smithing_table:table",
		trades = {
			{
			{ { "vlc_core:coal_lump", 15, 15 }, E() },
			{ E(), { "vlc_tools:axe_stone", 1, 1 } },
			{ E(), { "vlc_tools:shovel_stone", 1, 1 } },
			{ E(), { "vlc_tools:pick_stone", 1, 1 } },
			{ E(), { "vlc_farming:hoe_stone", 1, 1 } },
			},

			{
			{ { "vlc_core:iron_ingot", 4, 4 }, E() },
			{ E(36), { "vlc_bells:bell", 1, 1 } },
			},

			{
			{ { "vlc_core:flint", 30, 30 }, E() },
			{ E(6, 20), { "vlc_tools:axe_iron_enchanted", 1, 1 } },
			{ E(7, 21), { "vlc_tools:shovel_iron_enchanted", 1, 1 } },
			{ E(8, 22), { "vlc_tools:pick_iron_enchanted", 1, 1 } },
			{ E(4), { "vlc_farming:hoe_diamond", 1, 1 } },
			},

			{
			{ { "vlc_core:diamond", 1, 1 }, E() },
			{ E(17, 31), { "vlc_tools:axe_diamond_enchanted", 1, 1 } },
			{ E(10, 24), { "vlc_tools:shovel_diamond_enchanted", 1, 1 } },
			},

			{
			{ E(18, 32), { "vlc_tools:pick_diamond_enchanted", 1, 1 } },
=======
		jobsite = "vlf_smithing_table:table",
		trades = {
			{
			{ { "vlf_core:coal_lump", 15, 15 }, E() },
			{ E(), { "vlf_tools:axe_stone", 1, 1 } },
			{ E(), { "vlf_tools:shovel_stone", 1, 1 } },
			{ E(), { "vlf_tools:pick_stone", 1, 1 } },
			{ E(), { "vlf_farming:hoe_stone", 1, 1 } },
			},

			{
			{ { "vlf_core:iron_ingot", 4, 4 }, E() },
			{ E(36), { "vlf_bells:bell", 1, 1 } },
			},

			{
			{ { "vlf_core:flint", 30, 30 }, E() },
			{ E(6, 20), { "vlf_tools:axe_iron_enchanted", 1, 1 } },
			{ E(7, 21), { "vlf_tools:shovel_iron_enchanted", 1, 1 } },
			{ E(8, 22), { "vlf_tools:pick_iron_enchanted", 1, 1 } },
			{ E(4), { "vlf_farming:hoe_diamond", 1, 1 } },
			},

			{
			{ { "vlf_core:diamond", 1, 1 }, E() },
			{ E(17, 31), { "vlf_tools:axe_diamond_enchanted", 1, 1 } },
			{ E(10, 24), { "vlf_tools:shovel_diamond_enchanted", 1, 1 } },
			},

			{
			{ E(18, 32), { "vlf_tools:pick_diamond_enchanted", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	cleric = {
		name = S("Cleric"),
		texture = "mobs_mc_villager_priest.png",
<<<<<<< HEAD
		jobsite = "vlc_brewing:stand_000",
		trades = {
			{
			{ { "vlc_mobitems:rotten_flesh", 32, 32 }, E() },
=======
		jobsite = "vlf_brewing:stand_000",
		trades = {
			{
			{ { "vlf_mobitems:rotten_flesh", 32, 32 }, E() },
>>>>>>> 3eb27be82 (change naming in mods)
			{ E(), { "mesecons:redstone", 2, 2  } },
			},

			{
<<<<<<< HEAD
			{ { "vlc_core:gold_ingot", 3, 3 }, E() },
			{ E(), { "vlc_core:lapis", 1, 1 } },
			},

			{
			{ { "vlc_mobitems:rabbit_foot", 2, 2 }, E() },
			{ E(4), { "vlc_nether:glowstone", 1, 1 } },
=======
			{ { "vlf_core:gold_ingot", 3, 3 }, E() },
			{ E(), { "vlf_core:lapis", 1, 1 } },
			},

			{
			{ { "vlf_mobitems:rabbit_foot", 2, 2 }, E() },
			{ E(4), { "vlf_nether:glowstone", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},

			{
			--{ { "FIXME: scute", 4, 4 }, E() },
<<<<<<< HEAD
			{ { "vlc_potions:glass_bottle", 9, 9 }, E() },
			{ E(5), { "vlc_throwing:ender_pearl", 1, 1 } },
			},

			{
			{ { "vlc_nether:nether_wart_item", 22, 22 }, E() },
			{ E(3), { "vlc_experience:bottle", 1, 1 } },
=======
			{ { "vlf_potions:glass_bottle", 9, 9 }, E() },
			{ E(5), { "vlf_throwing:ender_pearl", 1, 1 } },
			},

			{
			{ { "vlf_nether:nether_wart_item", 22, 22 }, E() },
			{ E(3), { "vlf_experience:bottle", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	mason =	{
		name = S("Mason"),
		texture = "mobs_mc_villager_mason.png",
<<<<<<< HEAD
		jobsite = "vlc_stonecutter:stonecutter",
		trades =  {
			{
			{ { "vlc_core:clay_lump", 10, 10 }, E()  },
			{ E(), { "vlc_core:brick", 10, 10 } },
			},

			{
			{ { "vlc_core:stone", 20, 20 }, E() },
			{ E(), { "vlc_core:stonebrickcarved", 4, 4 } },
			},

			{
			{ { "vlc_core:granite", 16, 16 }, E() },
			{ { "vlc_core:andesite", 16, 16 }, E() },
			{ { "vlc_core:diorite", 16, 16 }, E() },
			{ E(), { "vlc_core:andesite_smooth", 4, 4 } },
			{ E(), { "vlc_core:granite_smooth", 4, 4 } },
			{ E(), { "vlc_core:diorite_smooth", 4, 4 } },
=======
		jobsite = "vlf_stonecutter:stonecutter",
		trades =  {
			{
			{ { "vlf_core:clay_lump", 10, 10 }, E()  },
			{ E(), { "vlf_core:brick", 10, 10 } },
			},

			{
			{ { "vlf_core:stone", 20, 20 }, E() },
			{ E(), { "vlf_core:stonebrickcarved", 4, 4 } },
			},

			{
			{ { "vlf_core:granite", 16, 16 }, E() },
			{ { "vlf_core:andesite", 16, 16 }, E() },
			{ { "vlf_core:diorite", 16, 16 }, E() },
			{ E(), { "vlf_core:andesite_smooth", 4, 4 } },
			{ E(), { "vlf_core:granite_smooth", 4, 4 } },
			{ E(), { "vlf_core:diorite_smooth", 4, 4 } },
>>>>>>> 3eb27be82 (change naming in mods)
			--FIXME: { E(), { "Dripstone Block", 4, 4 } },
			},

			{
<<<<<<< HEAD
			{ { "vlc_nether:quartz", 12, 12 }, E() },
			{ E(), { "vlc_colorblocks:hardened_clay_white", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_grey", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_silver", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_black", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_red", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_yellow", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_green", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_cyan", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_blue", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_magenta", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_orange", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_brown", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_pink", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_light_blue", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_lime", 1, 1 } },
			{ E(), { "vlc_colorblocks:hardened_clay_purple", 1, 1 } },

			{ E(), { "vlc_colorblocks:glazed_terracotta_white", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_grey", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_silver", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_black", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_red", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_yellow", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_green", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_cyan", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_blue", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_magenta", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_orange", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_brown", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_pink", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_light_blue", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_lime", 1, 1 } },
			{ E(), { "vlc_colorblocks:glazed_terracotta_purple", 1, 1 } },
			},

			{
			{ E(), { "vlc_nether:quartz_pillar", 1, 1 } },
			{ E(), { "vlc_nether:quartz_block", 1, 1 } },
=======
			{ { "vlf_nether:quartz", 12, 12 }, E() },
			{ E(), { "vlf_colorblocks:hardened_clay_white", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_grey", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_silver", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_black", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_red", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_yellow", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_green", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_cyan", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_blue", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_magenta", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_orange", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_brown", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_pink", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_light_blue", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_lime", 1, 1 } },
			{ E(), { "vlf_colorblocks:hardened_clay_purple", 1, 1 } },

			{ E(), { "vlf_colorblocks:glazed_terracotta_white", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_grey", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_silver", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_black", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_red", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_yellow", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_green", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_cyan", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_blue", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_magenta", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_orange", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_brown", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_pink", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_light_blue", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_lime", 1, 1 } },
			{ E(), { "vlf_colorblocks:glazed_terracotta_purple", 1, 1 } },
			},

			{
			{ E(), { "vlf_nether:quartz_pillar", 1, 1 } },
			{ E(), { "vlf_nether:quartz_block", 1, 1 } },
>>>>>>> 3eb27be82 (change naming in mods)
			},
		},
	},
	nitwit = {
		name = S("Nitwit"),
		texture = "mobs_mc_villager_nitwit.png",
		-- No trades for nitwit
		trades = nil,
	},
	wandering_trader = {
		name = S("Wandering Trader"),
		texture = "mobs_mc_villager_wandering_trader.png",
		trades = {},
	},
}
