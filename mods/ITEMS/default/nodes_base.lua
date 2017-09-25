--[[
	Default nodes
--]]


minetest.register_node("default:clay", {
	description = "Clay",
	tiles = {"default_clay.png"},
	groups = {crumbly = 3},
	drop = "default:clay_lump 4",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {"default:flint"}, rarity = 16},
			{items = {"default:gravel"}}
		}
	}
})

minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "default:cobble",
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stonebrick", {
	description = "Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_block", {
	description = "Stone Block",
	tiles = {"default_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	drop = "base:sandstone_cobble",
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstonebrick", {
	description = "Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_block", {
	description = "Sandstone Block",
	tiles = {"default_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_sandstone", {
	description = "Desert Sandstone",
	tiles = {"default_desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_sandstone_brick", {
	description = "Desert Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_sandstone_block", {
	description = "Desert Sandstone Block",
	tiles = {"default_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("default:obsidianbrick", {
	description = "Obsidian Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("default:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("default:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_grass_footsteps", {
	description = "Dirt with Grass and Footsteps",
	tiles = {"default_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass",
	tiles = {"default_dry_grass.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("default:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, spreading_dirt_type = 1, snowy = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("default:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter",
	tiles = {
		"default_rainforest_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:desert_sand", {
	description = "Desert Sand",
	tiles = {"default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:snow", {
	description = "Snow",
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1, snowy = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

minetest.register_node("default:snowblock", {
	description = "Snow Block",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

minetest.register_node("default:ice", {
	description = "Ice",
	drawtype = "allfaces_optional",
	tiles = {"default_ice.png"},
	use_texture_alpha = true,
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = "default:coal_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coalblock", {
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:steelblock", {
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:copperblock", {
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:stone_with_tin", {
	description = "Tin Ore",
	tiles = {"default_stone.png^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tinblock", {
	description = "Tin Block",
	tiles = {"default_tin_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:bronzeblock", {
	description = "Bronze Block",
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mese", {
	description = "Mese Block",
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
})

minetest.register_node("default:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:goldblock", {
	description = "Gold Block",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:diamondblock", {
	description = "Diamond Block",
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick", {
	description = "Brick Block",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:meselamp", {
	description = "Mese Lamp",
	drawtype = "glasslike",
	tiles = {"default_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
})

minetest.register_node("default:mese_post_light", {
	description = "Mese Post Light",
	tiles = {"default_mese_post_light_top.png", "default_mese_post_light_top.png",
		"default_mese_post_light_side_dark.png", "default_mese_post_light_side_dark.png",
		"default_mese_post_light_side.png", "default_mese_post_light_side.png"},
	wield_image = "default_mese_post_light_side.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

