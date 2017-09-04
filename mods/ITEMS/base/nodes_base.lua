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

minetest.register_node("base:sandstone", {
	description = "Sandstone",
	tiles = {"base_sandstone.png"},
	drop = 'base:sandstone_cobble',
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

minetest.register_node("base:red_sandstone", {
	description = "Red Sandstone",
	tiles = {"base_red_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	drop = 'base:red_sandstone_cobble',
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:red_sandstonebrick", {
	description = "Red Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_red_sandstone_brick.png"},
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

minetest.register_node("base:sandstone_cobble", {
	description = "Sandstone Cobble",
	tiles = {"base_sandstone_cobble.png"},
	groups = {crumbly = 1, cracky = 3, oddly_breakable_by_hand = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:basalt", {
	description = "Basalt",
	tiles = {"base_basalt.png"},
	groups = {cracky = 2, stone = 1},
	drop = "base:basalt_cobble",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:basalt_cobble", {
	description = "Basalt Cobble",
	tiles = {"base_basalt_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:basalt_brick", {
	description = "Basalt Brick",
	tiles = {"base_basalt_brick.png"},
	is_ground_content = false,
	groups = {cracky = 1, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:diorite", {
	description = "Diorite",
	tiles = {"base_diorite.png"},
	groups = {cracky = 2, stone = 1},
	drop = 'base:diorite_cobble',
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:diorite_cobble", {
	description = "Diorite Cobble",
	tiles = {"base_diorite_cobble.png"},
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:diorite_brick", {
	description = "Diorite Brick",
	tiles = {"base_diorite_brick.png"},
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:granite", {
	description = "Granite",
	tiles = {"base_granite.png"},
	groups = {cracky = 2, stone = 1},
	drop = 'base:granite_cobble',
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_cobble", {
	description = "Granite Cobble",
	tiles = {"base_granite_cobble.png"},
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_brick", {
	description = "Granite Brick",
	tiles = {"base_granite_brick.png"},
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:limestone", {
	description = "Limestone",
	tiles = {"base_limestone.png"},
	drop = 'base:limestone_cobble',
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:limestone_cobble", {
	description = "Limestone Cobble",
	tiles = {"base_limestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:limestone_brick", {
	description = "Limestone Brick",
	tiles = {"base_limestone_brick.png"},
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_stone_defaults(),
}) 

minetest.register_node("base:marble", {
	description = "Marble",
	tiles = {"base_marble.png"},
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_stone_defaults(),
}) 

minetest.register_node("base:marble_tile", {
	description = "Marble Tile",
	tiles = {"base_marble_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = base.node_sound_stone_defaults()
})

minetest.register_node("base:shale", {
	description = "Shale",
	tiles = {"base_shale.png","base_shale.png","base_shale_side.png"},
	is_ground_content = true,
	groups = {crumbly = 2, cracky = 2},
	sounds = base.node_sound_stone_defaults()
})

minetest.register_node("base:slate", {
	description = "Slate",
	tiles = {"base_slate.png","base_slate.png","base_slate_side.png"},
	is_ground_content = true,
	drop = 'base:slate_rubble',
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults()
})

minetest.register_node("base:slate_rubble", {
	description = "Slate Rubble",
	tiles = {"base_slate_rubble.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults()
})

minetest.register_node("base:slate_brick", {
	description = "Slate Brick",
	tiles = {"base_slate_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults()
})

minetest.register_node("base:slate_tile", {
	description = "Slate Tile",
	tiles = {"base_slate_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults()
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
	tiles = {"base_mangrove_mud_top.png","base_mangrove_mud.png"},
	groups = {crumbly = 3, soil = 1, disable_jump = 1},
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

minetest.register_node("base:diorite_with_coal", {
	description = "Coal Ore",
	tiles = {"base_diorite.png^base_mineral_coal.png"},
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

minetest.register_node("base:granite_with_iron", {
	description = "Iron Ore",
	tiles = {"base_granite.png^base_mineral_iron.png"},
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

minetest.register_node("base:copperblock", {
	description = "Copper Block",
	tiles = {"base_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_opal", {
	description = "Opal Ore",
	tiles = {"base_stone.png^base_mineral_opal.png"},
	groups = {cracky = 2},
	drop = "base:opal",
	sounds = base.node_sound_stone_defaults(),
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

minetest.register_node("base:stone_with_aluminium", {
	description = "Aluminium Ore",
	tiles = {"base_stone.png^base_mineral_aluminium.png"},
	groups = {cracky = 2},
	drop = "base:aluminium_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:aluminiumblock", {
	description = "Aluminium Block",
	tiles = {"base_aluminium_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_nickel", {
	description = "Nickel Ore",
	tiles = {"base_stone.png^base_mineral_nickel.png"},
	groups = {cracky = 2},
	drop = "base:nickel_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:nickelblock", {
	description = "Nickel Block",
	tiles = {"base_nickel_block.png"},
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

minetest.register_node("base:stone_with_zinc", {
	description = "Zinc Ore",
	tiles = {"base_stone.png^base_mineral_zinc.png" },
	is_ground_content = true,
	groups = {cracky = 3},
	drop = "base:zinc_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:zincblock", {
	description = "Zinc Block",
	tiles = {"base_zinc_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_lead", {
	description = "Lead Ore",
	tiles = {"base_stone.png^base_mineral_lead.png" },
	groups = {cracky = 3},
	drop = "base:lead_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:leadblock", {
	description = "Lead Block",
	tiles = {"base_lead_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_sulfur", {
	description = "Sulfur Ore",
	tiles = {"base_stone.png^base_mineral_sulfur.png" },
	groups = {cracky = 3},
	drop = "base:sulfur_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_silver", {
	description = "Silver Ore",
	tiles = {"base_stone.png^base_mineral_silver.png" },
	groups = {cracky = 3},
	drop = "base:silver_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("base:silverblock", {
	description = "Silver Block",
	tiles = {"base_silver_block.png"},
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
