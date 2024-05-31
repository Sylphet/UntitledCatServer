/turf/open/misc/roots
	name = "roots"
	desc = "A gritted soily ground, embroidered with a system of crystalline roots"
	icon = 'icons/turf/floors.dmi'
	icon_state = "roots"
	base_icon_state = "roots"
	baseturfs = /turf/open/misc/sandy_dirt //change to appropriate soil in future.

	footstep = FOOTSTEP_ROOTS
	barefootstep = FOOTSTEP_ROOTS
	clawfootstep = FOOTSTEP_ROOTS
	heavyfootstep = FOOTSTEP_ROOTS


//chance of walking on a tile and breaking a root, causing ouchies.
/turf/open/misc/roots/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/caltrop, min_damage = 3, max_damage = 10, probability = 30, flags = CALTROP_BYPASS_SHOES, soundfile = 'sound/effects/footstep/rootbreaks.ogg')
B
