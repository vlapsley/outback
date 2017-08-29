local S = technic.getter

if minetest.registered_nodes["furnace:furnace"].description == "Furnace" then
	minetest.override_item("furnace:furnace", { description = S("Fuel-Fired Furnace") })
end
