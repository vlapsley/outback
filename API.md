# API

## APIs for adding simple things
You can add simple things by calling functions in the various Outback mods.

### Undocumented APIs
You can also add stuff for the following things, but the APIs are currently undocumented. These 
mods are very similar to Minetest Game.

* Beds: See `mods/ITEMS/beds`
* Buckets (for new liquids): See `mods/ITEMS/bucket`
* Doors: See `mods/ITEMS/doors`
* Fences and fence gates: See `mods/ITEMS/fences`
* Panes (like glass panes and iron bars): See `mods/ITEMS/xpanes`
* Stairs and slabs: See `mods/ITEMS/stairs`
* Walls: See `mods/ITEMS/walls`

## Mobs
This mod uses Mobs Redo [`mobs`] by TenPlus1, a very powerful mod for adding mods of various kinds.
There are minor modificiations for Outback compability and some items have been removed or moved to 
other mods, but the API is identical to the original.
You can add your own mobs, spawn eggs and spawning rules with this mod.
API documnetation is included in `mods/ENTITIES/mobs/api.txt`

Note that mob models and spawn in Outback have not been implemented yet and the use of the Mobs 
Redo may change.

## Other APIs
* Statbars / HUD bars: See `mods/HUD/hudbars/API.md`
* Hunger: See `mods/PLAYER/hb_hunger`

## Other things of interest
Mods found in `mods/CORE` contain important core APIs and utility functions, used throughout the 
subgame.
