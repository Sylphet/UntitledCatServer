/**********************Mine areas**************************/
/area/mine
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED | CULT_PERMITTED
	ambient_buzz = 'sound/ambience/magma.ogg'

/area/mine/lobby
	name = "Mining Station"
	icon_state = "mining_lobby"

/area/mine/storage
	name = "Mining Station Production Storage"
	icon_state = "mining_storage"

/area/mine/storage/public
	name = "Mining Station Public Storage"
	icon_state = "mining_storage"

/area/mine/production
	name = "Mining Station Production Wing"
	icon_state = "mining_production"

/area/mine/abandoned
	name = "Abandoned Mining Station"

/area/mine/living_quarters
	name = "Mining Station Living Quarters"
	icon_state = "mining_living"

/area/mine/eva
	name = "Mining Station EVA"
	icon_state = "mining_eva"

/area/mine/eva/lower
	name = "Mining Station Lower EVA"
	icon_state = "mining_eva"

/area/mine/maintenance
	name = "Mining Station Maintenance"

/area/mine/maintenance/production
	name = "Mining Station Production Maintenance"

/area/mine/maintenance/living
	name = "Mining Station Living Quarters Maintenance"

/area/mine/maintenance/living/north
	name = "Mining Station Living Quarters North Maintenance"

/area/mine/maintenance/living/south
	name = "Mining Station Living Quarters South Maintenance"

/area/mine/maintenance/public
	name = "Mining Station Public Maintenance"

/area/mine/maintenance/public/north
	name = "Mining Station Public North Maintenance"

/area/mine/maintenance/public/south
	name = "Mining Station Public South Maintenance"

/area/mine/maintenance/service
	name = "Mining Station Service Maintenance"

/area/mine/maintenance/service/disposals
	name = "Mining Station Disposals"

/area/mine/maintenance/service/comms
	name = "Mining Station Communications"

/area/mine/maintenance/labor
	name = "Labor Camp Maintenance"

/area/mine/cafeteria
	name = "Mining Station Cafeteria"
	icon_state = "mining_cafe"

/area/mine/cafeteria/labor
	name = "Labor Camp Cafeteria"
	icon_state = "mining_labor_cafe"

/area/mine/hydroponics
	name = "Mining Station Hydroponics"
	icon_state = "mining_hydro"

/area/mine/medical
	name = "Mining Station Emergency Medbay"

/area/mine/mechbay
	name = "Mining Station Mech Bay"
	icon_state = "mechbay"

/area/mine/lounge
	name = "Mining Station Public Lounge"
	icon_state = "mining_lounge"

/area/mine/laborcamp
	name = "Labor Camp"
	icon_state = "mining_labor"

/area/mine/laborcamp/quarters
	name = "Labor Camp Quarters"
	icon_state = "mining_labor_quarters"

/area/mine/laborcamp/production
	name = "Labor Camp Production"
	icon_state = "mining_labor_production"

/area/mine/laborcamp/security
	name = "Labor Camp Security"
	icon_state = "labor_camp_security"
	ambience_index = AMBIENCE_DANGER

/area/mine/laborcamp/security/maintenance
	name = "Labor Camp Security Maintenance"
	icon_state = "labor_camp_security"
	ambience_index = AMBIENCE_DANGER




/**********************Lavaland Areas**************************/

/area/lavaland
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED
	sound_environment = SOUND_AREA_LAVALAND
	ambient_buzz = 'sound/ambience/magma.ogg'

/area/lavaland/play_ambience(mob/M, sound/override_sound, volume)
	if(prob(1))
		return ..(M, 'sound/ambience/Cave1.ogg')
	return ..()

/area/lavaland/surface
	name = "Lavaland"
	icon_state = "explored"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambience_index = AMBIENCE_MINING
	area_flags = VALID_TERRITORY | UNIQUE_AREA
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/lavaland/underground
	name = "Lavaland Caves"
	icon_state = "unexplored"
	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	ambience_index = AMBIENCE_MINING
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/lavaland/surface/outdoors
	name = "Lavaland Wastes"
	outdoors = TRUE

/area/lavaland/surface/outdoors/unexplored //monsters and ruins spawn here
	icon_state = "unexplored"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/lavaland

/area/lavaland/surface/outdoors/unexplored/danger //megafauna will also spawn here
	icon_state = "danger"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED

/// Same thing as parent, but uses a different map generator for the icemoon ruin that needs it.
/area/lavaland/surface/outdoors/unexplored/danger/no_ruins
	map_generator = /datum/map_generator/cave_generator/lavaland/ruin_version

/area/lavaland/surface/outdoors/explored
	name = "Lavaland Labor Camp"
	area_flags = VALID_TERRITORY | UNIQUE_AREA



/**********************Ice Moon Areas**************************/

/area/icemoon
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	ambience_index = AMBIENCE_ICEMOON
	sound_environment = SOUND_AREA_ICEMOON
	ambient_buzz = 'sound/ambience/magma.ogg'

/area/icemoon/surface
	name = "Icemoon"
	icon_state = "explored"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/icemoon/surface/outdoors // parent that defines if something is on the exterior of the station.
	name = "Icemoon Wastes"
	outdoors = TRUE

/area/icemoon/surface/outdoors/Initialize(mapload)
	if(HAS_TRAIT(SSstation, STATION_TRAIT_BRIGHT_DAY))
		base_lighting_alpha = 145
	return ..()

/area/icemoon/surface/outdoors/nospawn // this is the area you use for stuff to not spawn, but if you still want weather.

/area/icemoon/surface/outdoors/nospawn/New() // unless you roll forested trait lol
	. = ..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_FORESTED))
		map_generator = /datum/map_generator/cave_generator/icemoon/surface/forested
		area_flags = MOB_SPAWN_ALLOWED | FLORA_ALLOWED//flip this on, the generator has already disabled dangerous fauna

/area/icemoon/surface/outdoors/noteleport // for places like the cursed spring water
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | NOTELEPORT

/area/icemoon/surface/outdoors/noruins // when you want random generation without the chance of getting ruins
	icon_state = "noruins"
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | CAVES_ALLOWED
	map_generator =  /datum/map_generator/cave_generator/icemoon/surface/noruins

/area/icemoon/surface/outdoors/labor_camp
	name = "Icemoon Labor Camp"
	area_flags = UNIQUE_AREA

/area/icemoon/surface/outdoors/unexplored //monsters and ruins spawn here
	icon_state = "unexplored"
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | CAVES_ALLOWED

/area/icemoon/surface/outdoors/unexplored/rivers // rivers spawn here
	icon_state = "danger"
	map_generator = /datum/map_generator/cave_generator/icemoon/surface

/area/icemoon/surface/outdoors/unexplored/rivers/New()
	. = ..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_FORESTED))
		map_generator = /datum/map_generator/cave_generator/icemoon/surface/forested
		area_flags |= MOB_SPAWN_ALLOWED //flip this on, the generator has already disabled dangerous fauna

/area/icemoon/surface/outdoors/unexplored/rivers/no_monsters
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | CAVES_ALLOWED

/area/icemoon/underground
	name = "Icemoon Caves"
	outdoors = TRUE
	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/icemoon/underground/unexplored // mobs and megafauna and ruins spawn here
	name = "Icemoon Caves"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED

/area/icemoon/underground/unexplored/no_rivers
	icon_state = "norivers"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED // same rules as "shoreline" turfs since we might need this to pull double-duty
	map_generator = /datum/map_generator/cave_generator/icemoon

/area/icemoon/underground/unexplored/rivers // rivers spawn here
	icon_state = "danger"
	map_generator = /datum/map_generator/cave_generator/icemoon

/area/icemoon/underground/unexplored/rivers/deep
	map_generator = /datum/map_generator/cave_generator/icemoon/deep

/area/icemoon/underground/unexplored/rivers/deep/shoreline //use this for when you don't want mobs to spawn in certain areas in the "deep" portions. Think adjacent to rivers or station structures.
	icon_state = "shore"
	area_flags = UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED

/area/icemoon/underground/explored // ruins can't spawn here
	name = "Icemoon Underground"
	area_flags = UNIQUE_AREA



/**********************Solace Areas**************************/

/area/solace
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	ambience_index = AMBIENCE_ICEMOON
	sound_environment = SOUND_ENVIRONMENT_PARKING_LOT

	base_lighting_alpha = 0
	var/gruetimer
	var/grueattack
	var/timing_id

/area/solace/surface
	name = "Icemoon"
	icon_state = "explored"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS
	forced_ambience = TRUE
	ambient_buzz = 'sound/ambience/ambiwind.ogg'
	ambient_buzz_vol = 100

/area/solace/surface/outdoors // parent that defines if something is on the exterior of the station.
	name = "Icemoon Wastes"
	outdoors = TRUE

/area/solace/underground
	name = "Icemoon Caves"
	outdoors = TRUE
	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

// grue territory, if you stay in there for too long you die, soft map edge kinda deal

	// outdoors

/area/solace/grueterritory
	name = "Icemoon Wastes"
	icon_state = "explored"
	outdoors = TRUE
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | GRUE_TERRITORY
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS
	ambient_buzz = 'sound/ambience/ambiwind_grue.ogg'

/area/solace/grueterritory/level_1
	icon_state = "grue_1"
	gruetimer = 120 SECONDS
	sound_environment = SOUND_ENVIRONMENT_CAVE
	mood_bonus = -2
	mood_message = "Something isn't right about this place..."

/area/solace/grueterritory/level_2
	icon_state = "grue_2"
	gruetimer = 45 SECONDS
	mood_bonus = -5
	mood_message = "I really, really want to get out of here."
	sound_environment = SOUND_ENVIRONMENT_QUARRY

/area/solace/grueterritory/level_3
	icon_state = "grue_3"
	gruetimer = 10 SECONDS
	mood_bonus = -10
	mood_message = "Something terrible is going to happen, I know it!"
	sound_environment = SOUND_ENVIRONMENT_STONEROOM

/area/solace/grueterritory/level_4
	icon_state = "grue_4"
	gruetimer = 1 SECONDS
	mood_bonus = -20
	mood_message = "It was inevitable."
	sound_environment = SOUND_ENVIRONMENT_UNDERWATER

// procs

/area/solace/grueterritory/Entered(atom/movable/arrived, area/old_area)
	. = ..()
	for(var/mob/living/enterer as anything in arrived.get_all_contents_type(/mob/living))
		var/area/solace/grueterritory/current = get_area(enterer)
		if(istype(current, /area/solace/grueterritory/level_1))
			to_chat(enterer, span_notice("The darkness seems thicker here, and it makes your hair stand on end."))
		if(istype(current, /area/solace/grueterritory/level_2))
			to_chat(enterer, span_warning("The air grows colder, and you feel eyes in the back of your head..."))
		if(istype(current, /area/solace/grueterritory/level_3))
			to_chat(enterer, span_danger("Your heart pounds in your chest, and you feel that you are in mortal danger!"))

		grueattack = addtimer(CALLBACK(usr, TYPE_PROC_REF(/mob/living/carbon/human,eaten_by_grue), enterer), gruetimer)

/area/solace/grueterritory/Exited(atom/movable/gone, area/old_area)
	. = ..()
	for(var/mob/living/exiter as anything in gone.get_all_contents_type(/mob/living))
		var/area/solace/grueterritory/currentexit = get_area(gone)
		if(!istype(currentexit, /area/solace/grueterritory))
			to_chat(exiter, span_notice("You feel lighter as you leave that place behind you."))
			deltimer(usr)
			grueattack = null

/mob/living/carbon/human/proc/eaten_by_grue(mob/living/target)
	var/mob/living/carbon/carbon_target = target
	if(istype(carbon_target, /area/solace/grueterritory/level_4))
		for(var/obj/item/bodypart/limb as anything in carbon_target.bodyparts)
			carbon_target.cause_wound_of_type_and_severity(WOUND_BLUNT, limb, WOUND_SEVERITY_CRITICAL)
			to_chat(carbon_target, span_narsiesmall("Everything goes dark."))
		gib()
		new /obj/effect/decal/remains/human(loc)
		to_chat(carbon_target, span_abductor("You have been eaten by a grue."))





/*
///Prevents entry to a certain area if it has flags preventing virtual entities from entering.
/datum/component/virtual_entity/proc/on_parent_pre_move(atom/movable/source, atom/new_location)
	SIGNAL_HANDLER

	var/area/location_area = get_area(new_location)
	if(!location_area)
		stack_trace("Virtual entity entered a location with no area!")
		return

	if(location_area.area_flags & VIRTUAL_SAFE_AREA)
		source.balloon_alert(source, "out of bounds!")
		COOLDOWN_START(src, OOB_cooldown, 2 SECONDS)
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE
*/
