/datum/species/alternian
	// raça original
	name = "Alternian Troll"
	id = "alternian"
	say_mod = "quirks"
	blacklisted = 0
	sexes = 1
	hair_color = "2e2e2e"
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/moth
	species_traits = list(HAIR,FACEHAIR,LIPS)
	inherent_traits = list(TRAIT_NOBREATH)
	inherent_biotypes = list(MOB_HUMANOID, MOB_ORGANIC)
	mutant_bodyparts = list("alternian_horns")
	default_features = list("alternian_horns" = "simple")
	disliked_food = NONE
	liked_food = GROSS | MEAT | RAW
	//limbs_id = "alternian"
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'

	//Troll Shit
	var/sign = ""


/datum/species/alternian/New()
	.=..()
	var/mob/living/carbon/human/H = src
	post_update(H)

/datum/species/alternian/post_update(mob/living/carbon/human/H)
	.=..()
	if(isalternian(H))
		H.dna?.species?.select_sign(H)

/datum/species/alternian/on_species_gain(mob/living/carbon/C)
	. = ..()
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(!H.dna.features["alternian_horns"])
			H.dna.features["alternian_horns"] = "[(H.client && H.client.prefs && LAZYLEN(H.client.prefs.features) && H.client.prefs.features["alternian_horns"]) ? H.client.prefs.features["alternian_horns"] : "simple"]"
			handle_mutant_bodyparts(H)

/datum/species/alternian/check_roundstart_eligible()
	return TRUE

/datum/species/alternian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/alternian/proc/set_sign(mob/living/carbon/human/H, sign)
	H:dna:species:sign = sign
	switch(sign)
		if("Arga"||"Arcer"||"Argo")
			H.name += " Rust"
		if("Taura"||"Taurittanius"||"Taurga")
			H.name += " Bronze"
		if("Gemnius"||"Gemsci"||"Gemza")
			H.name += " Gold"
		if("Canrus"||"Cansci"||"Canrist")
			H.name += " Lime"
		if("Lesces"||"Leiborn"||"Lerius")
			H.name += " Olive"
		if("Virrus"||"Virnius"||"Virpia")
			H.name += " Jade"
		if("Libun"||"Ligo"||"Limino")
			H.name += " Teal"
		if("Scorittarius"||"Scorun"||"Scorza")
			H.name += " Cerulean"
		if("Sagio"||"Sagimino"||"Sagicen")
			H.name += " Indigo"
		if("Capriza"||"Capries"||"Capriborn")
			H.name += " Purple"
		if("Aquapio"||"Aquaries"||"Aquapia")
			H.name += " Violet"
		if("Pirius"||"Pittarius"||"Picen")
			H.name += " Fuchsia"

/datum/species/alternian/proc/select_sign(mob/living/carbon/human/H)
	if(isalternian(H))
		var/list/possibleSigns
		for(var/_sign in (GLOB.allSigns - GLOB.usedSigns))
			possibleSigns += _sign
		if(possibleSigns)
			var/picked = pick(possibleSigns)
			GLOB.usedSigns += picked
			set_sign(H, picked)
			H << "\blue Your sign is [picked]!"
		else
			return FALSE
	else
		return FALSE