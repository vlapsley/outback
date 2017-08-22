--[[
	Core base nodes
--]]


--
-- Stone
--

minetest.register_node("core:stone", {
	description = "Stone",
	tiles = {"core_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'core:cobble',
	legacy_mineral = true,
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:cobble", {
	description = "Cobblestone",
	tiles = {"core_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:stonebrick", {
	description = "Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"core_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:stone_block", {
	description = "Stone Block",
	tiles = {"core_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"core_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = core.node_sound_stone_defaults(),
})


minetest.register_node("core:desert_stone", {
	description = "Desert Stone",
	tiles = {"core_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'core:desert_cobble',
	legacy_mineral = true,
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:desert_cobble", {
	description = "Desert Cobblestone",
	tiles = {"core_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:desert_stonebrick", {
	description = "Desert Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"core_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:desert_stone_block", {
	description = "Desert Stone Block",
	tiles = {"core_desert_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:sandstone", {
	description = "Sandstone",
	tiles = {"core_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:sandstonebrick", {
	description = "Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"core_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:sandstone_block", {
	description = "Sandstone Block",
	tiles = {"core_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:desert_sandstone", {
	description = "Desert Sandstone",
	tiles = {"core_desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:desert_sandstone_brick", {
	description = "Desert Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"core_desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:desert_sandstone_block", {
	description = "Desert Sandstone Block",
	tiles = {"core_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:silver_sandstone", {
	description = "Silver Sandstone",
	tiles = {"core_silver_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:silver_sandstone_brick", {
	description = "Silver Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"core_silver_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:silver_sandstone_block", {
	description = "Silver Sandstone Block",
	tiles = {"core_silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:obsidian", {
	description = "Obsidian",
	tiles = {"core_obsidian.png"},
	sounds = core.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("core:obsidianbrick", {
	description = "Obsidian Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"core_obsidian_brick.png"},
	is_ground_content = false,
	sounds = core.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("core:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"core_obsidian_block.png"},
	is_ground_content = false,
	sounds = core.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

--
-- Soft / Non-Stone
--

minetest.register_node("core:dirt", {
	description = "Dirt",
	tiles = {"core_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = core.node_sound_dirt_defaults(),
})

minetest.register_node("core:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"core_grass.png", "core_dirt.png",
		{name = "core_dirt.png^core_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("core:dirt_with_grass_footsteps", {
	description = "Dirt with Grass and Footsteps",
	tiles = {"core_grass.png^core_footprint.png", "core_dirt.png",
		{name = "core_dirt.png^core_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("core:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass",
	tiles = {"core_dry_grass.png",
		"core_dirt.png",
		{name = "core_dirt.png^core_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("core:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"core_snow.png", "core_dirt.png",
		{name = "core_dirt.png^core_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, spreading_dirt_type = 1, snowy = 1},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("core:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter",
	tiles = {
		"core_rainforest_litter.png",
		"core_dirt.png",
		{name = "core_dirt.png^core_rainforest_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "core:dirt",
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("core:sand", {
	description = "Sand",
	tiles = {"core_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = core.node_sound_sand_defaults(),
})

minetest.register_node("core:desert_sand", {
	description = "Desert Sand",
	tiles = {"core_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = core.node_sound_sand_defaults(),
})

minetest.register_node("core:silver_sand", {
	description = "Silver Sand",
	tiles = {"core_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = core.node_sound_sand_defaults(),
})

minetest.register_node("core:gravel", {
	description = "Gravel",
	tiles = {"core_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = core.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'core:flint'}, rarity = 16},
			{items = {'core:gravel'}}
		}
	}
})

minetest.register_node("core:clay", {
	description = "Clay",
	tiles = {"core_clay.png"},
	groups = {crumbly = 3},
	drop = 'core:clay_lump 4',
	sounds = core.node_sound_dirt_defaults(),
})

minetest.register_node("core:snow", {
	description = "Snow",
	tiles = {"core_snow.png"},
	inventory_image = "core_snowball.png",
	wield_image = "core_snowball.png",
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
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_snow_footstep", gain = 0.15},
		dug = {name = "core_snow_footstep", gain = 0.2},
		dig = {name = "core_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "core:dirt_with_grass" then
			minetest.set_node(pos, {name = "core:dirt_with_snow"})
		end
	end,
})

minetest.register_node("core:snowblock", {
	description = "Snow Block",
	tiles = {"core_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1},
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_snow_footstep", gain = 0.15},
		dug = {name = "core_snow_footstep", gain = 0.2},
		dig = {name = "core_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "core:dirt_with_grass" then
			minetest.set_node(pos, {name = "core:dirt_with_snow"})
		end
	end,
})

minetest.register_node("core:ice", {
	description = "Ice",
	tiles = {"core_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = core.node_sound_glass_defaults(),
})


--
-- Ores
--

minetest.register_node("core:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"core_stone.png^core_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'core:coal_lump',
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:coalblock", {
	description = "Coal Block",
	tiles = {"core_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"core_stone.png^core_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'core:iron_lump',
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:steelblock", {
	description = "Steel Block",
	tiles = {"core_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = core.node_sound_metal_defaults(),
})

minetest.register_node("core:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"core_stone.png^core_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'core:copper_lump',
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:copperblock", {
	description = "Copper Block",
	tiles = {"core_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = core.node_sound_metal_defaults(),
})

minetest.register_node("core:stone_with_tin", {
	description = "Tin Ore",
	tiles = {"core_stone.png^core_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "core:tin_lump",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:tinblock", {
	description = "Tin Block",
	tiles = {"core_tin_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = core.node_sound_metal_defaults(),
})

minetest.register_node("core:bronzeblock", {
	description = "Bronze Block",
	tiles = {"core_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = core.node_sound_metal_defaults(),
})

minetest.register_node("core:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"core_stone.png^core_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "core:mese_crystal",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:mese", {
	description = "Mese Block",
	tiles = {"core_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = core.node_sound_stone_defaults(),
	light_source = 3,
})

minetest.register_node("core:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"core_stone.png^core_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "core:gold_lump",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:goldblock", {
	description = "Gold Block",
	tiles = {"core_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = core.node_sound_metal_defaults(),
})

minetest.register_node("core:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"core_stone.png^core_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "core:diamond",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("core:diamondblock", {
	description = "Diamond Block",
	tiles = {"core_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = core.node_sound_stone_defaults(),
})


--
-- Other
--

minetest.register_node("core:brick", {
	description = "Brick Block",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"core_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = core.node_sound_stone_defaults(),
})


minetest.register_node("core:meselamp", {
	description = "Mese Lamp",
	drawtype = "glasslike",
	tiles = {"core_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = core.node_sound_glass_defaults(),
	light_source = 14,
})

minetest.register_node("core:mese_post_light", {
	description = "Mese Post Light",
	tiles = {"core_mese_post_light_top.png", "core_mese_post_light_top.png",
		"core_mese_post_light_side_dark.png", "core_mese_post_light_side_dark.png",
		"core_mese_post_light_side.png", "core_mese_post_light_side.png"},
	wield_image = "core_mese_post_light_side.png",
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
	sounds = core.node_sound_wood_defaults(),
})
