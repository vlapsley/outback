-- Tool Repair
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

minetest.register_craft({
	output = 'tools:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:pick_steel',
	recipe = {
		{'core:steel_ingot', 'core:steel_ingot', 'core:steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:pick_bronze',
	recipe = {
		{'core:bronze_ingot', 'core:bronze_ingot', 'core:bronze_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:pick_diamond',
	recipe = {
		{'core:diamond', 'core:diamond', 'core:diamond'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:shovel_wood',
	recipe = {
		{'group:wood'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:shovel_stone',
	recipe = {
		{'group:stone'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:shovel_steel',
	recipe = {
		{'core:steel_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:shovel_bronze',
	recipe = {
		{'core:bronze_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:shovel_diamond',
	recipe = {
		{'core:diamond'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:wood', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stone', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_steel',
	recipe = {
		{'core:steel_ingot', 'core:steel_ingot'},
		{'core:steel_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_bronze',
	recipe = {
		{'core:bronze_ingot', 'core:bronze_ingot'},
		{'core:bronze_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_diamond',
	recipe = {
		{'core:diamond', 'core:diamond'},
		{'core:diamond', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:stick', 'group:wood'},
		{'group:stick',''},
	}
})

minetest.register_craft({
	output = 'tools:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stick', 'group:stone'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:axe_steel',
	recipe = {
		{'core:steel_ingot', 'core:steel_ingot'},
		{'group:stick', 'core:steel_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:axe_bronze',
	recipe = {
		{'core:bronze_ingot', 'core:bronze_ingot'},
		{'group:stick', 'core:bronze_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:axe_diamond',
	recipe = {
		{'core:diamond', 'core:diamond'},
		{'group:stick', 'core:diamond'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:sword_wood',
	recipe = {
		{'group:wood'},
		{'group:wood'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:sword_stone',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:sword_steel',
	recipe = {
		{'core:steel_ingot'},
		{'core:steel_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:sword_bronze',
	recipe = {
		{'core:bronze_ingot'},
		{'core:bronze_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:sword_diamond',
	recipe = {
		{'core:diamond'},
		{'core:diamond'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:skeleton_key',
	recipe = {
		{'core:gold_ingot'},
	}
})

minetest.register_craft({
	type = 'cooking',
	output = 'core:gold_ingot',
	recipe = 'tools:key',
	cooktime = 5,
})

minetest.register_craft({
	type = 'cooking',
	output = 'core:gold_ingot',
	recipe = 'tools:skeleton_key',
	cooktime = 5,
})

