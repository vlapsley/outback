-- LV Electric Furnace
-- This is a faster version of the stone furnace which runs on EUs

-- FIXME: kpoppel I'd like to introduce an induction heating element here also
minetest.register_craft({
	output = 'technic:electric_furnace',
	recipe = {
		{'base:cobble', 'base:cobble',         'base:cobble'},
		{'base:cobble', 'technic:machine_casing', 'base:cobble'},
		{'base:cobble', 'technic:lv_cable',       'base:cobble'},
	}
})

technic.register_electric_furnace({tier="LV", demand={300}, speed = 2})


