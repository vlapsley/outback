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
		{'base:steel_ingot', 'base:steel_ingot', 'base:steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:pick_bronze',
	recipe = {
		{'base:bronze_ingot', 'base:bronze_ingot', 'base:bronze_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:pick_diamond',
	recipe = {
		{'base:diamond', 'base:diamond', 'base:diamond'},
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
		{'base:steel_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:shovel_bronze',
	recipe = {
		{'base:bronze_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:shovel_diamond',
	recipe = {
		{'base:diamond'},
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
		{'base:steel_ingot', 'base:steel_ingot'},
		{'base:steel_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_bronze',
	recipe = {
		{'base:bronze_ingot', 'base:bronze_ingot'},
		{'base:bronze_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:axe_diamond',
	recipe = {
		{'base:diamond', 'base:diamond'},
		{'base:diamond', 'group:stick'},
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
		{'base:steel_ingot', 'base:steel_ingot'},
		{'group:stick', 'base:steel_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:axe_bronze',
	recipe = {
		{'base:bronze_ingot', 'base:bronze_ingot'},
		{'group:stick', 'base:bronze_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tools:axe_diamond',
	recipe = {
		{'base:diamond', 'base:diamond'},
		{'group:stick', 'base:diamond'},
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
		{'base:steel_ingot'},
		{'base:steel_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:sword_bronze',
	recipe = {
		{'base:bronze_ingot'},
		{'base:bronze_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:sword_diamond',
	recipe = {
		{'base:diamond'},
		{'base:diamond'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tools:skeleton_key',
	recipe = {
		{'base:gold_ingot'},
	}
})

minetest.register_craft({
	type = 'cooking',
	output = 'base:gold_ingot',
	recipe = 'tools:key',
	cooktime = 5,
})

minetest.register_craft({
	type = 'cooking',
	output = 'base:gold_ingot',
	recipe = 'tools:skeleton_key',
	cooktime = 5,
})

