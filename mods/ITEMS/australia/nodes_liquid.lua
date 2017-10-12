--[[
	Liquid nodes
--]]

minetest.register_node("australia:muddy_water_source", {
	description = "Muddy Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name="aus_muddy_water_source_animated.png",
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
			name="aus_muddy_water_source_animated.png",
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
	liquid_alternative_flowing = "australia:muddy_water_flowing",
	liquid_alternative_source = "australia:muddy_water_source",
	liquid_viscosity = 1,
	liquid_renewable = true,
	liquid_range = 2,
	post_effect_color = {a = 232, r = 92, g = 80, b = 48},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("australia:muddy_water_flowing", {
	description = "Flowing Muddy Water",
	drawtype = "flowingliquid",
	tiles = {"aus_muddy_water.png"},
	special_tiles = {
		{
			image="aus_muddy_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			image="aus_muddy_water_flowing_animated.png",
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
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "australia:muddy_water_flowing",
	liquid_alternative_source = "australia:muddy_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 232, r = 92, g = 80, b = 48},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})


minetest.register_node("australia:crude_oil_source", {
	description = "Crude Oil Source",
	drawtype = "liquid",
	tiles = {
		{
			name="aus_crude_oil_source_animated.png",
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
			name="aus_crude_oil_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 248,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "australia:crude_oil_flowing",
	liquid_alternative_source = "australia:crude_oil_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 240, r = 16, g = 16, b = 16},
	groups = {liquid = 3, flammable = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("australia:crude_oil_flowing", {
	description = "Flowing Crude Oil",
	drawtype = "flowingliquid",
	tiles = {"aus_crude_oil.png"},
	special_tiles = {
		{
			image="aus_crude_oil_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			image="aus_crude_oil_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 248,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "australia:crude_oil_flowing",
	liquid_alternative_source = "australia:crude_oil_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 240, r = 16, g = 16, b = 16},
	groups = {liquid = 3, flammable = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_water_defaults(),
})

