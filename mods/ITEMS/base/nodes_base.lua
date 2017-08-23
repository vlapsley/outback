--[[
	Base base nodes
--]]


--
-- Stone
--

minetest.register_node("base:stone", {
	description = "Stone",
	tiles = {"base_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'base:cobble',
	legacy_mineral = true,
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:cobble", {
	description = "Cobblestone",
	tiles = {"base_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:stonebrick", {
	description = "Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_block", {
	description = "Stone Block",
	tiles = {"base_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"base_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})


minetest.register_node("base:desert_stone", {
	description = "Desert Stone",
	tiles = {"base_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'base:desert_cobble',
	legacy_mineral = true,
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:desert_cobble", {
	description = "Desert Cobblestone",
	tiles = {"base_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:desert_stonebrick", {
	description = "Desert Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:desert_stone_block", {
	description = "Desert Stone Block",
	tiles = {"base_desert_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:sandstone", {
	description = "Sandstone",
	tiles = {"base_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:sandstonebrick", {
	description = "Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:sandstone_block", {
	description = "Sandstone Block",
	tiles = {"base_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:desert_sandstone", {
	description = "Desert Sandstone",
	tiles = {"base_desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:desert_sandstone_brick", {
	description = "Desert Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:desert_sandstone_block", {
	description = "Desert Sandstone Block",
	tiles = {"base_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:silver_sandstone", {
	description = "Silver Sandstone",
	tiles = {"base_silver_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:silver_sandstone_brick", {
	description = "Silver Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_silver_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:silver_sandstone_block", {
	description = "Silver Sandstone Block",
	tiles = {"base_silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:obsidian", {
	description = "Obsidian",
	tiles = {"base_obsidian.png"},
	sounds = base.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("base:obsidianbrick", {
	description = "Obsidian Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_obsidian_brick.png"},
	is_ground_content = false,
	sounds = base.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("base:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"base_obsidian_block.png"},
	is_ground_content = false,
	sounds = base.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("base:red_stone", {
	description = "Red Stone",
	tiles = {"base_red_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "base:red_cobble",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:red_cobble", {
	description = "Red Cobblestone",
	tiles = {"base_red_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:red_stonebrick", {
	description = "Red Stone Brick",
	tiles = {"base_red_stonebrick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:sandstone_cobble", {
	description = "Sandstone Cobble",
	tiles = {"base_sandstone_cobble.png"},
	groups = {crumbly = 1, cracky = 3, oddly_breakable_by_hand = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:bluestone", {
	description = "Bluestone (Basalt)",
	tiles = {"base_bluestone.png"},
	groups = {cracky = 2, stone = 1},
	drop = "base:bluestone_cobble",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:bluestone_cobble", {
	description = "Bluestone (Basalt) Cobble",
	tiles = {"base_bluestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:bluestone_brick", {
	description = "Bluestone Brick",
	tiles = {"base_bluestone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 1, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})


--
-- Soft / Non-Stone
--

minetest.register_node("base:dirt", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("base:red_dirt", {
	description = "Red Dirt",
	tiles = {"base_red_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("base:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"base_grass.png", "base_dirt.png",
		{name = "base_dirt.png^base_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("base:dirt_with_grass_footsteps", {
	description = "Dirt with Grass and Footsteps",
	tiles = {"base_grass.png^base_footprint.png", "base_dirt.png",
		{name = "base_dirt.png^base_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("base:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass",
	tiles = {"base_dry_grass.png",
		"base_dirt.png",
		{name = "base_dirt.png^base_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("base:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"base_snow.png", "base_dirt.png",
		{name = "base_dirt.png^base_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, spreading_dirt_type = 1, snowy = 1},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("base:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter",
	tiles = {
		"base_rainforest_litter.png",
		"base_dirt.png",
		{name = "base_dirt.png^base_rainforest_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "base:dirt",
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("base:sand", {
	description = "Sand",
	tiles = {"base_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = base.node_sound_sand_defaults(),
})

minetest.register_node("base:desert_sand", {
	description = "Desert Sand",
	tiles = {"base_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = base.node_sound_sand_defaults(),
})

minetest.register_node("base:silver_sand", {
	description = "Silver Sand",
	tiles = {"base_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = base.node_sound_sand_defaults(),
})

minetest.register_node("base:red_sand", {
	description = "Red Sand",
	tiles = {"base_red_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = base.node_sound_sand_defaults(),
})

minetest.register_node("base:gravel", {
	description = "Gravel",
	tiles = {"base_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = base.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'base:flint'}, rarity = 16},
			{items = {'base:gravel'}}
		}
	}
})

minetest.register_node("base:red_gravel", {
	description = "Red Gravel",
	tiles = {"base_red_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = base.node_sound_gravel_defaults(),
	}),
})


minetest.register_node("base:clay", {
	description = "Clay",
	tiles = {"base_clay.png"},
	groups = {crumbly = 3},
	drop = 'base:clay_lump 4',
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("base:snow", {
	description = "Snow",
	tiles = {"base_snow.png"},
	inventory_image = "base_snowball.png",
	wield_image = "base_snowball.png",
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
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_snow_footstep", gain = 0.15},
		dug = {name = "base_snow_footstep", gain = 0.2},
		dig = {name = "base_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "base:dirt_with_grass" then
			minetest.set_node(pos, {name = "base:dirt_with_snow"})
		end
	end,
})

minetest.register_node("base:snowblock", {
	description = "Snow Block",
	tiles = {"base_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1},
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_snow_footstep", gain = 0.15},
		dug = {name = "base_snow_footstep", gain = 0.2},
		dig = {name = "base_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "base:dirt_with_grass" then
			minetest.set_node(pos, {name = "base:dirt_with_snow"})
		end
	end,
})

minetest.register_node("base:ice", {
	description = "Ice",
	tiles = {"base_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = base.node_sound_glass_defaults(),
})

minetest.register_node("base:mangrove_mud", {
	description = "Mangrove Mud",
	tiles = {"base_mangrove_mud.png"},
	groups = {crumbly = 2, soil = 1, disable_jump = 1},
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_mangrove_mud", gain = 0.4},
		dug = {name = "base_mangrove_mud", gain = 0.4},
	}),
})

minetest.register_node("base:mineral_salt", {
	description = "Salt Mineral",
	tiles = {"base_red_sand.png^base_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	drop = {
		items = {
			{items = {"base:red_sand"} },
			{items = {"base:salt"} }
		}
	},
	sounds = base.node_sound_dirt_defaults,
})

minetest.register_node( "base:salt_block", {
	description = "Salt Block",
	tiles = {"base_clay.png^base_salt_block.png"},
	is_ground_content = false,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	on_use = minetest.item_eat(3),
	sounds = base.node_sound_stone_defaults(),
})


--
-- Ores
--

minetest.register_node("base:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"base_stone.png^base_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'base:coal_lump',
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:coalblock", {
	description = "Coal Block",
	tiles = {"base_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"base_stone.png^base_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'base:iron_lump',
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:steelblock", {
	description = "Steel Block",
	tiles = {"base_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"base_stone.png^base_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'base:copper_lump',
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_opal", {
	description = "Opal Ore",
	tiles = {"base_stone.png^base_mineral_opal.png"},
	groups = {cracky = 2},
	drop = "base:opal",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:copperblock", {
	description = "Copper Block",
	tiles = {"base_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_tin", {
	description = "Tin Ore",
	tiles = {"base_stone.png^base_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "base:tin_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:tinblock", {
	description = "Tin Block",
	tiles = {"base_tin_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:bronzeblock", {
	description = "Bronze Block",
	tiles = {"base_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"base_stone.png^base_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "base:mese_crystal",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:mese", {
	description = "Mese Block",
	tiles = {"base_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_stone_defaults(),
	light_source = 3,
})

minetest.register_node("base:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"base_stone.png^base_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "base:gold_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:goldblock", {
	description = "Gold Block",
	tiles = {"base_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"base_stone.png^base_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "base:diamond",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:diamondblock", {
	description = "Diamond Block",
	tiles = {"base_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = base.node_sound_stone_defaults(),
})


--
-- Other
--

minetest.register_node("base:brick", {
	description = "Brick Block",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})


minetest.register_node("base:meselamp", {
	description = "Mese Lamp",
	drawtype = "glasslike",
	tiles = {"base_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = base.node_sound_glass_defaults(),
	light_source = 14,
})

minetest.register_node("base:mese_post_light", {
	description = "Mese Post Light",
	tiles = {"base_mese_post_light_top.png", "base_mese_post_light_top.png",
		"base_mese_post_light_side_dark.png", "base_mese_post_light_side_dark.png",
		"base_mese_post_light_side.png", "base_mese_post_light_side.png"},
	wield_image = "base_mese_post_light_side.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
		},
	},
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
})


-- Aliases for schematic nodes
minetest.register_alias("default:dirt", "base:dirt")
