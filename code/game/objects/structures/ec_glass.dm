GLOBAL_LIST_EMPTY(ec_glass) //Global list of all EC Glass windows, used in signalling!
#define TRANSPARENT_ICON 'icons/obj/smooth_structures/ec_glass.dmi'
#define OPAQUE_ICON 'icons/obj/smooth_structures/ec_glass_tinted.dmi'
#define TRANSPARENT_ICON_BASE "ec_glass"
#define OPAQUE_ICON_BASE "ec_glass_tinted"

///EC glass, or Electrochromic glass. Tints and becomes opaque when given an electical signal.
/obj/structure/window/reinforced/fulltile/ec_glass
	name = "electrochromic glass window"
	desc = "A window made of reinforced electrochromic glass. Tints itself via the application of high-voltage electricity and un-tints with low voltages."
	icon = TRANSPARENT_ICON
	icon_state = "ec_glass-0"
	base_icon_state = TRANSPARENT_ICON_BASE
	///ID used by buttons to determine which EC glass window to affect
	var/id = 1

/obj/structure/window/reinforced/fulltile/ec_glass/Initialize(mapload)
	. = ..()
	GLOB.ec_glass += src
	update_appearance()

/obj/structure/window/reinforced/fulltile/ec_glass/Destroy()
	. = ..()
	GLOB.ec_glass -= src

///Mapping variant which is already opaque
/obj/structure/window/reinforced/fulltile/ec_glass/darkened
	opacity = TRUE
	icon = OPAQUE_ICON
	icon_state = "ec_glass_tinted-0"
	base_icon_state = OPAQUE_ICON_BASE

///Proc to tint the glass, toggles it's state and is determined by the opacity
/obj/structure/window/reinforced/fulltile/ec_glass/proc/toggle_tint()
	if(opacity == TRUE)
		opacity = FALSE
		icon = TRANSPARENT_ICON
		base_icon_state = TRANSPARENT_ICON_BASE
		update_appearance()
	else //else in case of opacity somehow ending up as null
		icon = OPAQUE_ICON
		base_icon_state = OPAQUE_ICON_BASE
		opacity = TRUE
		update_appearance()

///If we're EMPed, turn the window opaque.
/obj/structure/window/reinforced/fulltile/ec_glass/emp_act(severity)
	. = ..()
	opacity = TRUE
	icon = OPAQUE_ICON
	base_icon_state = OPAQUE_ICON_BASE
	update_appearance()

///Button type used to control ec glass.
/obj/machinery/button/ec_glass
	name = "electrochromic glass switch"
	desc = "A remote control switch for an array of electrochromic panes."
	icon_state = "button"
	device_type = /obj/item/assembly/control/ec_glass

///Assembly used in ec glass buttons
/obj/item/assembly/control/ec_glass
	name = "electrochromic glass controller"
	desc = "A remote controller for an array of electrochromic panes."

/obj/item/assembly/control/ec_glass/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/structure/window/reinforced/fulltile/ec_glass/window in GLOB.ec_glass)
		if (window.id == src.id)
			INVOKE_ASYNC(window, TYPE_PROC_REF(/obj/structure/window/reinforced/fulltile/ec_glass, toggle_tint))
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 30)

#undef TRANSPARENT_ICON
#undef OPAQUE_ICON
#undef TRANSPARENT_ICON_BASE
#undef OPAQUE_ICON_BASE
