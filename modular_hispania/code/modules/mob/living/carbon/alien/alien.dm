/mob/living/carbon/human/attack_alien(mob/living/carbon/alien/M)
	if(isturf(loc) && istype(loc.loc, /area/shuttle/arrival/station))
		to_chat(M, "No deberia atacar tripulantes recien llegados")
		return
	..()

/obj/machinery/clonepod/biomass/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/computer/cloning/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/dna_scannernew/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/atmospherics/unary/cryo_cell/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/r_n_d/protolathe/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/computer/rdconsole/core/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/r_n_d/destructive_analyzer/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/r_n_d/circuit_imprinter/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/computer/communications/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()

/obj/machinery/power/apc/attack_alien(mob/living/user)
	if(istype(user,/mob/living/carbon/alien))
		to_chat(user,"<span class='warning'>Destruir esto no me resulta de utilidad</span>")
		return
	..()
