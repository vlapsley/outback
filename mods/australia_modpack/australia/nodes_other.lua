-- mods/australia/nodes_other.lua


minetest.register_node("australia:red_stone", {
	description = "Red Stone",
	tiles = {"aus_red_stone.png"},
	groups = {cracky=3, stone=1},
	drop = 'australia:red_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_cobble", {
	description = "Red cobblestone",
	tiles = {"aus_red_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_stonebrick", {
	description = "Red Stone Brick",
	tiles = {"aus_red_stonebrick.png"},
	is_ground_content = false,
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:bluestone", {
	description = "Bluestone (Basalt)",
	tiles = {"aus_bluestone.png"},
	groups = {cracky=2, stone=1},
	drop = 'australia:bluestone_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:bluestone_cobble", {
	description = "Bluestone cobble",
	tiles = {"aus_bluestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky=2, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:bluestone_brick", {
	description = "Bluestone Brick",
	tiles = {"aus_bluestone_brick.png"},
	is_ground_content = false,
	groups = {cracky=1, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_dirt", {
	description = "Red Dirt",
	tiles = {"aus_red_dirt.png"},
	groups = {crumbly=3,soil=1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("australia:red_sand", {
	description = "Red Sand",
	tiles = {"aus_red_sand.png"},
	groups = {crumbly=3, falling_node=1, sand=1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("australia:red_gravel", {
	description = "Red Gravel",
	tiles = {"aus_red_gravel.png"},
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("australia:mangrove_mud", {
	description = "Mangrove Mud",
	tiles = {"aus_mangrove_mud.png"},
	groups = {crumbly=2, soil=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="aus_mangrove_mud", gain=0.4},
		dug = {name="aus_mangrove_mud", gain=0.4},
	}),
})

minetest.register_node("australia:mineral_salt", {
	description = "Salt Mineral",
	tiles = {"aus_red_sand.png^aus_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	drop = {
		items = {
			{items = {"australia:red_sand"} },
			{items = {"australia:salt"} }
		}
	},
	sounds = default.node_sound_dirt_defaults,
})

minetest.register_node("australia:salt", {
	description = "Salt",
	drawtype = "plantlike",
	visual_scale = 0.6,
	tiles = {"aus_salt.png"},
	inventory_image = "aus_salt.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, -0.25, 0.1},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, -0.25, 0.1},
	},
})

minetest.register_node( "australia:salt_block", {
	description = "Salt Block",
	tiles = { "default_clay.png^aus_salt_block.png" },
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	on_use = minetest.item_eat(9),
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_opal", {
	description = "Opal Ore",
	tiles = {"default_stone.png^aus_mineral_opal.png"},
	groups = {cracky = 2},
	drop = 'australia:opal',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:opal",{
	description = "Opal",
	drawtype = "mesh",
	mesh = "cavestuff_pebble.obj",
	tiles = {"aus_opal.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2, stone=1},
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	collision_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:pebble",{
	description = "Pebble",
	drawtype = "mesh",
	mesh = "cavestuff_pebble.obj",
	tiles = {"aus_pebble.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, falling_node=1, stone=1},
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	collision_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_pebble",{
	description = "Red Stone Pebble",
	drawtype = "mesh",
	mesh = "cavestuff_pebble.obj",
	tiles = {"aus_red_pebble.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, falling_node=1, stone=1},
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	collision_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:muddy_river_water_source", {
	description = "Muddy River Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name="aus_muddy_river_water_flowing.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name="aus_muddy_river_water_flowing.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 224,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "australia:muddy_river_water_flowing",
	liquid_alternative_source = "australia:muddy_river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = true,
	liquid_range = 2,
	post_effect_color = {a = 232, r = 92, g = 80, b = 48},
	groups = {water=3,liquid=3,puts_out_fire=1},
})

minetest.register_node("australia:muddy_river_water_flowing", {
	description = "Flowing Muddy River Water",
	drawtype = "flowingliquid",
	tiles = {"aus_muddy_river_water_source.png"},
	special_tiles = {
		{
			image="aus_muddy_river_water_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			image="aus_muddy_river_water_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 224,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "australia:muddy_river_water_flowing",
	liquid_alternative_source = "australia:muddy_river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 232, r = 92, g = 80, b = 48},
	groups = {water=3,liquid=3,puts_out_fire=1,not_in_creative_inventory=1},
})

