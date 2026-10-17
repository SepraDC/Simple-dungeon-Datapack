# Punish players who break a protected wall block while inside the dungeon.
execute as @a[gamemode=!creative,gamemode=!spectator,scores={dungeon.mined.bricks=1..}] at @s if predicate dungeon:in_dungeon run function dungeon:anti_dig/punish
execute as @a[gamemode=!creative,gamemode=!spectator,scores={dungeon.mined.tiles=1..}] at @s if predicate dungeon:in_dungeon run function dungeon:anti_dig/punish
execute as @a[gamemode=!creative,gamemode=!spectator,scores={dungeon.mined.polished=1..}] at @s if predicate dungeon:in_dungeon run function dungeon:anti_dig/punish
execute as @a[gamemode=!creative,gamemode=!spectator,scores={dungeon.mined.chiseled=1..}] at @s if predicate dungeon:in_dungeon run function dungeon:anti_dig/punish
execute as @a[gamemode=!creative,gamemode=!spectator,scores={dungeon.mined.mud=1..}] at @s if predicate dungeon:in_dungeon run function dungeon:anti_dig/punish

# Blocks mined outside the dungeon (ancient cities use the same blocks) are ignored and cleared too.
scoreboard players reset @a[scores={dungeon.mined.bricks=1..}] dungeon.mined.bricks
scoreboard players reset @a[scores={dungeon.mined.tiles=1..}] dungeon.mined.tiles
scoreboard players reset @a[scores={dungeon.mined.polished=1..}] dungeon.mined.polished
scoreboard players reset @a[scores={dungeon.mined.chiseled=1..}] dungeon.mined.chiseled
scoreboard players reset @a[scores={dungeon.mined.mud=1..}] dungeon.mined.mud
scoreboard players remove @a[scores={dungeon.anti_dig.cooldown=1..}] dungeon.anti_dig.cooldown 1
