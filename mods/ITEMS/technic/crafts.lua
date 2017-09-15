-- check if we have the necessary dependencies to allow actually using these materials in the crafts
local mesecons_materials = minetest.get_modpath("mesecons_materials")

-- Remove some recipes
-- Bronze
minetest.clear_craft({
	type = "shapeless",
	output = "base:bronze_ingot"
})

-- Accelerator tube
if pipeworks.enable_accelerator_tube then
	minetest.clear_craft({
		output = "pipeworks:accelerator_tube_1",
	})

	minetest.register_craft({
		output = 'pipeworks:accelerator_tube_1',
		recipe = {
			{'technic:copper_coil', 'pipeworks:tube_1', 'technic:copper_coil'},
			}
	})
end

-- Teleport tube
if pipeworks.enable_teleport_tube then
	minetest.clear_craft({
		output = "pipeworks:teleport_tube_1",
	})

	minetest.register_craft({
		output = 'pipeworks:teleport_tube_1',
		recipe = {
			{'base:mese_crystal', 'technic:copper_coil', 'base:mese_crystal'},
			{'pipeworks:tube_1', 'technic:control_logic_unit', 'pipeworks:tube_1'},
			{'base:mese_crystal', 'technic:copper_coil', 'base:mese_crystal'},
			}
	})
end

-- tubes crafting recipes

minetest.register_craft({
	output = 'technic:diamond_drill_head',
	recipe = {
		{'technic:stainless_steel_ingot', 'base:diamond', 'technic:stainless_steel_ingot'},
		{'base:diamond', '', 'base:diamond'},
		{'technic:stainless_steel_ingot', 'base:diamond', 'technic:stainless_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:green_energy_crystal',
	recipe = {
		{'base:gold_ingot', 'technic:battery', 'dye:green'},
		{'technic:battery', 'technic:red_energy_crystal', 'technic:battery'},
		{'dye:green', 'technic:battery', 'base:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:blue_energy_crystal',
	recipe = {
		{'moreores:mithril_ingot', 'technic:battery', 'dye:blue'},
		{'technic:battery', 'technic:green_energy_crystal', 'technic:battery'},
		{'dye:blue', 'technic:battery', 'moreores:mithril_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:red_energy_crystal',
	recipe = {
		{'moreores:silver_ingot', 'technic:battery', 'dye:red'},
		{'technic:battery', 'base:diamondblock', 'technic:battery'},
		{'dye:red', 'technic:battery', 'moreores:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:fine_copper_wire 2',
	recipe = {
		{'', 'base:copper_ingot', ''},
		{'', 'base:copper_ingot', ''},
		{'', 'base:copper_ingot', ''},
	}
})

minetest.register_craft({
	output = 'technic:fine_gold_wire 2',
	recipe = {
		{'', 'base:gold_ingot', ''},
		{'', 'base:gold_ingot', ''},
		{'', 'base:gold_ingot', ''},
	}
})

minetest.register_craft({
	output = 'technic:fine_silver_wire 2',
	recipe = {
		{'', 'moreores:silver_ingot', ''},
		{'', 'moreores:silver_ingot', ''},
		{'', 'moreores:silver_ingot', ''},
	}
})

minetest.register_craft({
	output = 'technic:copper_coil 1',
	recipe = {
		{'technic:fine_copper_wire', 'technic:wrought_iron_ingot', 'technic:fine_copper_wire'},
		{'technic:wrought_iron_ingot', '', 'technic:wrought_iron_ingot'},
		{'technic:fine_copper_wire', 'technic:wrought_iron_ingot', 'technic:fine_copper_wire'},
	}
})

minetest.register_craft({
	output = 'technic:motor',
	recipe = {
		{'technic:carbon_steel_ingot', 'technic:copper_coil', 'technic:carbon_steel_ingot'},
		{'technic:carbon_steel_ingot', 'technic:copper_coil', 'technic:carbon_steel_ingot'},
		{'technic:carbon_steel_ingot', 'base:copper_ingot', 'technic:carbon_steel_ingot'},
	}
})

local isolation = mesecons_materials and "mesecons_materials:fiber" or "technic:rubber"

minetest.register_craft({
	output = 'technic:lv_transformer',
	recipe = {
		{isolation,                    'technic:wrought_iron_ingot', isolation},
		{'technic:copper_coil',        'technic:wrought_iron_ingot', 'technic:copper_coil'},
		{'technic:wrought_iron_ingot', 'technic:wrought_iron_ingot', 'technic:wrought_iron_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:mv_transformer',
	recipe = {
		{isolation,                    'technic:carbon_steel_ingot', isolation},
		{'technic:copper_coil',        'technic:carbon_steel_ingot', 'technic:copper_coil'},
		{'technic:carbon_steel_ingot', 'technic:carbon_steel_ingot', 'technic:carbon_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:hv_transformer',
	recipe = {
		{isolation,                       'technic:stainless_steel_ingot', isolation},
		{'technic:copper_coil',           'technic:stainless_steel_ingot', 'technic:copper_coil'},
		{'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:control_logic_unit',
	recipe = {
		{'', 'technic:fine_gold_wire', ''},
		{'base:copper_ingot', 'technic:silicon_wafer', 'base:copper_ingot'},
		{'', 'technic:chromium_ingot', ''},
	}
})

minetest.register_craft({
	output = 'technic:mixed_metal_ingot 9',
	recipe = {
		{'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot'},
		{'base:bronze_ingot',          'base:bronze_ingot',          'base:bronze_ingot'},
		{'base:tin_ingot',            'base:tin_ingot',            'base:tin_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:carbon_cloth',
	recipe = {
		{'technic:graphite', 'technic:graphite', 'technic:graphite'}
	}
})

minetest.register_craft({
	output = "technic:machine_casing",
	recipe = {
		{ "technic:cast_iron_ingot", "technic:cast_iron_ingot", "technic:cast_iron_ingot" },
		{ "technic:cast_iron_ingot", "technic:brass_ingot", "technic:cast_iron_ingot" },
		{ "technic:cast_iron_ingot", "technic:cast_iron_ingot", "technic:cast_iron_ingot" },
	},
})


minetest.register_craft({
	output = "base:dirt 2",
	type = "shapeless",
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
	recipe = {
		"technic:stone_dust",
		"group:leaves",
		"bucket:bucket_water",
		"group:sand",
	},
})


minetest.register_craftitem("technic:brass_ingot", {
	description = "Brass Ingot",
	inventory_image = "technic_brass_ingot.png",
})

minetest.register_alias("technic:wrought_iron_ingot", "base:steel_ingot")

minetest.override_item("base:steel_ingot", {
	description = "Wrought Iron Ingot",
	inventory_image = "technic_wrought_iron_ingot.png",
})

minetest.register_craftitem("technic:cast_iron_ingot", {
	description = "Cast Iron Ingot",
	inventory_image = "technic_cast_iron_ingot.png",
})

minetest.register_craftitem("technic:carbon_steel_ingot", {
	description = "Carbon Steel Ingot",
	inventory_image = "technic_carbon_steel_ingot.png",
})

minetest.register_craftitem("technic:stainless_steel_ingot", {
	description = "Stainless Steel Ingot",
	inventory_image = "technic_stainless_steel_ingot.png",
})

local function register_block(block, ingot)
	minetest.register_craft({
		output = block,
		recipe = {
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
		}
	})

	minetest.register_craft({
		output = ingot.." 9",
		recipe = {
			{block}
		}
	})
end

register_block("technic:brass_block", "technic:brass_ingot")
register_block("technic:cast_iron_block", "technic:cast_iron_ingot")
register_block("technic:carbon_steel_block", "technic:carbon_steel_ingot")
register_block("technic:stainless_steel_block", "technic:stainless_steel_ingot")


minetest.register_craft({
	type = 'cooking',
	recipe = minetest.registered_aliases["technic:wrought_iron_ingot"],
	output = "technic:cast_iron_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "technic:cast_iron_ingot",
	cooktime = 2,
	output = "technic:wrought_iron_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "technic:carbon_steel_ingot",
	cooktime = 2,
	output = "technic:wrought_iron_ingot",
})

