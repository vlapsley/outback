-- Code by Mossmanikin, Neuromancer, and others

local function clone_node(name)
	local node2 = {}
	local node = minetest.registered_nodes[name]
	for k,v in pairs(node) do
		node2[k]=v
	end
	return node2
end

-----------------------------------------------------------------------------------------------
-- TWiGS
-----------------------------------------------------------------------------------------------

abstract_trunks.place_twig = function(pos)
	local twig_size 	= math.random(1,27)
	
	local right_here 	= {x=pos.x  , y=pos.y+1, z=pos.z  }
	local north 		= {x=pos.x  , y=pos.y+1, z=pos.z+1}
	local north_east 	= {x=pos.x+1, y=pos.y+1, z=pos.z+1}
	local east 			= {x=pos.x+1, y=pos.y+1, z=pos.z  }
	local south_east 	= {x=pos.x+1, y=pos.y+1, z=pos.z-1}
	local south 		= {x=pos.x  , y=pos.y+1, z=pos.z-1}
	local south_west 	= {x=pos.x-1, y=pos.y+1, z=pos.z-1}
	local west 			= {x=pos.x-1, y=pos.y+1, z=pos.z  }
	local north_west 	= {x=pos.x-1, y=pos.y+1, z=pos.z+1}
	
	local node_here 	= minetest.get_node(right_here)
	local node_north 	= minetest.get_node(north)
	local node_n_e 		= minetest.get_node(north_east)
	local node_east 	= minetest.get_node(east)
	local node_s_e 		= minetest.get_node(south_east)
	local node_south 	= minetest.get_node(south)
	local node_s_w 		= minetest.get_node(south_west)
	local node_west 	= minetest.get_node(west)
	local node_n_w 		= minetest.get_node(north_west)
--	small twigs	
	if twig_size <= 16 then
		minetest.set_node(right_here, {name="trunks:twig_"..math.random(1,4), param2=math.random(0,3)})
	end
-- 	big twigs
	if Big_Twigs == true then
--	big twig 1		
	if twig_size == 17 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_5"})
			end
			if minetest.registered_nodes[node_n_e.name].buildable_to then
				minetest.set_node(north_east, {name="trunks:twig_7"})
			end
			if minetest.registered_nodes[node_east.name].buildable_to then
				minetest.set_node(east, 	  {name="trunks:twig_8"})
			end
		end
	elseif twig_size == 18 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_5", param2=1})
			end
			if minetest.registered_nodes[node_s_e.name].buildable_to then
				minetest.set_node(south_east, {name="trunks:twig_7", param2=1})
			end
			if minetest.registered_nodes[node_south.name].buildable_to then
				minetest.set_node(south, 	  {name="trunks:twig_8", param2=1})
			end
		end
	elseif twig_size == 19 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_5", param2=2})
			end
			if minetest.registered_nodes[node_s_w.name].buildable_to then
				minetest.set_node(south_west, {name="trunks:twig_7", param2=2})
			end
			if minetest.registered_nodes[node_west.name].buildable_to then
				minetest.set_node(west, 	  {name="trunks:twig_8", param2=2})
			end
		end
	elseif twig_size == 20 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_5", param2=3})
			end
			if minetest.registered_nodes[node_n_w.name].buildable_to then
				minetest.set_node(north_west, {name="trunks:twig_7", param2=3})
			end
			if minetest.registered_nodes[node_north.name].buildable_to then
				minetest.set_node(north, 	  {name="trunks:twig_8", param2=3})
			end
		end
--	big twig 2		
	elseif twig_size == 21 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_9"})
			end
			if minetest.registered_nodes[node_north.name].buildable_to then
				minetest.set_node(north, 	  {name="trunks:twig_10"})
			end
			if minetest.registered_nodes[node_n_e.name].buildable_to then
				minetest.set_node(north_east, {name="trunks:twig_11"})
			end
		end
	elseif twig_size == 22 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_9", param2=1})
			end
			if minetest.registered_nodes[node_east.name].buildable_to then
				minetest.set_node(east, 	  {name="trunks:twig_10", param2=1})
			end
			if minetest.registered_nodes[node_s_e.name].buildable_to then
				minetest.set_node(south_east, {name="trunks:twig_11", param2=1})
			end
		end
	elseif twig_size == 23 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z-1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_9", param2=2})
			end
			if minetest.registered_nodes[node_south.name].buildable_to then
				minetest.set_node(south, 	  {name="trunks:twig_10", param2=2})
			end
			if minetest.registered_nodes[node_s_w.name].buildable_to then
				minetest.set_node(south_west, {name="trunks:twig_11", param2=2})
			end
		end
	elseif twig_size == 24 then
		if not (minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name].buildable_to
			or minetest.registered_nodes[minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name].buildable_to) then
			
			if minetest.registered_nodes[node_here.name].buildable_to then
				minetest.set_node(right_here, {name="trunks:twig_9", param2=3})
			end
			if minetest.registered_nodes[node_west.name].buildable_to then
				minetest.set_node(west, 	  {name="trunks:twig_10", param2=3})
			end
			if minetest.registered_nodes[node_n_w.name].buildable_to then
				minetest.set_node(north_west, {name="trunks:twig_11", param2=3})
			end
		end
	elseif twig_size <= 25 then
		minetest.set_node(right_here, {name="trunks:twig_"..math.random(12,13), param2=math.random(0,3)})
	end
	end
end

if Twigs_on_ground == true then
biome_lib:register_generate_plant({
    surface = {"base:dirt_with_grass", "base:dirt_with_dry_grass"},
    max_count = Twigs_on_ground_Max_Count,
    rarity = Twigs_on_ground_Rarity,
    min_elevation = 4,
	max_elevation = 40,
	near_nodes = {
		"australia:black_box_tree",
		"australia:blue_gum_tree",
		"australia:daintree_stringybark_tree",
		"australia:jarrah_tree",
		"australia:karri_tree",
		"australia:karri_tree",
		"australia:river_red_gum_tree",
		"australia:swamp_gum_tree",
		"australia:white_box_tree"
	},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.place_twig
)
end

if Twigs_on_water == true then
biome_lib:register_generate_plant({
    surface = {"base:water_source"},
    max_count = Twigs_on_water_Max_Count,
    rarity = Twigs_on_water_Rarity,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {"group:tree"},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.place_twig
)
end



-----------------------------------------------------------------------------------------------
-- MoSS & FuNGuS -- on ground
-----------------------------------------------------------------------------------------------
if Moss_on_ground == true then
abstract_trunks.grow_moss_on_ground = function(pos)
	local on_ground = {x=pos.x, y=pos.y+1, z=pos.z}
	local moss_type = math.random(1,21)
	
	if moss_type == 1 then
		minetest.set_node(on_ground, {name="trunks:moss_fungus", param2=math.random(0,3)})
	else
		minetest.set_node(on_ground, {name="trunks:moss", param2=math.random(0,3)})
	end
	
end

biome_lib:register_generate_plant({
    surface = {"base:dirt_with_grass"},
    max_count = Moss_on_ground_Max_Count,
    rarity = Moss_on_ground_Rarity,
    min_elevation = 30,
	max_elevation = 110,
	near_nodes = {
		"australia:celery_top_pine_tree",
		"australia:huon_pine_tree",
		"australia:southern_sassafras_tree",
		"australia:swamp_gum_tree",
		"australia:tasmanian_myrtle_tree"
	},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.grow_moss_on_ground
)
end

-----------------------------------------------------------------------------------------------
-- MoSS & FuNGuS -- on trunks
-----------------------------------------------------------------------------------------------
if Moss_on_trunk == true then
abstract_trunks.grow_moss_on_trunk = function(pos)
	local on_ground = {x=pos.x, y=pos.y+1, z=pos.z}
	local at_side_n = {x=pos.x, y=pos.y, z=pos.z+1}
	local at_side_e = {x=pos.x+1, y=pos.y, z=pos.z}
	local at_side_s = {x=pos.x, y=pos.y, z=pos.z-1}
	local at_side_w = {x=pos.x-1, y=pos.y, z=pos.z}
	local undrneath = {x=pos.x, y=pos.y-1, z=pos.z}
	
	local node_here = minetest.get_node(on_ground)
	local node_north = minetest.get_node(at_side_n)
	local node_east = minetest.get_node(at_side_e)
	local node_south = minetest.get_node(at_side_s)
	local node_west = minetest.get_node(at_side_w)
	local node_under = minetest.get_node(undrneath)
	
	--if minetest.get_item_group(node_under.name, "tree") < 1 then
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_here.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(on_ground, {name="trunks:moss_fungus", param2=math.random(0,3) --[[1]]})
			elseif moss_type < 22 then
				minetest.set_node(on_ground, {name="trunks:moss", param2=math.random(0,3) --[[1]]})
			end
		end
		local moss_type = math.random(1,31) -- cliche of more moss at north
		if minetest.registered_nodes[node_north.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_n, {name="trunks:moss_fungus", param2=math.random(4,7)}) -- 5,4,6,7
			elseif moss_type < 22 then
				minetest.set_node(at_side_n, {name="trunks:moss", param2=math.random(4,7)})
			end
		end
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_east.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_e, {name="trunks:moss_fungus", param2=math.random(12,15)})
			elseif moss_type < 22 then
				minetest.set_node(at_side_e, {name="trunks:moss", param2=math.random(12,15)})
			end
		end
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_south.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_s, {name="trunks:moss_fungus", param2=math.random(8,11)})
			elseif moss_type < 22 then
				minetest.set_node(at_side_s, {name="trunks:moss", param2=math.random(8,11)})
			end
		end
		local moss_type = math.random(1,41)
		if minetest.registered_nodes[node_west.name].buildable_to then -- instead of check_air = true,
			if moss_type == 1 then
				minetest.set_node(at_side_w, {name="trunks:moss_fungus", param2=math.random(16,19)})
			elseif moss_type < 22 then
				minetest.set_node(at_side_w, {name="trunks:moss", param2=math.random(16,19)})
			end
		end
	--end
end

biome_lib:register_generate_plant({
    surface = {
		"australia:celery_top_pine_tree",
		"australia:huon_pine_tree",
		"australia:southern_sassafras_tree",
		"australia:swamp_gum_tree",
		"australia:tasmanian_myrtle_tree",
		"base:mossycobble"
	},
    max_count = Moss_on_trunk_Max_Count,
    rarity = Moss_on_trunk_Rarity,
    min_elevation = 50,
	max_elevation = 70,
    plantlife_limit = -0.9,
	check_air = false,
  },
  "abstract_trunks.grow_moss_on_trunk"
)
end



-----------------------------------------------------------------------------------------------
-- BoTTLeBRuSH oRCHiDS
-----------------------------------------------------------------------------------------------
if Bottlebrush_Orchid == true then
abstract_trunks.grow_bottlebrush_orchid = function(pos)
	local on_ground = {x=pos.x, y=pos.y+1, z=pos.z}
	
	minetest.set_node(on_ground, {name="australia:bottlebrush_orchid", param2=math.random(0,3)})
	
end

biome_lib:register_generate_plant({
    surface = {"base:dirt_with_grass"},
    max_count = Bottlebrush_Orchid_Max_Count,
    rarity = Bottlebrush_Orchid_Rarity,
    min_elevation = 5,
	max_elevation = 70,
	near_nodes = {
		"australia:fan_palm_tree",
		"australia:merbau_tree"
	},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.grow_bottlebrush_orchid
)
end



-----------------------------------------------------------------------------------------------
-- MuSHRooMS
-----------------------------------------------------------------------------------------------
if Mushrooms == true then
abstract_trunks.grow_mushrooms = function(pos)
	local on_ground = {x=pos.x, y=pos.y+1, z=pos.z}
	local mushroom_type = math.random(1,4)
	
	if mushroom_type == 1 then
		minetest.set_node(on_ground, {name="flowers:mushroom_red", param2=math.random(0,3)})
	else
		minetest.set_node(on_ground, {name="flowers:mushroom_brown", param2=math.random(0,3)})
	end
	
end

biome_lib:register_generate_plant({
    surface = {"base:dirt_with_grass"},
    max_count = Mushrooms_Max_Count,
    rarity = Mushrooms_Rarity,
    min_elevation = 5,
	max_elevation = 120,
	near_nodes = {
		"australia:celery_top_pine_tree",
		"australia:huon_pine_tree",
		"australia:swamp_gum_tree",
		"australia:tasmanian_myrtle_tree"
	},
	near_nodes_size = 2,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.grow_mushrooms
)
end

