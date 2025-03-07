/////////
// Cadet
/////////
/datum/job/seccadet
	title = "Security Cadet"
	department = "Security"
	department_flag = SEC
	total_positions = 2
	spawn_positions = 2
	supervisors = "the entirety of Security"
	economic_power = 1
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 18)
	selection_color = "#601c1c"
	alt_titles = list(
		"Forensics Trainee"
		)
	min_skill = list(   SKILL_EVA         = SKILL_ADEPT,
	                    SKILL_COMBAT      = SKILL_BASIC)
	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 16
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/security/maa
	allowed_branches = list(
		/datum/mil_branch/fleet,
		/datum/mil_branch/marine_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/marine_corps/e2,
		/datum/mil_rank/marine_corps/e3
	)
	access = list(access_security, access_brig, access_maint_tunnels,
						access_external_airlocks, access_emergency_storage,
			            access_eva, access_sec_doors, access_solgov_crew)
	minimal_access = list()
	software_on_spawn = list(/datum/computer_file/program/digitalwarrant)

/datum/job/seccadetn/get_description_blurb()
	return "You're either a new hire, or a new trainee aboard the [GLOB.using_map.full_name]. Everyone is your senior, and as such, you'd best listen to them."

/datum/job/squad_lead
	allowed_branches = list(/datum/mil_branch/marine_corps)
	allowed_ranks = list(
		/datum/mil_rank/marine_corps/e6
	)
	access = list(access_maint_tunnels, access_solgov_crew, access_petrov, access_petrov_security,
			            access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm, access_infantry,
			            access_infcom, access_inftech, access_aquila, access_eva)

/datum/job/squad_lead
	title = "Squad Lead"
	department = "Infantry"
	department_flag = INF
	head_position = 1
	total_positions = 1
	spawn_positions = 1

	supervisors = "the highest ranking Marine and SolGov Command"
	selection_color = "#557e38"
	minimal_player_age = 12
	economic_power = 7
	skill_points = 24
	minimum_character_age = list(SPECIES_HUMAN = 25)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/infantry/squad_lead
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_EVA         = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_BASIC,
						SKILL_COMBAT      = SKILL_ADEPT,
						SKILL_WEAPONS     = SKILL_ADEPT)

	max_skill = list(	SKILL_COMBAT      = SKILL_MAX,
						SKILL_WEAPONS     = SKILL_MAX,
						SKILL_EVA		  = SKILL_MAX)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/squad_lead/get_description_blurb()
	return "<span class='warning'>You are NOT Security. Ignoring this will get you job banned, or worse.</span> - You are a Squad Leader. Your duty is to organize and lead the small infantry squad to support the Pathfinder. You command Marines in your Squad. You make sure that expedition has the firepower it needs. Once on the away mission, your duty is to ensure that the worst doesn't become reality."

/datum/job/combat_tech
	title = "Combat Technician"
	supervisors = "the Squad Leader"
	department = "Infantry"
	department_flag = INF
	total_positions = 1
	spawn_positions = 1
	selection_color = "#557e38"
	economic_power = 4
	minimal_player_age = 8
	skill_points = 24
	minimum_character_age = list(SPECIES_HUMAN = 20)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/infantry/combat_tech
	min_skill = list(	SKILL_CONSTRUCTION = SKILL_ADEPT,
						SKILL_ELECTRICAL   = SKILL_ADEPT,
						SKILL_MEDICAL      = SKILL_BASIC,
						SKILL_COMBAT       = SKILL_ADEPT,
						SKILL_WEAPONS      = SKILL_ADEPT)

	max_skill = list(	SKILL_COMBAT       = SKILL_MAX,
						SKILL_WEAPONS      = SKILL_MAX,
						SKILL_EVA		   = SKILL_MAX,
						SKILL_CONSTRUCTION = SKILL_MAX,
						SKILL_ELECTRICAL   = SKILL_MAX)

	allowed_branches = list(/datum/mil_branch/marine_corps)
	allowed_ranks = list(
		/datum/mil_rank/marine_corps/e3,
		/datum/mil_rank/marine_corps/e4,
		/datum/mil_rank/marine_corps/e5
		)
	access = list(access_maint_tunnels, access_petrov, access_petrov_security,
			            access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm, access_infantry,
			            access_inftech, access_aquila, access_eva)
	alt_titles = list(
		"Combat Engineer")

/datum/job/combat_tech/is_position_available()
	if(..())
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_role == "Squad Lead")
				return TRUE
	return FALSE

/datum/job/combat_tech/get_description_blurb()
	return "<span class='warning'>You are NOT Security. Ignoring this will get you job banned, or worse.</span> - You are the singular Combat Technician in the squad. Your duty is to provide both firepower and demolitions as required. You may assume Command if no Squad Leader is present."

/datum/job/combat_medic
	title = "Combat Medic"
	supervisors = "the Squad Leader"
	department = "Infantry"
	department_flag = INF
	total_positions = 1
	spawn_positions = 1
	selection_color = "#557e38"
	economic_power = 4
	minimal_player_age = 8
	skill_points = 24
	minimum_character_age = list(SPECIES_HUMAN = 20)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/infantry/combat_medic
	min_skill = list(SKILL_ANATOMY         = SKILL_ADEPT,
						SKILL_MEDICAL      = SKILL_ADEPT,
						SKILL_COMBAT       = SKILL_ADEPT,
						SKILL_WEAPONS      = SKILL_ADEPT)

	max_skill = list(	SKILL_COMBAT       = SKILL_MAX,
						SKILL_WEAPONS      = SKILL_MAX,
						SKILL_EVA		   = SKILL_MAX,
						SKILL_MEDICAL      = SKILL_MAX,
						SKILL_ANATOMY      = SKILL_MAX)

	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5
		)
	access = list(access_maint_tunnels, access_petrov, access_petrov_security,
			            access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm, access_infantry,
			            access_infmed, access_aquila, access_eva)

/datum/job/combat_medic/is_position_available()
	if(..())
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_role == "Squad Lead")
				return TRUE
	return FALSE

/datum/job/combat_medic/get_description_blurb()
	return "<span class='warning'>You are NOT Security. Ignoring this will get you job banned, or worse.</span> - You are the singular Combat Medic in the squad. Your duty is to provide medical assistance as required. You may assume Command if no Squad Leader is present."

/datum/job/grunt
	title = "Rifleman"
	department = "Infantry"
	department_flag = INF
	total_positions = 3
	spawn_positions = 3
	minimal_player_age = 6
	supervisors = "the Combat Technician and Squad Leader"
	selection_color = "#557e38"
	skill_points = 18
	minimum_character_age = list(SPECIES_HUMAN = 18)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/infantry
	min_skill = list(	SKILL_COMBAT       = SKILL_ADEPT,
						SKILL_WEAPONS      = SKILL_ADEPT,
						SKILL_EVA          = SKILL_BASIC)

	max_skill = list(	SKILL_COMBAT      = SKILL_MAX,
						SKILL_WEAPONS     = SKILL_MAX,
						SKILL_EVA		  = SKILL_MAX)

	software_on_spawn = list(/datum/computer_file/program/deck_management)
	allowed_branches = list(/datum/mil_branch/marine_corps)
	allowed_ranks = list(
		/datum/mil_rank/marine_corps/e1,
		/datum/mil_rank/marine_corps/e2,
		/datum/mil_rank/marine_corps/e3,
		/datum/mil_rank/marine_corps/e4
	)
	access = list(access_maint_tunnels, access_solgov_crew, access_petrov, access_petrov_security,
			            access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm, access_infantry,
			            access_aquila, access_eva)
	alt_titles = list(
		"Grunt",
		"Trooper")

/datum/job/grunt/is_position_available()
	if(..())
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_role == "Squad Lead")
				return TRUE
	return FALSE

/datum/job/grunt/get_description_blurb()
	return "<span class='warning'>You are NOT Security. Ignoring this will get you job banned, or worse.</span> - You are a Marine! Your duty is to listen to the Squad Leader. If they're not present, the Combat Technician may pull rank. Do your best not to die, while also taking orders. Oorah!"

/datum/job/psiadvisor
	title = "Psionic Advisor"
	department = "Support"
	department_flag = SPT
	selection_color = "#2f2f7f"
	total_positions = 1
	spawn_positions = 1
	economic_power = 30
	minimum_character_age = list(SPECIES_HUMAN = 25,SPECIES_UNATHI = 25,SPECIES_SERGAL = 25, SPECIES_SKRELL = 25, SPECIES_PROMETHEAN = 25, SPECIES_YEOSA = 25, SPECIES_VASS = 25, SPECIES_TAJ = 25, SPECIES_CUSTOM = 25, SPECIES_AKULA = 25)
	minimal_player_age = 7
	supervisors = "NTPC or the Foundation, neither secondary to the Commanding Officer"
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/psiadvisor
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/foundationadvisor)
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_EXPERT,
		SKILL_FINANCE = SKILL_ADEPT,
		SKILL_MEDICAL = SKILL_BASIC
	)
	max_skill = list(
		SKILL_COMBAT     = SKILL_EXPERT,
		SKILL_WEAPONS     = SKILL_EXPERT
	)
	skill_points = 30
	access = list(access_psiadvisor, access_security, access_medical, access_engine, access_maint_tunnels, access_external_airlocks,
				access_eva, access_bridge, access_cargo, access_RC_announce, access_solgov_crew, access_hangar)
	minimal_access = list()
	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/records
	)

	alt_titles = list(
		"Nanotrasen Psionic Operative" = /decl/hierarchy/outfit/job/torch/crew/command/psiadvisor/nt,
		"Foundation Agent")

/datum/job/psiadvisor/equip(var/mob/living/carbon/human/H)
	psi_faculties = list("[PSI_REDACTION]" = PSI_RANK_OPERANT, "[PSI_COERCION]" = PSI_RANK_OPERANT, "[PSI_PSYCHOKINESIS]" = PSI_RANK_OPERANT, "[PSI_ENERGISTICS]" = PSI_RANK_OPERANT)
	return ..()

/datum/job/psiadvisor/get_description_blurb()
	return "You are the Psionic Advisor, an agent of either the Foundation or Nanotrasen Psionic Corps. Alongside the Counselor, you're the only other individual with known and authorized Psionic abilities aboard the SGV Dagon. Your main responsibility is advising the Commanding Officer on psionic matters. \
	Secondly, you're to assist the crew or Research on psionic matters, or guide any newly emergent crew that awaken with psionic abilities."

/*
	Adjudicator
*/

/datum/job/adjudicator
	title = "Adjudicator"
	department = "Support"
	department_flag = SPT
	total_positions = 0
	spawn_positions = 0
	supervisors = "Central Command The Galilei Convention and the Ship Regulations"
	selection_color = "#2f2f7f"
	economic_power = 15
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/adjudicator
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_EXPERT,
	                    SKILL_FINANCE     = SKILL_BASIC)
	skill_points = 20
	minimum_character_age = list(SPECIES_HUMAN = 28)

	access = list(access_adjudicator, access_lawyer, access_sec_doors, access_brig, access_maint_tunnels, access_medical,
			            access_bridge, access_cargo, access_solgov_crew, access_hangar)

	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/adjudicator/get_description_blurb()
	return "You are the Adjudicator. Your job is to be an unbiased defender of the law, dealing with any ethical or legal issues aboard the ship and informing and advising the Commanding Officer of them. Ensure that the ship regulations are upheld and that the security force is enforcing the law correctly."


/datum/job/bailiff
	title = "Bailiff"
	department = "Support"
	department_flag = SPT
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Adjudicator"
	selection_color = "#3d3d7f"
	economic_power = 12
	minimal_player_age = 5
	minimum_character_age = list(SPECIES_HUMAN = 19)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/bailiff
	allowed_branches = list(/datum/mil_branch/civilian,
							/datum/mil_branch/solgov)
	allowed_ranks = list(/datum/mil_rank/civ/contractor,
						 /datum/mil_rank/sol/agent)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)
	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)

	alt_titles = list(
		"Court Officer",
		"Judicial Assistant"
	)
	skill_points = 20
	access = list(access_adjudicator, access_lawyer, access_sec_doors, access_brig, access_maint_tunnels, access_medical,
			            access_bridge, access_cargo, access_solgov_crew, access_hangar)
	defer_roundstart_spawn = TRUE

/datum/job/bailiff/is_position_available()
	if(..())
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_role == "Adjudicator")
				return TRUE
	return FALSE

/datum/job/bailiff/get_description_blurb()
	return "You are the Bailiff. Your task is to assist and protect the Adjudicator in his endeavours. Do not intervene with security matters, the protection of your client is your first concern. Good luck."

/datum/job/bailiff/post_equip_rank(var/mob/person, var/alt_title)
	var/my_title = "\a ["\improper [(person.mind ? (person.mind.role_alt_title ? person.mind.role_alt_title : person.mind.assigned_role) : "Bailiff")]"]"
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind)
			if(M.mind.assigned_role == "Adjudicator")
				to_chat(M, SPAN_NOTICE("<b>Your bodyguard, [my_title] named [person.real_name], is present on [GLOB.using_map.full_name].</b>"))
	..()

/datum/job/lawyer
	title = "Lawyer"
	department = "Service"
	department_flag = SRV
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Adjudicator, The Galilei Convention and the Ship Regulations"
	economic_power = 10
	minimal_player_age = 2
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/service/lawyer
	allowed_branches = list(/datum/mil_branch/civilian, /datum/mil_branch/solgov)
	allowed_ranks = list(/datum/mil_rank/civ/contractor, /datum/mil_rank/sol/gov)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_EXPERT,
	                    SKILL_FINANCE     = SKILL_BASIC)
	skill_points = 20
	minimum_character_age = list(SPECIES_HUMAN = 27)

	access = list(access_lawyer, access_sec_doors, access_maint_tunnels, access_solgov_crew)

	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/lawyer/get_description_blurb()
	return "You are a lawyer. Your job is to prosecute or defend your client depending on the circumstances."
