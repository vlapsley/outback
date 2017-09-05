--[[
	Uranium
--]]


minetest.register_node("technic:stone_with_uranium", {
	description = "Uranium Ore",
	tiles = {"base_stone.png^technic_mineral_uranium.png" },
	groups = {cracky = 3, radioactive = 1},
	drop = "technic:uranium_lump",
	sounds = base.node_sound_stone_defaults(),
}) 

minetest.register_node("technic:granite_with_uranium", {
	description = "Uranium Ore",
	tiles = {"base_granite.png^technic_mineral_uranium.png" },
	groups = {cracky = 3, radioactive = 1},
	drop = "technic:uranium_lump",
	sounds = base.node_sound_stone_defaults(),
}) 

minetest.register_node("technic:uranium_block", {
	description = "Uranium Block",
	tiles = {"technic_uranium_block.png"},
	is_ground_content = false,
	groups = {uranium_block = 1, cracky = 1, level = 2, radioactive = 2},
	sounds = base.node_sound_stone_defaults(),
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

