# Roadmap

Goal: turn Simple Dungeon into a combat-focused dungeon that takes advantage of the tools introduced with Trial Chambers (trial spawners, vaults, trial keys) and of what data packs can do in Minecraft 26.3.

Target version: **Minecraft 26.3** (data pack format 121).

## Done

### Update to Minecraft 26.3
- `pack.mcmeta` uses `min_format` / `max_format` (121).
- `data/dungeon/structures/` renamed to `data/dungeon/structure/` (required since 1.21).

### Broken jigsaw references
- Jigsaws pointing to the non-existent pool `minecraft:secondary_rooms` now point to `dungeon:secondary_rooms` (corridors, forge, kitchen, library, maze). Those exits never generated before.
- Jigsaws pointing to `dungeon:empty` now point to `minecraft:empty`.

### Step 1: Vanilla only (no mod dependencies)
The structures were built in a modded instance. Everything has been replaced with vanilla equivalents:
- **Kitchen**: Farmer's Delight and MrCrayfish's Furniture blocks replaced (barrels, smokers, cauldron, oak furniture). Modded food items replaced with vanilla food.
- **Forge**: Alex's Caves `mine_guardian` spawner now spawns blazes.
- **Maze, room 2, room 3**: Better Strongholds loot tables replaced with vanilla ones.
- **Red room**: Endless Biomes lamp replaced with a shroomlight, Alex's Mobs items in item frames replaced.
- **Undying room**: Alex's Mobs grapple replaced with wind charges.
- Forge-only entity attributes (`forge:entity_gravity`, `forge:step_height_addition`) removed.

### Kitchen loot tables
Kitchen barrels use dedicated loot tables instead of hand-filled inventories, in `data/dungeon/loot_table/chests/kitchen/`:

| Table | Content |
|---|---|
| `pantry` | Raw ingredients, poisonous potatoes, rare golden carrots |
| `meals` | Cooked food, stews, suspicious stew (mostly bad effects), rare golden apple |
| `desserts` | Cookies, pies, berries, melon, rare cake or golden apple |

About half of all rolls give rotten flesh: the kitchen has been abandoned for a long time.

## Next steps

### Step 2: Combat with trial spawners and dungeon loot tables
- **Themed trial spawners per room**: magma cubes and blazes in the forge, vexes and evokers in the library, wither skeletons in the maze. Trial spawners spawn waves scaled to the number of players, go on cooldown once beaten and eject a reward.
- **Equipped mobs**: mobs spawned by a trial spawner can wear gear from a loot table (enchanted bows for skeletons, armored zombies...).
- **Elites**: the `scale` attribute (since 1.20.5) allows bigger mini-bosses, such as a giant wither skeleton with more health and a custom name.
- **Ominous mode**: with Bad Omen, the dungeon gets harder and gives better rewards, like Trial Chambers.
- **Dedicated `dungeon:` loot tables** for every room type (forge, library, maze, secret rooms) instead of village and stronghold tables.

> Before writing trial spawner configurations, check their exact format in 26.3: it has changed since 1.21.

### Step 3: Rewards and the final room
- **Dungeon key**: vaults accept any item as a key, for example a custom "Dungeon Key" with its own name and model. Room trial spawners drop it when beaten.
- **Vaults** with their own loot tables, including ominous vaults.
- **Exclusive enchantment**: enchantments are data-driven since 1.21. A custom enchantment only found in this dungeon gives a reason to explore it.
- **Final room**: a boss arena with ominous vaults, reached after beating rooms to collect keys. Best built in game, then integrated (jigsaws, pools, weights).

### Step 4: Variety
- **Dungeon themes** with jigsaw `pool_aliases` (since 1.20.5): a whole dungeon picks one theme (undead, illagers, Nether), and mobs and loot follow it.
- **Processors** that randomly add cracked bricks, moss and cobwebs, so each dungeon looks different with the same rooms.
- **Advancements**: find the dungeon, beat the boss, find every secret room.

## Open points
- `corridor/cross_1` is not used by any pool and its south exit leads nowhere. It looks like an old draft of `small_cross_1`: delete it or add it to a pool.
- The structure files were saved in 1.20.1 / 1.20.2 and are upgraded by the game when loaded. Re-saving them with a structure block in 26.3 would remove that dependency.
