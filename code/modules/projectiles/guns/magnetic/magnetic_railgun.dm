/obj/item/weapon/gun/magnetic/railgun
	name = "HellTek Thundergod"
	desc = "The HelTek Arms Thundergod is a powerful pattern of railgun originally produced for the Human-Unathi War. With a capable battery and fast coils, this weapon has ironically become a favorite amongst Unathi Stormtroops!"
	icon = 'icons/obj/guns/railgun.dmi'
	icon_state = "railgun"
	removable_components = TRUE // Can swap out the capacitor for more shots, or cell for longer usage before recharge
	load_type = /obj/item/weapon/rcd_ammo
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4, TECH_MAGNET = 4)
	projectile_type = /obj/item/projectile/bullet/magnetic/slug
	one_hand_penalty = 6
	power_cost = 300
	fire_delay = 35
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	loaded = /obj/item/weapon/rcd_ammo/large // ~30 shots
	combustion = 1
	bulk = GUN_BULK_RIFLE + 3

	var/initial_cell_type = /obj/item/weapon/cell/hyper
	var/initial_capacitor_type = /obj/item/weapon/stock_parts/capacitor/adv // 6-8 shots
	gun_unreliable = 0
	var/slowdown_held = 3
	var/slowdown_worn = 2

/obj/item/weapon/gun/magnetic/railgun/Initialize()

	capacitor = new initial_capacitor_type(src)
	capacitor.charge = capacitor.max_charge

	cell = new initial_cell_type(src)
	if (ispath(loaded))
		loaded = new loaded (src, load_sheet_max)
	slowdown_per_slot[slot_l_hand] =  slowdown_held
	slowdown_per_slot[slot_r_hand] =  slowdown_held
	slowdown_per_slot[slot_back] =    slowdown_worn
	slowdown_per_slot[slot_belt] =    slowdown_worn
	slowdown_per_slot[slot_s_store] = slowdown_worn

	. = ..()

// Not going to check type repeatedly, if you code or varedit
// load_type and get runtime errors, don't come crying to me.
/obj/item/weapon/gun/magnetic/railgun/show_ammo(var/mob/user)
	var/obj/item/weapon/rcd_ammo/ammo = loaded
	if (ammo)
		to_chat(user, "<span class='notice'>There are [ammo.remaining] shot\s remaining in \the [loaded].</span>")
	else
		to_chat(user, "<span class='notice'>There is nothing loaded.</span>")

/obj/item/weapon/gun/magnetic/railgun/check_ammo()
	var/obj/item/weapon/rcd_ammo/ammo = loaded
	return ammo && ammo.remaining

/obj/item/weapon/gun/magnetic/railgun/use_ammo()
	var/obj/item/weapon/rcd_ammo/ammo = loaded
	ammo.remaining--
	if(ammo.remaining <= 0)
		spawn(3)
			playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 1)
		out_of_ammo()

/obj/item/weapon/gun/magnetic/railgun/proc/out_of_ammo()
	qdel(loaded)
	loaded = null
	visible_message("<span class='warning'>\The [src] beeps and ejects its empty cartridge.</span>")

/obj/item/weapon/gun/magnetic/railgun/mmi
	desc = "The Mars Military Industries MI-72 Comet. A man-portable mass driver for squad support, anti-armour and destruction of fortifications and emplacements."
	icon = 'icons/obj/guns/railgun_old.dmi'
	icon_state = "old_railgun"

/obj/item/weapon/gun/magnetic/railgun/tcc // Oppa! Should only be available to TCC shock troops or high-budget mercs.
	name = "HelTek Eviction"
	desc = "The HelTek Arms Eviction is then next evolution in man-portable helical rail cannons! This weapon's pricetag alone has led to it being considered more a legend than a actual firearm!"
	icon = 'icons/obj/guns/railgun_adv.dmi'
	icon_state = "railgun-tcc"
	removable_components = TRUE // Railgunners are expected to be able to completely disassemble and reassemble their weapons in the field. But we don't have that mechanic, so the cell and capacitor will do.

	initial_cell_type = /obj/item/weapon/cell/hyper // Standard power
	initial_capacitor_type = /obj/item/weapon/stock_parts/capacitor/adv // 6-8 shots
	power_cost = 280 // Same number of shots, but it'll seem to recharge slightly faster

	loaded = /obj/item/stack/material/rods
	load_type = /obj/item/stack/material/rods // The Confederation learned that chunks of metal work just as well as fancy matter cartridges - actually they dont
	projectile_type = /obj/item/projectile/bullet/magnetic
	load_sheet_max = 6 // Fewer shots per "magazine", but more abundant than matter cartridges.
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 3, TECH_MAGNET = 5)
	slowdown_worn = 3 // Little slower when worn

/obj/item/weapon/gun/magnetic/railgun/tcc/show_ammo(var/mob/user)
	var/obj/item/stack/material/rods/ammo = loaded
	if(istype(ammo))
		to_chat(user, "<span class='notice'>It has [ammo.amount] shots loaded.</span>")

/obj/item/weapon/gun/magnetic/railgun/tcc/check_ammo()
	var/obj/item/stack/material/rods/ammo = loaded
	return ammo && ammo.amount

/obj/item/weapon/gun/magnetic/railgun/tcc/out_of_ammo()
	QDEL_NULL(loaded)
	loaded = null
	spawn(3)
		playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 1)
	visible_message("<span class='warning'>\The [src] beeps, before clanging as the ammunition bank resets.</span>")

/obj/item/weapon/gun/magnetic/railgun/tcc/use_ammo()
	var/obj/item/stack/material/rods/ammo = loaded
	ammo.use(1)
	if(!istype(ammo))
		out_of_ammo()

/obj/item/weapon/gun/magnetic/railgun/automatic // Adminspawn only, this shit is absurd.
	name = "\improper LMRA autocannon"
	desc = "The HelTek Arms LMRA-14A Autocannon. Designed originally for light-skinned vehicles, this weapon has been upgraded with hyperlight materials and 'recoil dampeners' to somehow make it man-portable! A favorite amongst the SMC!"
	icon = 'icons/obj/guns/railgun_heavy.dmi'
	icon_state = "heavy_railgun"
	removable_components = FALSE // Absolutely not. This has an infinity cell.

	initial_cell_type = /obj/item/weapon/cell/infinite
	initial_capacitor_type = /obj/item/weapon/stock_parts/capacitor/super

	fire_delay =  8
	slowdown_held = 4

	slowdown_worn = 3

	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_NO_CONTAINER

	firemodes = list(
		list(mode_name="semiauto",    burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=5,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="long bursts",  burst=6, fire_delay=null, move_delay=10,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/magnetic/railgun/automatic/examine(mob/user, distance)
	. = ..()
	if(distance <= 1)
		to_chat(user, "<span class='notice'>Someone has scratched <i>Ultima Ratio Regum</i> onto the side of the barrel.</span>")

/obj/item/weapon/gun/magnetic/railgun/automatic/mmi
	name = "\improper RHR accelerator"
	desc = "The Mars Military Industries MI-227 Meteor. Originally a vehicle-mounted turret weapon for heavy anti-vehicular and anti-structural fire, the fact that it was made man-portable is mindboggling in itself."
	icon = 'icons/obj/guns/railgun_old_heavy.dmi'
	icon_state = "old_heavy_railgun"

/obj/item/weapon/gun/magnetic/railgun/flechette
	name = "flechette gun"
	desc = "The MI-12 Skadi is a burst fire capable railgun that fires flechette rounds at high velocity. Deadly against armour, but much less effective against soft targets."
	icon = 'icons/obj/guns/flechette.dmi'
	icon_state = "flechette_gun"
	item_state = "z8carbine"
	one_hand_penalty = 2
	fire_delay = 8
	removable_components = FALSE
	initial_cell_type = /obj/item/weapon/cell/hyper
	initial_capacitor_type = /obj/item/weapon/stock_parts/capacitor/adv
	slot_flags = SLOT_BACK
	power_cost = 100
	load_type = /obj/item/weapon/magnetic_ammo
	projectile_type = /obj/item/projectile/bullet/magnetic/flechette
	loaded = /obj/item/weapon/magnetic_ammo
	wielded_item_state = "z8carbine-wielded"

	firemodes = list(
		list(mode_name="semiauto",    burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=5,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		)

/obj/item/weapon/gun/magnetic/railgun/flechette/out_of_ammo()
	visible_message("<span class='warning'>\The [src] beeps to indicate the magazine is empty.</span>")


/obj/item/weapon/gun/magnetic/railgun/flechette/skrell
	name = "ZT-8 rifle"
	desc = "The Zquiv*Tzuuli-8, or ZT-8, is a railgun rarely seen by anyone other than those within Skrellian SDTF ranks. The rotary magazine houses a cylinder with individual chambers, that press against the barrel when loaded."
	icon = 'icons/obj/guns/skrell_rifle.dmi'
	icon_state = "skrell_rifle"
	item_state = "skrell_rifle"
	one_hand_penalty = 3
	fire_delay = 10
	slowdown_held = 1
	slowdown_worn = 1
	removable_components = FALSE
	initial_cell_type = /obj/item/weapon/cell/hyper
	initial_capacitor_type = /obj/item/weapon/stock_parts/capacitor/adv
	load_type = /obj/item/weapon/magnetic_ammo/skrell
	loaded = /obj/item/weapon/magnetic_ammo/skrell/slug
	projectile_type = /obj/item/projectile/bullet/magnetic/slug
	slot_flags = SLOT_BACK
	power_cost = 100
	wielded_item_state = "skrell_rifle-wielded"
	firemodes = list()