# particle effects for ui feedback
execute at @s run particle portal ~ ~ ~ 0.1 0.4 0.1 1 2

# if a player is very close, prepare to teleport
execute as @s at @s if entity @a[distance=..2] if entity @e[distance=..1,tag=!teleport_warmup] run scoreboard players set @s PortalWarmupT 150
execute as @s at @s if entity @a[distance=..2] run tag @s add teleport_warmup

# if all players leave, cancel teleport
execute as @s at @s unless entity @a[distance=..2] run tag @s remove teleport_warmup
execute as @s at @s unless entity @a[distance=..2] run scoreboard players reset @s PortalWarmupT
execute as @s at @s unless entity @a[distance=..2] run scoreboard players reset @s PortalWarmup
