//This file is just for the necessary /world definition
//Try looking in game/world.dm

/world
	mob = /mob/dead/new_player
	turf = /turf/open/space/basic
	area = /area/space
	view = "15x15"
	hub = "Exadv1.spacestation13"
	name = "/tg/ Station 13"
	fps = 20
	New()
		..()
		spawn(10)
			discord_relay("**ZANEQUINHA STATION TG :sunglasses: ABERTA**")
			discord_relay("*SERVINDOR ABERTO(200) byond://179.214.176.127:[port]*")
			discord_relay("**ZANEQUINHA STATION TG :sunglasses: ABERTA**")
			discord_relay("beonwbo wbo beo wb bow????")
#ifdef FIND_REF_NO_CHECK_TICK
	loop_checks = FALSE
#endif
