# clear off old data from the countdown
scoreboard players reset @s PortalWarmupT
tag @s remove teleport_warmup

# create an armor stand and move it into position
execute as @s at @s run summon armor_stand ~ ~ ~ {NoGravity:1b, Marker:1b, CustomName:"\"teleport_target\"", Invisible: 1b}
execute as @s at @s store result entity @e[type=armor_stand,name=teleport_target,limit=1] Pos[0] double 1 run scoreboard players get @s DestX
execute as @s at @s store result entity @e[type=armor_stand,name=teleport_target,limit=1] Pos[1] double 1 run scoreboard players get @s DestY
execute as @s at @s store result entity @e[type=armor_stand,name=teleport_target,limit=1] Pos[2] double 1 run scoreboard players get @s DestZ
execute at @e[type=armor_stand,name=teleport_target,limit=1] as @e[tag=teleport_paired,tag=!teleport_cooldown,distance=..2,limit=1,sort=nearest] run function teleport_beacons__0_1:beacon_disable 
teleport @a[distance=..2] @e[type=armor_stand,name=teleport_target,limit=1]
kill @e[type=minecraft:armor_stand,name=teleport_target,limit=1]

# disable the teleporter, briefly
function teleport_beacons__0_1:beacon_disable
