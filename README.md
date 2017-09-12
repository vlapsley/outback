# Outback
A game for Minetest 0.4.16. The game is under heavy development and is still missing many features.

![Screenshot](https://raw.githubusercontent.com/vlapsley/outback/master/screenshot.png)

[Discussion on Minetest Forums](https://forum.minetest.net/viewtopic.php?f=9&t=14412)

## Gameplay
The inspiration for this game is my home country, Australia. I've tried to bring the landscape and 
flora into the game of Minetest. Enjoy and think of visiting Australia next time you travel abroad.

You can choose to play in a “survival mode” in which you have to fight monsters and hunger for 
survival and slowly progress through the various other aspects of the game, such as mining, farming, building machines, and so on. Or you can play in “creative mode” in which you can build almost 
anything instantly.

## Installation

### Download
1. [Download](https://github.com/vlapsley/outback/archive/master.zip) the .zip file
2. Extract the .zip archive with an archive manager (WinZip, 7-zip, gunzip...)
3. Rename the directory to *outback* and place it in the `/games` directory of Minetest.

### Using Git
1. Open the terminal (in Linux) or the Git shell (in Windows), and set the working directory (the 
*mods* folder) using `cd` - for example `cd /home/vlapsley/.minetest/games` or `cd C:\Users\vlapsley\minetest-0.4.16\games`
2. Clone (download) Outback game: `git clone https://github.com/vlapsley/outback.git`
3. Next time, you can automatically update the Outback game with the same `cd` command, and `git 
pull origin master`

## Completion status
This game is currently in **alpha** stage. It is playable, but very unfinished, many bugs are to be expected. Backwards-compability is *not* guaranteed, updating your world might cause small and big 
bugs (such as “missing node” errors or even crashes).

The following main features are available:

* Plenty of biomes to explore. Some are rich in resources, others barren and harsh.
* Trees, plants, bushes all native to Australia
* Saplings
* New stone - basalt, diorite, granite, limestone, shale, slate and red sandstone.
* Coral
* Chests
* Boats
* Fire
* Minecarts
* Torches
* Beds
* Books and bookshelves
* Dyes
* TNT

The following features are incomplete or not yet implemented:

* Buidling blocks: Stairs, slabs, doors, trapdoors, fences, fence gates, and walls.
* New ores - silver, nickel, zinc, lead, uranium and a reuse of mese.
* Precious stones - Agate, Amethyst, Citrine, Emerald, Jade, Opal, Ruby, Sapphire, Smoky Quartz, and Thunder Eggs.
* New fuel - crude oil
* Basic tools
* Technic mod (machines, nuclear reactor)
* Pipeworks
* Mesecons
* Mobs - Great White Shark, Tiger Shark, Saltwater Crocodile, Brown Snake, Tiger Snake, Emu, 
Kangaroo, and Wombat.
* Combat: weapons and armor
* Weather and seasons
* Ambient sounds
* Farming and crops
* Food recipies
* Wine and brewing
* Villages - Pub, cattle station, sheep station, simple crop farmhouse.
* Hunger, thirst and stamina.
* Additions to survival mode - poison, medikits / first aid, Indigenous remedies.
* Shipwrecks
* Subterrane monsters - just enough to keep you on your toes.
* Crafting guide
* In-game help system
* Licenses and credits
* Readme files and API documentation

## Info for programmers
You find interesting and useful infos in `API.md`.
This project is currently mostly a one-person project.

## Legal information

### License of source code
Outback is licensed under the GNU LGPL v2.1 (vlapsley, minetest developers and countless others) 
(see `LICENSE.txt`).

### License of media (textures, models and sounds)
No non-free licenses are used anywhere.

See README.txt in each mod directory for detailed information about other authors.
