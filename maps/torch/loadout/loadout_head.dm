/datum/gear/head/solberet
	display_name = "SolGov beret selection"
	description = "A beret denoting service in an organization within SolGov."
	path = /obj/item/clothing/head/beret/solgov
	allowed_branches = SOLGOV_BRANCHES

/datum/gear/head/solberet/New()
	..()
	var/berets = list()
	berets["peacekeeper beret"] = /obj/item/clothing/head/beret/solgov
	berets["home guard beret"] = /obj/item/clothing/head/beret/solgov/homeguard
	berets["gateway administration beret"] = /obj/item/clothing/head/beret/solgov/gateway
	berets["customs and trade beret"] = /obj/item/clothing/head/beret/solgov/customs
	berets["government research beret"] = /obj/item/clothing/head/beret/solgov/research
	berets["health service beret"] = /obj/item/clothing/head/beret/solgov/health
	berets["diplomatic security beret"] = /obj/item/clothing/head/beret/solgov/diplomatic
	berets["border security beret"] = /obj/item/clothing/head/beret/solgov/borderguard
	berets["orbital assault beret"] = /obj/item/clothing/head/beret/solgov/orbital
	gear_tweaks += new/datum/gear_tweak/path(berets)

/datum/gear/head/veteranhat
	display_name = "veteran hat"
	path = /obj/item/clothing/head/soft/solgov/veteranhat
	allowed_branches = list(/datum/mil_branch/civilian, /datum/mil_branch/solgov, /datum/mil_branch/marine_corps, /datum/mil_branch/private_security)

/datum/gear/head/solhat
	display_name = "sol central government hat"
	path = /obj/item/clothing/head/soft/solgov
	allowed_branches = SOLGOV_BRANCHES

/datum/gear/head/fleethat
	display_name = "fleet hat"
	path = /obj/item/clothing/head/solgov/utility/fleet
	cost = 0
	allowed_branches = list(/datum/mil_branch/fleet)

/datum/gear/head/echat
	display_name = "SC cap"
	path = /obj/item/clothing/head/soft/solgov/expedition
	cost = 0
	allowed_branches = NT_BRANCHES

/datum/gear/head/surgical
	allowed_roles = STERILE_ROLES

/datum/gear/head/beret
	allowed_branches = list(/datum/mil_branch/civilian, /datum/mil_branch/solgov, /datum/mil_branch/marine_corps, /datum/mil_branch/private_security)

/datum/gear/mask/bandana
	allowed_branches = CASUAL_BRANCHES

/datum/gear/head/bandana
	allowed_branches = CASUAL_BRANCHES

/datum/gear/head/beanie
	allowed_branches = CASUAL_BRANCHES

/datum/gear/head/bow
	allowed_branches = CASUAL_BRANCHES

/datum/gear/head/cap
	allowed_branches = CASUAL_BRANCHES

/datum/gear/head/hairflower
	allowed_branches = CASUAL_BRANCHES

/datum/gear/head/hardhat
	allowed_roles = TECHNICAL_ROLES

/datum/gear/head/formalhat
	allowed_roles = FORMAL_ROLES
	allowed_branches = CASUAL_BRANCHES

/datum/gear/head/informalhat
	allowed_roles = SEMIFORMAL_ROLES

/datum/gear/head/welding
	allowed_roles = TECHNICAL_ROLES

/datum/gear/tactical/balaclava

/datum/gear/head/fleetberet
	display_name = "Fleet branch beret selection"
	description = "A beret denoting service in one of the branches within the SolGov Fleet."
	path = /obj/item/clothing/head/beret/solgov/fleet/branch
	allowed_branches = list(/datum/mil_branch/fleet)

/datum/gear/head/fleetberet/New()
	..()
	var/berets = list()
	berets["group 40 beret"] = /obj/item/clothing/head/beret/solgov/fleet/branch
	berets["border patrol beret"] = /obj/item/clothing/head/beret/solgov/fleet/branch/second
	berets["sol defense group beret"] = /obj/item/clothing/head/beret/solgov/fleet/branch/fourth
	gear_tweaks += new/datum/gear_tweak/path(berets)

/datum/gear/head/ECberet
	display_name = "SC sections beret selection"
	description = "An ancient beret bearing the insignias of the original expeditionary organization."
	path = /obj/item/clothing/head/beret/solgov/expedition/branch
	allowed_branches = NT_BRANCHES

/datum/gear/head/ECberet/New()
	..()
	var/berets = list()
	berets["field operation beret"] = /obj/item/clothing/head/beret/solgov/expedition/branch
	berets["observatory beret"] = /obj/item/clothing/head/beret/solgov/expedition/branch/observatory
	gear_tweaks += new/datum/gear_tweak/path(berets)
