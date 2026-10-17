# Mining fatigue III, refreshed on every block broken.
effect give @s minecraft:mining_fatigue 30 2

# The sound and the message are played at most once every 5 seconds.
execute unless score @s dungeon.anti_dig.cooldown matches 1.. run playsound minecraft:entity.elder_guardian.curse hostile @s ~ ~ ~ 1 0.6
execute unless score @s dungeon.anti_dig.cooldown matches 1.. run title @s actionbar {text:"The dungeon walls resist...",color:"dark_gray",italic:true}
scoreboard players set @s dungeon.anti_dig.cooldown 100
