/obj/structure/morgue/attack_ai(mob/user as mob)
	if(isrobot(user))
		var/mob/living/silicon/robot/R = user
		if(istype(R.module,/obj/item/robot_module/medical))
			return attack_hand(user)
	return


/obj/structure/m_tray/attack_ai(mob/user as mob)
	if(isrobot(user))
		var/mob/living/silicon/robot/R = user
		if(istype(R.module,/obj/item/robot_module/medical))
			return attack_hand(user)
	return
