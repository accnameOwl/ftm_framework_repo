#define AURA_TYPE_BUFF(aura)\
	aura.aura_type = AURA_BUFF;\
	aura.isTemp = TRUE;
#define AURA_TYPE_DEBUFF(aura)\
	aura.aura_type = AURA_DEBUFF;\
	aura.isTemp = TRUE;
#define AURA_TYPE_PASSIVE(aura)\
	aura.aura_type = AURA_PASSIVE;\
	aura.isTemp = FALSE;

Aura
	var tmp 
		mob/mob
		id
		AuraType
		AuraGroup/AuraGroup
		
		started = FALSE
		ended = FALSE
		continuing = FALSE
		successful = FALSE

		runtime = -1.#INF
		max_runtime = 1.#INF


	var const
		AURA_BUFF = "buff"
		AURA_DEBUFF = "debuff"
		AURA_PASSIVE = "passive"
	var 
	New(mob, id, AuraType)
		src.mob = mob
		src.id = id
		
		if(src.AuraType == AURA_BUFF)
			AURA_TYPE_BUFF(src)
		if(src.AuraType == AURA_DEBUFF)
			AURA_TYPE_DEBUFF(src)
		if(src.AuraType == AURA_PASSIVE)
			AURA_TYPE_PASSIVE(src)
		
		

	Del()
	Read()
	Write()