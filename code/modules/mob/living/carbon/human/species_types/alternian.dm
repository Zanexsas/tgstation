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

/*
/datum/species/alternian/New()
	..()
*/


/datum/species/alternian/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	.=..()
	post_update(C)
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(!H.dna.features["alternian_horns"])
			H.dna.features["alternian_horns"] = "[(H.client && H.client.prefs && LAZYLEN(H.client.prefs.features) && H.client.prefs.features["alternian_horns"]) ? H.client.prefs.features["alternian_horns"] : "simple"]"
			handle_mutant_bodyparts(H)

/datum/species/alternian/post_update(mob/living/carbon/human/H)
	.=..()
	if(isalternian(H))
		H.dna?.species?.select_sign(H)


/datum/species/alternian/check_roundstart_eligible()
	return TRUE

/datum/species/alternian/qualifies_for_rank(rank, list/features)
	return TRUE


/datum/species/alternian/proc/update_sign(mob/living/carbon/human/H)
	var/datum/species/alternian/E = H.dna?.species
	var/enum = pick(1,2,3)
	if(E.sign)
		switch(E.sign)
			if("Arga"||"Arcer"||"Argo")
				H.name = H.name = H.name += " Rust"
				H.real_name += " Rust"
				H.replace_identification_name(H.name,(H.name = H.name += " Rust"))
				H.dna.features["alternian_horns"] = "[(H.client && H.client.prefs && LAZYLEN(H.client.prefs.features) && H.client.prefs.features["alternian_horns"]) ? H.client.prefs.features["alternian_horns"] : "rust_horns[enum > 1 ? enum : 2]"]"

			if("Taura"||"Taurittanius"||"Taurga")
				H.name = H.name = H.name += " Bronze"
				H.real_name += " Bronze"
				H.replace_identification_name(H.name,(H.name = H.name += " Bronze"))
				H.dna.features["alternian_horns"] = "[(H.client && H.client.prefs && LAZYLEN(H.client.prefs.features) && H.client.prefs.features["alternian_horns"]) ? H.client.prefs.features["alternian_horns"] : "bronze_horns[enum]"]"


			if("Gemnius"||"Gemsci"||"Gemza")
				H.name = H.name += " Gold"
				H.real_name += " Gold"
				H.replace_identification_name(H.name,(H.name = H.name += " Gold"))

			if("Canrus"||"Cansci"||"Canrist")
				H.name = H.name += " Lime"
				H.real_name += " Lime"
				H.replace_identification_name(H.name,(H.name = H.name += " Lime"))

			if("Lesces"||"Leiborn"||"Lerius")
				H.name = H.name += " Olive"
				H.real_name += " Olive"
				H.replace_identification_name(H.name,(H.name = H.name += " Olive"))

			if("Virrus"||"Virnius"||"Virpia")
				H.name = H.name += " Jade"
				H.real_name += " Jade"
				H.replace_identification_name(H.name,(H.name = H.name += " Jade"))

			if("Libun"||"Ligo"||"Limino")
				H.name = H.name += " Teal"
				H.real_name += " Teal"
				H.replace_identification_name(H.name,(H.name = H.name += " Teal"))

			if("Scorittarius"||"Scorun"||"Scorza")
				H.name = H.name += " Cerulean"
				H.real_name += " Cerulean"
				H.replace_identification_name(H.name,(H.name = H.name += " Cerulean"))

			if("Sagio"||"Sagimino"||"Sagicen")
				H.name = H.name += " Indigo"
				H.real_name += " Indigo"
				H.replace_identification_name(H.name,(H.name = H.name += " Indigo"))

			if("Capriza"||"Capries"||"Capriborn")
				H.name = H.name += " Purple"
				H.real_name += " Purple"
				H.replace_identification_name(H.name,(H.name = H.name += " Purple"))

			if("Aquapio"||"Aquaries"||"Aquapia")
				H.name = H.name += " Violet"
				H.real_name += " Violet"
				H.replace_identification_name(H.name,(H.name = H.name += " Violet"))

			if("Pirius"||"Pittarius"||"Picen")
				H.name = H.name += " Fuchsia"
				H.real_name += " Fuchsia"
				H.replace_identification_name(H.name,(H.name = H.name += " Fuchsia"))

/datum/species/alternian/proc/select_sign(mob/living/carbon/human/H)
	var/datum/species/ethereal/E = H.dna?.species
	if(isalternian(H) && !E.sign)
		var/list/possibleSigns
		picking:
		for(var/_sign in (GLOB.allSigns - GLOB.usedSigns))
			possibleSigns += _sign
		sleep(1)
		if(possibleSigns)
			var/picked = pick(possibleSigns)
			GLOB.usedSigns += picked
			E.sign = picked
		else
			goto picking
	else
		return 1