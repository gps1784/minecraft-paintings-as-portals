# identify the teleport beacons
execute as @e[type=painting,tag=!teleport_beacon,limit=1] unless entity @e[tag=teleport_waiting_for_pair,limit=1] run function teleport_beacons__0_1:beacon_create
execute as @e[type=painting,tag=!teleport_beacon,limit=1] if entity @e[tag=teleport_waiting_for_pair,limit=1] run function teleport_beacons__0_1:beacon_pair

# if the beacon is waiting_for_pair
execute as @e[tag=teleport_beacon,tag=teleport_waiting_for_pair] run function teleport_beacons__0_1:on_tick_wait

# decrement cooldown, if cooldown is active
execute as @e[tag=teleport_paired,tag=teleport_cooldown] run function teleport_beacons__0_1:on_tick_cooldown

# if the beacon is active, there is no cooldown tag
execute as @e[tag=teleport_paired,tag=!teleport_cooldown] run function teleport_beacons__0_1:on_tick_active

# if a player is nearby, broadcast your sent location
execute as @e[tag=teleport_paired] at @s run title @a[distance=..3] actionbar ["Portal to ",{"score":{"name":"@e[tag=teleport_paired,limit=1,sort=nearest]","objective":"DestX"}}," ",{"score":{"name":"@e[tag=teleport_paired,limit=1,sort=nearest]","objective":"DestY"}}," ",{"score":{"name":"@e[tag=teleport_paired,limit=1,sort=nearest]","objective":"DestZ"}}]

# if a player is nearby and on warmup, count down
execute as @e[tag=teleport_warmup] at @s if entity @a[distance=..2] run function teleport_beacons__0_1:on_tick_warmup
