/datum/weather/rain_storm
	name = "rain storm"
	desc = "Torrential rains and high winds are common on this world. Be careful."
	probability = 90

	telegraph_message = "<span class='notice'>You feel faint drops of rain beginning to fall...</span>"
	telegraph_duration = 300
	telegraph_overlay = "light_rain"
	telegraph_sound = 'sound/ambience/rainstorm_light.ogg'

	weather_message = "<span class='userdanger'><i>The storm begins, and your surroundings are immediately drenched in warm water.</i></span>"
	weather_overlay = "rain_storm"
	weather_duration_lower = 600
	weather_duration_upper = 1500
	use_glow = FALSE
	aesthetic = TRUE
	weather_sound = 'sound/ambience/rainstorm_heavy.ogg'

	end_duration = 100
	end_overlay = "light_rain"
	end_message = "<span class='boldannounce'>The worst of the rain seems to have passed, and each drop is a little further apart.</span>"
	end_sound = 'sound/ambience/rainstorm_light.ogg'

	area_type = /area
	protect_indoors = TRUE
	target_trait = ZTRAIT_RAINSTORM

	///Lowest we can cool someone randomly per weather act. Positive values only
	var/cooling_lower = 0
	///Highest we can cool someone randomly per weather act. Positive values only
	var/cooling_upper = 0

// /datum/weather/rain_storm/weather_act(mob/living/living)
	// living.adjust_bodytemperature(-rand(cooling_lower, cooling_upper))

// since rainstorm is on a station z level, add extra checks to not annoy everyone
/datum/weather/rain_storm/can_get_alert(mob/player)
	if(!..())
		return FALSE

	if(!is_station_level(player.z))
		return TRUE  // bypass checks

	if(isobserver(player))
		return TRUE

	if(HAS_MIND_TRAIT(player, TRAIT_DETECT_STORM))
		return TRUE

	if(istype(get_area(player), /area/mine))
		return TRUE


	for(var/area/rain_area in impacted_areas)
		if(locate(rain_area) in view(player))
			return TRUE

	return FALSE

///A storm that doesn't stop storming, and is a bit stronger
/datum/weather/rain_storm/forever_storm
	telegraph_duration = 0
	perpetual = TRUE

	probability = 0

