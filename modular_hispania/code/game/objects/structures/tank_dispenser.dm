/obj/structure/dispenser/attack_ai(mob/user as mob)
	if(isrobot(user))
		ui_interact(user)
	return
