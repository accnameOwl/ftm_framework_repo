#define FILE_DIR ./

#include "aura.dm"
#include "group.dm"



client
	var tmp
		AuraManager/AuraManager

	New()
		AuraManager = new(src)
		. = ..()



AuraManager
	var tmp
		mob/mob
		_groups[0]
		_enabled_groups = list("")

	New(mob/mob)
		src.mob = mob
		_groups[""] = new /AuraGroup("", src)
		. = ..()

		SetActive(TRUE)
	
	proc
		GetGroup(group_id)
			if(!length(group_id)) return _groups[""]
			if(!_groups[group_Id]) _groups[group_id] = new /AuraGroup(group_id, src)
			return _groups[group_id]

		EnableGroup(group_id)
			if(!length(group_id)) return
			_enabled_groups |= group_id
		DisableGroup(group_id)
			if(!length(group_id)) return
			_enabled_groups -= group_id

		IsGroupEnabled(group_id) return (group_id in _enabled_groups) 
