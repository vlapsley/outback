-- LV Alloy furnace

-- FIXME: kpoppel: I'd like to introduce an induction heating element here...
minetest.register_craft({
	output = 'technic:lv_alloy_furnace',
	recipe = {
		{'base:brick', 'base:brick',          'base:brick'},
		{'base:brick', 'technic:machine_casing', 'base:brick'},
		{'base:brick', 'technic:lv_cable',       'base:brick'},
	}
})

technic.register_alloy_furnace({tier = "LV", speed = 1, demand = {300}})

