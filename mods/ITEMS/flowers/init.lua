--[[
	Flowers
--]]


-- Namespace for functions

flowers = {}


-- Flower registration

local function add_simple_flower(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flammable = 1
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("flowers:" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {"flowers_" .. name .. ".png"},
		inventory_image = "flowers_" .. name .. ".png",
		wield_image = "flowers_" .. name .. ".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		groups = f_groups,
		sounds = base.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
end

flowers.datas = {
	{
		"rose",
		"Rose",
		{-2/16, -8/16, -2/16, 2/16, 5/16, 2/16},
		{color_red = 1}
	},
	{
		"tulip",
		"Orange Tulip",
		{-2/16, -8/16, -2/16, 2/16, 3/16, 2/16},
		{color_orange = 1}
	},
	{
		"dandelion_yellow",
		"Yellow Dandelion",
		{-2/16, -8/16, -2/16, 2/16, 4/16, 2/16},
		{color_yellow = 1}
	},
	{
		"geranium",
		"Blue Geranium",
		{-2/16, -8/16, -2/16, 2/16, 2/16, 2/16},
		{color_blue = 1}
	},
	{
		"viola",
		"Viola",
		{-5/16, -8/16, -5/16, 5/16, -1/16, 5/16},
		{color_violet = 1}
	},
	{
		"dandelion_white",
		"White Dandelion",
		{-5/16, -8/16, -5/16, 5/16, -2/16, 5/16},
		{color_white = 1}
	},
	{
		"bottlebrush_orchid",
		"Bottlebrush Orchid",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_green = 1}
	},
	{
		"cooktown_orchid",
		"Cooktown Orchid",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_pink = 1}
	},
	{
		"couch_honeypot",
		"Couch Honeypot",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_orange = 1}
	},
	{
		"darling_lily",
		"Darling Lily",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_white = 1}
	},
	{
		"kangaroo_paw",
		"Kangaroo Paw",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_red = 1}
	},
	{
		"mangrove_lily",
		"Mangrove Lily",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_white = 1}
	},
	{
		"pink_mulla_mulla",
		"Pink Mulla Mulla",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_pink = 1}
	},
	{
		"silver_daisy",
		"Silver Daisy",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_grey = 1}
	},
	{
		"sturts_desert_pea",
		"Sturt's Desert Pea",
		{-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
		{color_red = 1}
	},
}

for _,item in pairs(flowers.datas) do
	add_simple_flower(unpack(item))
end


-- Flower spread
-- Public function to enable override by mods

function flowers.flower_spread(pos, node)
	pos.y = pos.y - 1
	local under = minetest.get_node(pos)
	pos.y = pos.y + 1
	-- Replace flora with dry shrub in desert sand and silver sand,
	-- as this is the only way to generate them.
	-- However, preserve grasses in sand dune biomes.
	if minetest.get_item_group(under.name, "sand") == 1 and
			under.name ~= "base:sand" then
		minetest.set_node(pos, {name = "base:dry_shrub"})
		return
	end

	if minetest.get_item_group(under.name, "soil") == 0 then
		return
	end

	local light = minetest.get_node_light(pos)
	if not light or light < 13 then
		return
	end

	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	if #minetest.find_nodes_in_area(pos0, pos1, "group:flora") > 3 then
		return
	end

	local soils = minetest.find_nodes_in_area_under_air(
		pos0, pos1, "group:soil")
	if #soils > 0 then
		local seedling = soils[math.random(#soils)]
		local seedling_above =
			{x = seedling.x, y = seedling.y + 1, z = seedling.z}
		light = minetest.get_node_light(seedling_above)
		if not light or light < 13 or
				-- Desert sand is in the soil group
				minetest.get_node(seedling).name == "base:desert_sand" then
			return
		end

		minetest.set_node(seedling_above, {name = node.name})
	end
end

minetest.register_abm({
	label = "Flower spread",
	nodenames = {"group:flora"},
	interval = 13,
	chance = 96,
	action = function(...)
		flowers.flower_spread(...)
	end,
})


--
-- Waterlily
--

minetest.register_node("flowers:waterlily", {
	description = "Waterlily",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"flowers_waterlily.png", "flowers_waterlily_bottom.png"},
	inventory_image = "flowers_waterlily.png",
	wield_image = "flowers_waterlily.png",
	liquids_pointable = true,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	floodable = true,
	groups = {snappy = 3, flower = 1, flammable = 1},
	sounds = base.node_sound_leaves_defaults(),
	node_placement_prediction = "",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -31 / 64, -0.5, 0.5, -15 / 32, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, -15 / 32, 7 / 16}
	},

	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local node = minetest.get_node(pointed_thing.under).name
		local def = minetest.registered_nodes[node]
		local player_name = placer:get_player_name()

		if def and def.liquidtype == "source" and
				minetest.get_item_group(node, "water") > 0 then
			if not minetest.is_protected(pos, player_name) then
				minetest.set_node(pos, {name = "flowers:waterlily",
					param2 = math.random(0, 3)})
				if not (creative and creative.is_enabled_for
						and creative.is_enabled_for(player_name)) then
					itemstack:take_item()
				end
			else
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end
})
