--[[
	Fences
--]]

local fences = {}

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
	inventory_image = "fences_fence_overlay.png^default_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
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

fences.register_fence("fences:fence_eucalyptus_wood", {
	description = "Eucalyptus Wood Fence",
	texture = "base_eucalyptus_wood.png",
	inventory_image = "fences_fence_overlay.png^base_eucalyptus_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_eucalyptus_wood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:eucalyptus_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_blackwood", {
	description = "Blackwood Fence",
	texture = "base_blackwood.png",
	inventory_image = "fences_fence_overlay.png^base_blackwood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_blackwood.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:blackwood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_blue_gum", {
	description = "Blue Gum Fence",
	texture = "base_blue_gum.png",
	inventory_image = "fences_fence_overlay.png^base_blue_gum.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_blue_gum.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:bluegum",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_celery_top_pine", {
	description = "Celery-top Pine Fence",
	texture = "base_celery_top_pine.png",
	inventory_image = "fences_fence_overlay.png^base_celery_top_pine.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_celery_top_pine.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:celery_top_pine",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_red_mahogany", {
	description = "Red Mahogany Fence",
	texture = "base_red_mahogany.png",
	inventory_image = "fences_fence_overlay.png^base_red_mahogany.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_red_mahogany.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:red_mahogany",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_huon_pine", {
	description = "Huon Pine Fence",
	texture = "base_huon_pine.png",
	inventory_image = "fences_fence_overlay.png^base_huon_pine.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_huon_pine.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:huon_pine",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_jarrah", {
	description = "Jarrah Fence",
	texture = "base_jarrah.png",
	inventory_image = "fences_fence_overlay.png^base_jarrah.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_jarrah.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:jarrah",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_karri", {
	description = "Karri Fence",
	texture = "base_karri.png",
	inventory_image = "fences_fence_overlay.png^base_karri.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_karri.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:karri",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_marri", {
	description = "Marri Fence",
	texture = "base_marri.png",
	inventory_image = "fences_fence_overlay.png^base_marri.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_marri.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:marri",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_merbau", {
	description = "Merbau Fence",
	texture = "base_merbau.png",
	inventory_image = "fences_fence_overlay.png^base_merbau.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_merbau.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:merbau",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_red_gum", {
	description = "Red Gum Fence",
	texture = "base_red_gum.png",
	inventory_image = "fences_fence_overlay.png^base_red_gum.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_red_gum.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:red_gum",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_southern_sassafras", {
	description = "Southern Sassafras Fence",
	texture = "base_southern_sassafras.png",
	inventory_image = "fences_fence_overlay.png^base_southern_sassafras.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_southern_sassafras.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:southern_sassafras",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_tasmanian_oak", {
	description = "Tasmanian Oak Fence",
	texture = "base_tasmanian_oak.png",
	inventory_image = "fences_fence_overlay.png^base_tasmanian_oak.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_tasmanian_oak.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:tasmanian_oak",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

fences.register_fence("fences:fence_tasmanian_myrtle", {
	description = "Tasmanian Myrtle Fence",
	texture = "base_tasmanian_myrtle.png",
	inventory_image = "fences_fence_overlay.png^base_tasmanian_myrtle.png^fences_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "fences_fence_overlay.png^base_tasmanian_myrtle.png^fences_fence_overlay.png^[makealpha:255,126,126",
	material = "base:tasmanian_myrtle",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

