
AuraGroup
	var tmp
		mob/mob
		id
		AuraManager/AuraManager
		_auras[0]
		_running_auras[0]
	
	New(id, AuraManager/manager, mob/mob)
		src.mob = mob
		src.id = id
		src.AuraManager = manager

		. = ..()

		OnInit()
	
	proc
		OnInit()

		GetAura(aura_id)
			if(!length(aura_id)) return
			if(!_auras[aura_id]) _auras[aura_id] = new /Aura(src.mob, aura_id, src)
			return _auras[aura_id]
