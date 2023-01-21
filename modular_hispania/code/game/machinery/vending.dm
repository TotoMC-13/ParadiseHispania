
//Hispania Vending

/obj/machinery/economy/vending
	var/list/hispa_products = list()
	var/list/hispa_contraband = list()
	var/list/hispa_premium = list()
	var/list/hispa_prices = list()

///Hispania Civilians Clothes

/obj/machinery/economy/vending/Initialize(mapload)
	products |= hispa_products // For each, use the following pattern:
	contraband |= hispa_contraband // list(/type/path = amount,/type/path2 = amount2)
	premium |= hispa_premium
	prices |= hispa_prices
	..()

/obj/machinery/economy/vending/detdrobe
	hispa_products = list(
					/obj/item/clothing/under/rank/security/detective/black = 1,
					/obj/item/clothing/under/rank/security/detective/fem = 2,
					/obj/item/clothing/suit/storage/det_suit/forensics/black = 1,
					/obj/item/clothing/head/det_hat/black = 1)
	hispa_prices = list(
					/obj/item/clothing/under/rank/security/detective/black = 50,
					/obj/item/clothing/under/rank/security/detective/fem = 50,
					/obj/item/clothing/suit/storage/det_suit/forensics/black = 75,
					/obj/item/clothing/head/det_hat/black = 20)

//code by Danaleja2005

/obj/machinery/economy/vending/accesories
	name = "\improper Xtra"
	desc = "Accessories dispenser. Made by NT Corp."
	ads_list = ("Get fashion and useful, funny accessories for make your work better an happy, only with us NT Corp!, Remember Work is the most important.")
	icon = 'modular_hispania/icons/obj/vending.dmi'
	icon_state = "Xtra"
	icon_vend = "Xtra-vend"
	density = TRUE
	vend_delay = 12

	products = list(
					/obj/item/storage/wallet/random = 15,
					/obj/item/clothing/glasses/monocle = 5,
					/obj/item/clothing/glasses/regular = 5,
					/obj/item/deck/cards = 5,
					/obj/item/deck/tarot = 5,
					/obj/item/clothing/ears/headphones = 5,
					/obj/item/reagent_containers/food/drinks/mug = 5,
					/obj/item/clothing/accessory/necklace = 5,
					/obj/item/clothing/accessory/necklace = 5,
					/obj/item/clothing/accessory/necklace/dope = 5,
					/obj/item/clothing/accessory/necklace/locket = 5,
					/obj/item/clothing/accessory/armband = 5,
					/obj/item/lipstick = 5,
					/obj/item/lipstick/blue = 5,
					/obj/item/lipstick/lime= 5,
					/obj/item/lipstick/purple = 5,
					/obj/item/lipstick/jade = 5,
   					/obj/item/lipstick/black = 5,
   					/obj/item/lipstick/white = 5,
    				/obj/item/lipstick/green = 5,
   					/obj/item/clothing/head/kitty = 10,
   					/obj/item/clothing/head/kitty/mouse= 10,
   					/obj/item/clothing/head/collectable/rabbitears = 10,
    				/obj/item/bikehorn/rubberducky = 5,
					/obj/item/clothing/head/hairflower = 5,
    				///obj/item/storage/bag/UNO = 15,
    				/obj/item/stack/sheet/animalhide/monkey = 5,
    				/obj/item/stack/sheet/animalhide/lizard = 5)


	contraband = list(
					/obj/item/stack/sheet/animalhide/human = 5)


	prices = list(
					/obj/item/storage/wallet/random = 700,
					/obj/item/clothing/glasses/monocle = 800,
					/obj/item/clothing/glasses/regular = 1500,
					/obj/item/deck/cards = 400,
					/obj/item/deck/tarot = 500,
					/obj/item/clothing/ears/headphones = 1000,
					/obj/item/reagent_containers/food/drinks/mug = 400,
					/obj/item/clothing/accessory/necklace = 600,
					/obj/item/clothing/accessory/necklace/dope = 700,
					/obj/item/clothing/accessory/necklace/locket = 1200,
					/obj/item/clothing/accessory/armband = 450,
					/obj/item/lipstick = 200,
					/obj/item/lipstick/green = 200,
					/obj/item/lipstick/blue = 200,
					/obj/item/lipstick/lime= 220,
					/obj/item/lipstick/purple = 200,
					/obj/item/lipstick/jade = 220,
    				/obj/item/lipstick/black = 200,
    				/obj/item/lipstick/white = 200,
    				/obj/item/clothing/head/kitty = 550,
    				/obj/item/clothing/head/kitty/mouse = 550,
   					/obj/item/clothing/head/collectable/rabbitears = 550,
   				 	/obj/item/bikehorn/rubberducky = 679,
    				/obj/item/clothing/head/hairflower = 400,
    				///obj/item/storage/bag/UNO = 200,
    				/obj/item/stack/sheet/animalhide/monkey = 1500,
    				/obj/item/stack/sheet/animalhide/lizard = 2000)

/obj/machinery/economy/vending/security
	hispa_products = list(
					/obj/item/taperoll = 8,
					/obj/item/hailer = 5
					)
	hispa_prices = list(
					/obj/item/hailer = 100
					)

/obj/machinery/economy/vending/engivend
	hispa_products = list(/obj/item/taperoll/engi = 8)

//HISPANIA SEEDS
/obj/machinery/economy/vending/hydroseeds
	hispa_products = list(
					/obj/item/seeds/aloe =3,
					/obj/item/seeds/anonna = 3,
					/obj/item/seeds/avocado = 3,
					/obj/item/seeds/bell_pepper = 3,
					/obj/item/seeds/coconut = 3,
					/obj/item/seeds/kiwi = 3,
					/obj/item/seeds/mango = 3,
					/obj/item/seeds/mate = 3,
					/obj/item/seeds/nispero = 3,
					/obj/item/seeds/peach = 3,
					/obj/item/seeds/prickly_pear = 3,
					/obj/item/seeds/ricinus = 3,
					/obj/item/seeds/strawberry = 3,
					)

	hispa_contraband = list(
					/obj/item/seeds/money = 2,
					/obj/item/seeds/random = 2
					)
