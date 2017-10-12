-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.


-- Global namespace for functions

stairs = {}


-- Register aliases for new pine node names

minetest.register_alias("stairs:stair_pinewood", "stairs:stair_pine_wood")
minetest.register_alias("stairs:slab_pinewood", "stairs:slab_pine_wood")


-- Get setting for replace ABM

local replace = minetest.settings:get_bool("enable_stairs_replace_abm")

local function rotate_and_place(itemstack, placer, pointed_thing)
	local p0 = pointed_thing.under
	local p1 = pointed_thing.above
	local param2 = 0

	local placer_pos = placer:getpos()
	if placer_pos then
		param2 = minetest.dir_to_facedir(vector.subtract(p1, placer_pos))
	end

	local finepos = minetest.pointed_thing_to_face_pos(placer, pointed_thing)
	local fpos = finepos.y % 1

	if p0.y - 1 == p1.y or (fpos > 0 and fpos < 0.5)
			or (fpos < -0.5 and fpos > -0.999999999) then
		param2 = param2 + 20
		if param2 == 21 then
			param2 = 23
		elseif param2 == 23 then
			param2 = 21
		end
	end
	return minetest.item_place(itemstack, placer, pointed_thing, param2)
end

-- Register stairs.
-- Node will be called stairs:stair_<subname>

function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	groups.stair = 1
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "stairs_stair.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointed_thing)
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:stair_" .. subname .. "upside_down", {
			replace_name = "stairs:stair_" .. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{recipeitem, "", ""},
				{recipeitem, recipeitem, ""},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Flipped recipe for the silly minecrafters
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'stairs:stair_' .. subname,
				burntime = math.floor(baseburntime * 0.75),
			})
		end
	end
end


-- Slab facedir to placement 6d matching table
local slab_trans_dir = {[0] = 8, 0, 2, 1, 3, 4}

-- Register slabs.
-- Node will be called stairs:slab_<subname>

function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
	groups.slab = 1
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			local wield_item = itemstack:get_name()
			local creative_enabled = (creative and creative.is_enabled_for
					and creative.is_enabled_for(placer:get_player_name()))

			if under and under.name:find("stairs:slab_") then
				-- place slab using under node orientation
				local dir = minetest.dir_to_facedir(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local p2 = under.param2

				-- combine two slabs if possible
				if slab_trans_dir[math.floor(p2 / 4)] == dir
						and wield_item == under.name then

					if not recipeitem then
						return itemstack
					end
					local player_name = placer:get_player_name()
					if minetest.is_protected(pointed_thing.under, player_name) and not
							minetest.check_player_privs(placer, "protection_bypass") then
						minetest.record_protection_violation(pointed_thing.under,
							player_name)
						return
					end
					minetest.set_node(pointed_thing.under, {name = recipeitem, param2 = p2})
					if not creative_enabled then
						itemstack:take_item()
					end
					return itemstack
				end

				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
				-- same for the opposite case: slab below normal slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), placer, pointed_thing, p2)
				if not creative_enabled then
					itemstack:take_item()
				end
				return itemstack
			else
				return rotate_and_place(itemstack, placer, pointed_thing)
			end
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:slab_" .. subname .. "upside_down", {
			replace_name = "stairs:slab_".. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		minetest.register_craft({
			output = 'stairs:slab_' .. subname .. ' 6',
			recipe = {
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'stairs:slab_' .. subname,
				burntime = math.floor(baseburntime * 0.5),
			})
		end
	end
end


-- Optionally replace old "upside_down" nodes with new param2 versions.
-- Disabled by default.

if replace then
	minetest.register_abm({
		label = "Slab replace",
		nodenames = {"group:slabs_replace"},
		interval = 16,
		chance = 1,
		action = function(pos, node)
			node.name = minetest.registered_nodes[node.name].replace_name
			node.param2 = node.param2 + 20
			if node.param2 == 21 then
				node.param2 = 23
			elseif node.param2 == 23 then
				node.param2 = 21
			end
			minetest.set_node(pos, node)
		end,
	})
end


-- Stair/slab registration function.
-- Nodes will be called stairs:{stair,slab}_<subname>

function stairs.register_stair_and_slab(subname, recipeitem,
		groups, images, desc_stair, desc_slab, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end


-- Register default stairs and slabs

stairs.register_stair_and_slab(
	"wood",
	"default:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_wood.png"},
	"Wooden Stair",
	"Wooden Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"junglewood",
	"default:junglewood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_junglewood.png"},
	"Jungle Wood Stair",
	"Jungle Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"pine_wood",
	"default:pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_pine_wood.png"},
	"Pine Wood Stair",
	"Pine Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"acacia_wood",
	"default:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_acacia_wood.png"},
	"Acacia Wood Stair",
	"Acacia Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"aspen_wood",
	"default:aspen_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_aspen_wood.png"},
	"Aspen Wood Stair",
	"Aspen Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"stone",
	"default:stone",
	{cracky = 3},
	{"default_stone.png"},
	"Stone Stair",
	"Stone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"cobble",
	"default:cobble",
	{cracky = 3},
	{"default_cobble.png"},
	"Cobblestone Stair",
	"Cobblestone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"mossycobble",
	nil,
	{cracky = 3},
	{"default_mossycobble.png"},
	"Mossy Cobblestone Stair",
	"Mossy Cobblestone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"stonebrick",
	"default:stonebrick",
	{cracky = 2},
	{"default_stone_brick.png"},
	"Stone Brick Stair",
	"Stone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"stone_block",
	"default:stone_block",
	{cracky = 2},
	{"default_stone_block.png"},
	"Stone Block Stair",
	"Stone Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"basalt",
	"australia:basalt",
	{cracky = 2},
	{"aus_basalt.png"},
	"Basalt Stair",
	"Basalt Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"basalt_brick",
	"australia:basalt_brick",
	{cracky = 2},
	{"aus_basalt_brick.png"},
	"Basalt Brick Stair",
	"Basalt Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"basalt_cobble",
	"australia:basalt_cobble",
	{cracky = 2},
	{"aus_basalt_cobble.png"},
	"Basalt Cobble Stair",
	"Basalt Cobble Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"diorite",
	"australia:diorite",
	{cracky = 2},
	{"aus_diorite.png"},
	"Diorite Stair",
	"Diorite Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"diorite_brick",
	"australia:diorite_brick",
	{cracky = 2},
	{"aus_diorite.png"},
	"Diorite Brick Stair",
	"Diorite Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"diorite_cobble",
	"australia:diorite_cobble",
	{cracky = 2},
	{"aus_diorite_cobble.png"},
	"Diorite Cobble Stair",
	"Diorite Cobble Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"granite",
	"technic:granite",
	{cracky = 2},
	{"technic_granite.png"},
	"Granite Stair",
	"Granite Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"granite_brick",
	"technic:granite_brick",
	{cracky = 2},
	{"technic_granite_brick.png"},
	"Granite Brick Stair",
	"Granite Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"granite_cobble",
	"technic:granite_cobble",
	{cracky = 2},
	{"technic_granite_cobble.png"},
	"Granite Cobble Stair",
	"Granite Cobble Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"limestone",
	"australia:limestone",
	{cracky = 2},
	{"aus_limestone.png"},
	"Limestone Stair",
	"Limestone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"limestone_cobble",
	"australia:limestone_cobble",
	{cracky = 2},
	{"aus_limestone_cobble.png"},
	"Limestone Cobble Stair",
	"Limestone Cobble Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"marble",
	"australia:marble",
	{cracky = 2},
	{"aus_marble.png"},
	"Marble Stair",
	"Marble Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"marble_tile",
	"australia:marble_tile",
	{cracky = 2},
	{"aus_marble_tile.png"},
	"Marble Tile Stair",
	"Marble Tile Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstone",
	"default:sandstone",
	{crumbly = 1, cracky = 3},
	{"default_sandstone.png"},
	"Sandstone Stair",
	"Sandstone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstonebrick",
	"default:sandstonebrick",
	{cracky = 2},
	{"default_sandstone_brick.png"},
	"Sandstone Brick Stair",
	"Sandstone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstone_block",
	"default:sandstone_block",
	{cracky = 2},
	{"default_sandstone_block.png"},
	"Sandstone Block Stair",
	"Sandstone Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"slate",
	"australia:sate",
	{cracky = 2},
	{"aus_slate.png"},
	"Slate Stair",
	"Slate Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone",
	"default:desert_sandstone",
	{crumbly = 1, cracky = 3},
	{"default_desert_sandstone.png"},
	"Desert Sandstone Stair",
	"Desert Sandstone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone_brick",
	"default:desert_sandstone_brick",
	{cracky = 2},
	{"default_desert_sandstone_brick.png"},
	"Desert Sandstone Brick Stair",
	"Desert Sandstone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone_block",
	"default:desert_sandstone_block",
	{cracky = 2},
	{"default_desert_sandstone_block.png"},
	"Desert Sandstone Block Stair",
	"Desert Sandstone Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidian",
	"default:obsidian",
	{cracky = 1, level = 2},
	{"default_obsidian.png"},
	"Obsidian Stair",
	"Obsidian Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidianbrick",
	"default:obsidianbrick",
	{cracky = 1, level = 2},
	{"default_obsidian_brick.png"},
	"Obsidian Brick Stair",
	"Obsidian Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidian_block",
	"default:obsidian_block",
	{cracky = 1, level = 2},
	{"default_obsidian_block.png"},
	"Obsidian Block Stair",
	"Obsidian Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"brick",
	"default:brick",
	{cracky = 3},
	{"default_brick.png"},
	"Brick Stair",
	"Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"straw",
	"farming:straw",
	{snappy = 3, flammable = 4},
	{"farming_straw.png"},
	"Straw Stair",
	"Straw Slab",
	default.node_sound_leaves_defaults()
)

stairs.register_stair_and_slab(
	"steelblock",
	"default:steelblock",
	{cracky = 1, level = 2},
	{"default_steel_block.png"},
	"Steel Block Stair",
	"Steel Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"copperblock",
	"default:copperblock",
	{cracky = 1, level = 2},
	{"default_copper_block.png"},
	"Copper Block Stair",
	"Copper Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"bronzeblock",
	"default:bronzeblock",
	{cracky = 1, level = 2},
	{"default_bronze_block.png"},
	"Bronze Block Stair",
	"Bronze Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"goldblock",
	"default:goldblock",
	{cracky = 1},
	{"default_gold_block.png"},
	"Gold Block Stair",
	"Gold Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"ice",
	"default:ice",
	{cracky = 3, puts_out_fire = 1, cools_lava = 1},
	{"default_ice.png"},
	"Ice Stair",
	"Ice Slab",
	default.node_sound_glass_defaults()
)

stairs.register_stair_and_slab(
	"snowblock",
	"default:snowblock",
	{crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1},
	{"default_snow.png"},
	"Snow Block Stair",
	"Snow Block Slab",
	default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	})
)

-- Eucalyptus Wood
stairs.register_stair_and_slab(
	"eucalyptus_wood",
	"australia:eucalyptus_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_eucalyptus_wood.png"},
	"Eucalyptus Wood Stair",
	"Eucalyptus Wood Slab",
	default.node_sound_wood_defaults()
)

-- Blackwood
stairs.register_stair_and_slab(
	"blackwood",
	"australia:blackwood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_blackwood.png"},
	"Blackwood Stair",
	"Blackwood Slab",
	default.node_sound_wood_defaults()
)

-- Blue Gum
stairs.register_stair_and_slab(
	"blue_gum",
	"australia:blue_gum",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_blue_gum.png"},
	"Blue Gum Stair",
	"Blue Gum Slab",
	default.node_sound_wood_defaults()
)

-- Celery-top Pine
stairs.register_stair_and_slab(
	"celery_top_pine",
	"australia:celery_top_pine",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_celery_top_pine.png"},
	"Celery-top Pine Stair",
	"Celery-top Pine Slab",
	default.node_sound_wood_defaults()
)

-- Red Mahogany
stairs.register_stair_and_slab(
	"red_mahogany",
	"australia:red_mahogany",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_red_mahogany.png"},
	"Red Mahogany Stair",
	"Red Mahogany Slab",
	default.node_sound_wood_defaults()
)

-- Huon Pine
stairs.register_stair_and_slab(
	"huon_pine",
	"australia:huon_pine",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_huon_pine.png"},
	"Huon Pine Stair",
	"Huon Pine Slab",
	default.node_sound_wood_defaults()
)

-- Jarrah
stairs.register_stair_and_slab(
	"jarrah",
	"australia:jarrah",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_jarrah.png"},
	"Jarrah Stair",
	"Jarrah Slab",
	default.node_sound_wood_defaults()
)

-- Karri
stairs.register_stair_and_slab(
	"karri",
	"australia:karri",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_karri.png"},
	"Karri Stair",
	"Karri Slab",
	default.node_sound_wood_defaults()
)

-- Marri
stairs.register_stair_and_slab(
	"marri",
	"australia:marri",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_marri.png"},
	"Marri Stair",
	"Marri Slab",
	default.node_sound_wood_defaults()
)

-- Merbau
stairs.register_stair_and_slab(
	"merbau",
	"australia:merbau",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_merbau.png"},
	"Merbau Stair",
	"Merbau Slab",
	default.node_sound_wood_defaults()
)

-- Red Gum
stairs.register_stair_and_slab(
	"red_gum",
	"australia:red_gum",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_red_gum.png"},
	"Red Gum Stair",
	"Red Gum Slab",
	default.node_sound_wood_defaults()
)

-- Southern Sassafras
stairs.register_stair_and_slab(
	"southern_sassafras",
	"australia:southern_sassafras",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_southern_sassafras.png"},
	"Southern Sassafras Stair",
	"Southern Sassafras Slab",
	default.node_sound_wood_defaults()
)

-- Tasmanian Oak
stairs.register_stair_and_slab(
	"tasmanian_oak",
	"australia:tasmanian_oak",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_tasmanian_oak.png"},
	"Tasmanian Oak Stair",
	"Tasmanian Oak Slab",
	default.node_sound_wood_defaults()
)

-- Tasmanian Myrtle
stairs.register_stair_and_slab(
	"tasmanian_myrtle",
	"australia:tasmanian_myrtle",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"aus_tasmanian_myrtle.png"},
	"Tasmanian Myrtle Stair",
	"Tasmanian Myrtle Slab",
	default.node_sound_wood_defaults()
)

