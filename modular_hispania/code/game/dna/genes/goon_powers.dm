//HISPA genes agregados
GLOBAL_VAR_INIT(superfartblock, 0)

////////////////////////////////////////////////////////////////////////

// WAS: /datum/bioEffect/superfart
/datum/mutation/grant_spell/superfart
	name = "High-Pressure Intestines"
	desc = "Vastly increases the gas capacity of the subject's digestive tract."
	activation_messages = list("You feel bloated and gassy.")
	deactivation_messages = list("You no longer feel gassy. What a relief!")
	instability = GENE_INSTABILITY_MINOR
	spelltype = /obj/effect/proc_holder/spell/aoe/superfart

/datum/mutation/grant_spell/superfart/New()
	..()
	block = GLOB.superfartblock

/obj/effect/proc_holder/spell/aoe/superfart/create_new_targeting()
	var/datum/spell_targeting/aoe/turf/T = new()
	T.range = 3
	return T

/obj/effect/proc_holder/spell/aoe/superfart
	name = "Super Fart"
	desc = "Fart with the fury of 1000 burritos."
	panel = "Abilities"
	base_cooldown = 900
	invocation_type = "none"
	clothes_req = 0
	action_background_icon_state = "bg_default"
	action_icon_state = "parasmoke"
	var/list/compatible_mobs = list(/mob/living/carbon/human)

/obj/effect/proc_holder/spell/aoe/superfart/invocation(mob/user = usr)
	invocation = "<span class='warning'>[user] hunches down and grits [user.p_their()] teeth!</span>"
	invocation_emote_self = "<span class='warning'>You hunch down and grit your teeth!</span>"
	..(user)

/obj/effect/proc_holder/spell/aoe/superfart/cast(list/targets, mob/user)
	var/UT = get_turf(user)
	if(do_after(user, 30, target = user))
		var/fartsize = pick("tremendous","gigantic","colossal")
		playsound(UT, 'modular_hispania/sound/effects/superfart.ogg', 50, 0)
		user.visible_message("<span class='warning'><b>[user]</b> unleashes a [fartsize] fart!</span>", "<span class='warning'>You hear a [fartsize] fart.</span>")
		for(var/T in targets)
			for(var/mob/living/M in T)
				shake_camera(M, 10, 5)
				if(M == user)
					continue
				to_chat(M, "<span class='warning'>You are sent flying!</span>")
				M.Weaken(5)
				step_away(M, UT, 15)
				step_away(M, UT, 15)
				step_away(M, UT, 15)
		user.emote("fart")
	else
		to_chat(user, "<span class='warning'>You were interrupted and couldn't fart! Rude!</span>")
