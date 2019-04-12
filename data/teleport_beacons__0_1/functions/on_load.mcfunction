# while testing (comment out after stable)
#execute as @e[tag=teleport_beacon] run tag @s remove teleport_beacon
#execute as @e[tag=teleport_cooldown] run tag @s remove teleport_cooldown
#execute as @e[tag=teleport_paired] run tag @s remove teleport_paired

# cooldown timers
scoreboard objectives add Ints dummy
scoreboard objectives add PortalCooldown dummy "Portal Cooldown"
scoreboard players set __zero Ints 0
scoreboard players set __20 Ints 20
scoreboard players set __30 Ints 30

# target xyz coords
scoreboard objectives add DestX dummy "Target X"
scoreboard objectives add DestY dummy "Target Y"
scoreboard objectives add DestZ dummy "Target Z"

# warmup timers
scoreboard objectives add PortalWarmupT dummy "Ticks to Teleport"
scoreboard objectives add PortalWarmup dummy "Time to Teleport"

# prepare users for titles
title @a times 0 5 0

