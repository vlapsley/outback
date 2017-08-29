-- Crafting recipes for pipes

minetest.register_craft( {
        output = "pipeworks:pipe_1_empty 12",
        recipe = {
                { "base:steel_ingot", "base:steel_ingot", "base:steel_ingot" },
                { "", "", "" },
                { "base:steel_ingot", "base:steel_ingot", "base:steel_ingot" }
        },
})

minetest.register_craft( {
        output = "pipeworks:spigot 3",
        recipe = {
                { "pipeworks:pipe_1_empty", "" },
                { "", "pipeworks:pipe_1_empty" },
        },
})

minetest.register_craft( {
	output = "pipeworks:entry_panel_empty 2",
	recipe = {
		{ "", "base:steel_ingot", "" },
		{ "", "pipeworks:pipe_1_empty", "" },
		{ "", "base:steel_ingot", "" },
	},
})

-- Various ancillary pipe devices

minetest.register_craft( {
        output = "pipeworks:pump_off 2",
        recipe = {
                { "base:stone", "base:steel_ingot", "base:stone" },
                { "base:copper_ingot", "base:mese_crystal_fragment", "base:copper_ingot" },
                { "base:steel_ingot", "base:steel_ingot", "base:steel_ingot" }
        },
})

minetest.register_craft( {
        output = "pipeworks:valve_off_empty 2",
        recipe = {
                { "", "group:stick", "" },
                { "base:steel_ingot", "base:steel_ingot", "base:steel_ingot" },
                { "", "base:steel_ingot", "" }
        },
})

minetest.register_craft( {
        output = "pipeworks:storage_tank_0 2",
        recipe = {
                { "", "base:steel_ingot", "base:steel_ingot" },
                { "base:steel_ingot", "base:glass", "base:steel_ingot" },
                { "base:steel_ingot", "base:steel_ingot", "" }
        },
})

minetest.register_craft( {
        output = "pipeworks:grating 2",
        recipe = {
                { "base:steel_ingot", "", "base:steel_ingot" },
                { "", "pipeworks:pipe_1_empty", "" },
                { "base:steel_ingot", "", "base:steel_ingot" }
        },
})

minetest.register_craft( {
        output = "pipeworks:flow_sensor_empty 2",
        recipe = {
                { "pipeworks:pipe_1_empty", "mesecons:mesecon", "pipeworks:pipe_1_empty" },
        },
})

minetest.register_craft( {
        output = "pipeworks:fountainhead 2",
        recipe = {
                { "pipeworks:pipe_1_empty" },
				{ "pipeworks:pipe_1_empty" }
        },
})


-- Crafting recipes for pneumatic tubes

-- If homedecor is not installed, we need to register its crafting chain for
-- plastic sheeting so that pipeworks remains compatible with it.

if minetest.get_modpath("homedecor") == nil then

	minetest.register_craftitem(":homedecor:oil_extract", {
		    description = "Oil extract",
		    inventory_image = "homedecor_oil_extract.png",
	})

	minetest.register_craftitem(":homedecor:paraffin", {
		    description = "Unprocessed paraffin",
		    inventory_image = "homedecor_paraffin.png",
	})

	minetest.register_alias("homedecor:plastic_base", "homedecor:paraffin")

	minetest.register_craftitem(":homedecor:plastic_sheeting", {
		    description = "Plastic sheet",
		    inventory_image = "homedecor_plastic_sheeting.png",
	})

	minetest.register_craft({
		type = "shapeless",
		output = "homedecor:oil_extract 4",
		recipe = {
			"group:leaves",
			"group:leaves",
			"group:leaves",
			"group:leaves",
			"group:leaves",
			"group:leaves"
		}
	})

	minetest.register_craft({
		    type = "cooking",
		    output = "homedecor:paraffin",
		    recipe = "homedecor:oil_extract",
	})

	minetest.register_craft({
		    type = "cooking",
		    output = "homedecor:plastic_sheeting",
		    recipe = "homedecor:paraffin",
	})

	minetest.register_craft({
		    type = "fuel",
		    recipe = "homedecor:oil_extract",
		    burntime = 30,
	})

	minetest.register_craft({
		    type = "fuel",
		    recipe = "homedecor:paraffin",
		    burntime = 30,
	})

	minetest.register_craft({
		    type = "fuel",
		    recipe = "homedecor:plastic_sheeting",
		    burntime = 30,
	})
end


