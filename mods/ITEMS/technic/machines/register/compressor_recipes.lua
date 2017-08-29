
local S = technic.getter

technic.register_recipe_type("compressing", { description = S("Compressing") })

function technic.register_compressor_recipe(data)
	data.time = data.time or 4
	technic.register_recipe("compressing", data)
end

local recipes = {
	{"base:snowblock",          "base:ice"},
	{"base:sand 2",             "base:sandstone"},
	{"base:desert_sand",        "base:desert_sandstone"},
	{"technic:mixed_metal_ingot",  "technic:composite_plate"},
	{"base:copper_ingot 5",     "technic:copper_plate"},
	{"technic:coal_dust 4",        "technic:graphite"},
	{"technic:carbon_cloth",       "technic:carbon_plate"},
	{"technic:uranium35_ingot 5",  "technic:uranium_fuel"},
}

-- defuse the default sandstone recipe, since we have the compressor to take over in a more realistic manner
minetest.clear_craft({
	output = "base:sandstone",
	recipe = {
		{'group:sand', 'group:sand'},
		{'group:sand', 'group:sand'}
	},
})

for _, data in pairs(recipes) do
	technic.register_compressor_recipe({input = {data[1]}, output = data[2]})
end

