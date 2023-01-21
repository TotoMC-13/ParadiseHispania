/obj/item/card/id/captains_spare
	var/confirmacion_pickeo = TRUE

/obj/item/card/id/captains_spare/proc/cooldown_confirmacion()
	confirmacion_pickeo = FALSE
	spawn(30 SECONDS)
		confirmacion_pickeo = TRUE

/obj/item/card/id/captains_spare/attack_hand(mob/living/user)
	if(iswizard(user) || (isabductor(user)))   // || isshadowling(user)
		if(iswizard(user))
			if(confirmacion_pickeo)
				to_chat(user, "Dudo que la federacion de magos aprobaria esto .. Si quiero abrir puertas puedo usar magia como el hechizo Knock knock!..")
				to_chat(usr, "<span class='boldannounce'>Esto podria causar una llamada de atencion de un admin y eventualmente una sancion ¿Estas seguro?</span>")

				/*
		if(isshadowling(user))
			to_chat(user, "<span class='userdanger'>Ughh... esta ID es muy brillosa. No seria buena idea tomarla.</span>")
			to_chat(usr, "<span class='boldannounce'>Esto podria causar una llamada de atencion de un admin y eventualmente una sancion ¿Estas seguro?</span>")
				*/

		if(isabductor(user)) //el abductor no puede tomarla
			to_chat(user, "Algo me dice que esta tecnologia primitiva no me sera necesaria...")
			return

		cooldown_confirmacion()

	..()
