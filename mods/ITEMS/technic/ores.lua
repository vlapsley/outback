--[[
	Chromium
--]]

minetest.register_node("technic:stone_with_chromium", {
	description = "Chromium Ore",
	tiles = {"base_stone.png^technic_mineral_chromium.png"},
	groups = {cracky=3},
	drop = "technic:chromium_lump",
	sounds = base.node_sound_stone_defaults(),
}) 

minetest.register_node("technic:granite_with_chromium", {
	description = "Chromium Ore",
	tiles = {"base_granite.png^technic_mineral_chromium.png"},
	groups = {cracky=3},
	drop = "technic:chromium_lump",
	sounds = base.node_sound_stone_defaults(),
}) 

minetest.register_node("technic:chromium_block", {
	description = "Chromium Block",
	tiles = {"technic_chromium_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_craftitem("technic:chromium_lump", {
	description = "Chromium Lump",
	inventory_image = "technic_chromium_lump.png",
})

minetest.register_craftitem("technic:chromium_ingot", {
	description = "Chromium Ingot",
	inventory_image = "technic_chromium_ingot.png",
})

minetest.register_craft({
	output = 'technic:chromium_block',
	recipe = {
		{'technic:chromium_ingot', 'technic:chromium_ingot', 'technic:chromium_ingot'},
		{'technic:chromium_ingot', 'technic:chromium_ingot', 'technic:chromium_ingot'},
		{'technic:chromium_ingot', 'technic:chromium_ingot', 'technic:chromium_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:chromium_ingot 9',
	recipe = {
		{'technic:chromium_block'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "technic:chromium_ingot",
	recipe = "technic:chromium_lump",
})


--[[
	Sulfur
--]]

minetest.register_node("technic:stone_with_sulfur", {
	description = "Sulfur Ore",
	tiles = {"base_stone.png^technic_mineral_sulfur.png" },
	groups = {cracky=3},
	drop = "technic:sulfur_lump",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_craftitem("technic:sulfur_lump", {
	description = "Sulfur Lump",
	inventory_image = "technic_sulfur_lump.png",
})


--[[
	Uranium
--]]


minetest.register_node("technic:stone_with_uranium", {
	description = "Uranium Ore",
	tiles = {"base_stone.png^technic_mineral_uranium.png"},
	paramtype = "light",
	groups = {cracky = 3, radioactive = 1},
	drop = "technic:uranium_lump",
	sounds = base.node_sound_stone_defaults(),
	light_source = 1,
}) 

minetest.register_node("technic:granite_with_uranium", {
	description = "Uranium Ore",
	tiles = {"base_granite.png^technic_mineral_uranium.png"},
	paramtype = "light",
	groups = {cracky = 3, radioactive = 1},
	drop = "technic:uranium_lump",
	sounds = base.node_sound_stone_defaults(),
	light_source = 1,
}) 

minetest.register_node("technic:uranium_block", {
	description = "Uranium Block",
	tiles = {"technic_uranium_block.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {uranium_block = 1, cracky = 1, level = 2, radioactive = 2},
	sounds = base.node_sound_stone_defaults(),
	light_source = 2,
})

minetest.register_craftitem("technic:uranium_lump", {
	description = "Uranium Lump",
	inventory_image = "technic_uranium_lump.png",
})

minetest.register_craftitem("technic:uranium_ingot", {
	description = "Uranium Ingot",
	inventory_image = "technic_uranium_ingot.png",
	groups = {uranium_ingot =1},
})

minetest.register_craft({
	output = 'technic:uranium_block',
	recipe = {
		{'technic:uranium_ingot', 'technic:uranium_ingot', 'technic:uranium_ingot'},
		{'technic:uranium_ingot', 'technic:uranium_ingot', 'technic:uranium_ingot'},
		{'technic:uranium_ingot', 'technic:uranium_ingot', 'technic:uranium_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:uranium_ingot 9',
	recipe = {
		{'technic:uraniumblock'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "technic:uranium_ingot",
	recipe = "technic:uranium_lump",
})

