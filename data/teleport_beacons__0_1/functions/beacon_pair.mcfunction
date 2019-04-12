# save the new beacon's location to the waiting beacon
execute store result score @e[tag=teleport_waiting_for_pair] DestX run data get entity @s TileX
execute store result score @e[tag=teleport_waiting_for_pair] DestY run data get entity @s TileY
execute store result score @e[tag=teleport_waiting_for_pair] DestZ run data get entity @s TileZ

# adjust target based on direction faced by painting
execute if entity @s[nbt={"Facing":0b}] run scoreboard players add @e[tag=teleport_waiting_for_pair] DestZ 1
execute if entity @s[nbt={"Facing":1b}] run scoreboard players remove @e[tag=teleport_waiting_for_pair] DestX 1
execute if entity @s[nbt={"Facing":2b}] run scoreboard players remove @e[tag=teleport_waiting_for_pair] DestZ 1
execute if entity @s[nbt={"Facing":3b}] run scoreboard players add @e[tag=teleport_waiting_for_pair] DestX 1

# save the waiting beacon's location to the new beacon
execute store result score @s DestX run data get entity @e[tag=teleport_waiting_for_pair,limit=1] TileX
execute store result score @s DestY run data get entity @e[tag=teleport_waiting_for_pair,limit=1] TileY
execute store result score @s DestZ run data get entity @e[tag=teleport_waiting_for_pair,limit=1] TileZ

# adjust target based on direction faced by painting
execute if entity @e[tag=teleport_waiting_for_pair,nbt={"Facing":0b}] run scoreboard players add @s DestZ 1
execute if entity @e[tag=teleport_waiting_for_pair,nbt={"Facing":1b}] run scoreboard players remove @s DestX 1
execute if entity @e[tag=teleport_waiting_for_pair,nbt={"Facing":2b}] run scoreboard players remove @s DestZ 1
execute if entity @e[tag=teleport_waiting_for_pair,nbt={"Facing":3b}] run scoreboard players add @s DestX 1

tell @p "Remember: `forceload add ~ ~` so you don't fall into the void!"

# stop waiting
execute as @e[tag=teleport_waiting_for_pair] run function teleport_beacons__0_1:beacon_disable
execute as @s run function teleport_beacons__0_1:beacon_disable
tag @s add teleport_beacon
tag @s add teleport_paired
tag @e[tag=teleport_waiting_for_pair] add teleport_paired
tag @e[tag=teleport_waiting_for_pair] remove teleport_waiting_for_pair
