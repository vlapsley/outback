--[[
	Fences
--]]


--
-- Fence registration helper
--

function fences.register_fence(name, def)
	minetest.register_craft({
		output = name .. " 4",
		recipe = {
			{ def.material, 'group:stick', def.material },
			{ def.material, 'group:stick', def.material },
		}
	})

	local fence_texture = "fences_fence_overlay.png^" .. def.texture ..
			"^fences_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
	}
	for k, v in pairs(default_fields) do
		if not def[k] then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end


fences.register_fence("fences:fence_wood", {
	description = "Wooden Fence",
	texture = "fences_fence_wood.png",
	inventory_image = "default_fence_overlay.png^default_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^default_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

fences.register_fence("fences:fence_acacia_wood", {
	description = "Acacia Fence",
	texture = "fences_fence_acacia_wood.png",
	inventory_image = "fences_fence_overlay.png^default_acacia_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^default_acacia_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "default:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

fences.register_fence("fences:fence_junglewood", {
	description = "Jungle Wood Fence",
	texture = "fences_fence_junglewood.png",
	inventory_image = "fences_fence_overlay.png^default_junglewood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^default_junglewood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "default:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

fences.register_fence("fences:fence_pine_wood", {
	description = "Pine Fence",
	texture = "fences_fence_pine_wood.png",
	inventory_image = "fences_fence_overlay.png^default_pine_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^default_pine_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "default:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

fences.register_fence("fences:fence_aspen_wood", {
	description = "Aspen Fence",
	texture = "fences_fence_aspen_wood.png",
	inventory_image = "fences_fence_overlay.png^default_aspen_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^default_aspen_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "default:aspen_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})


minetest.register_craft({
	type = "fuel",
	recipe = "fences:fence_aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "fences:fence_pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "fences:fence_wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "fences:fence_acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "fences:fence_junglewood",
	burntime = 9,
})

