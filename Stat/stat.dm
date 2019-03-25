#define STAT_PRIVATE_ON_NEW(stat, mob, name, value, limit, level, xp, xp_next)\
	stat.mob = mob;\
	stat.name = name;\
	stat.value = value;\
	stat.limit = limit;\
	stat.level = level;\
	stat.xp = xp;\
	stat.xp_next = xp_next;

#define STAT_PRIVATE_ON_DEL(stat)\
	stat.name = null;\
	stat.value = null;\
	stat.limit = null;\
	stat.level = null;\
	stat.xp = null;\
	stat.xp_next = null;\
	stat.xp_total = null;\
	stat.limit_gain_rate = null;\
	stat.xp_gain_rate = null;

#define STAT_PRIVATE_ON_ADDXP(stat, xp)\
	stat.xp += xp;\
	stat.xp_total += xp;\
	while(stat.xp > stat.xp_next){\
		stat.limit +=round(stat.level * stat.limit_gain_rate);\
		stat.value = stat.limit;\
		++stat.level;\
		stat.xp -= stat.xp_next;\
		stat.xp_next = round(stat.xp_next * stat.xp_gain_rate);\
	};
#define STAT_SAVE_START(stat)\
	stat.saving = TRUE;\
	stat.loading = FALSE;
#define STAT_SAVE_END(stat)\
	stat.saving = FALSE;\
	stat.loading = FALSE;
#define STAT_LOAD_START(stat)\
	stat.loading = TRUE;\
	stat.saving = FALSE;
#define STAT_LOAD_END(stat)\
	stat.loading = FALSE;\
	stat.saving = FALSE;

Stat
	var tmp
		saving = FALSE
		loading = FALSE
	var const
		LIMIT_GAIN_RATE = 1.1
		XP_GAIN_RATE = 1.2
	
	var
		mob/mob

		name = ""
		value
		limit
		level
		xp
		xp_next
		xp_total
		limit_gain_rate
		xp_gain_rate

	New(mob/mob, name = "", value = 1, limit = 1, level = 1, xp = 0, xp_next = 100)
		STAT_PRIVATE_ON_NEW(src, mob, name, value, limit, level, xp, xp_next)
	
	Del()
		STAT_PRIVATE_ON_DEL(src)
		. = ..()
	Write()
		OnSave()
		. = ..()
	Read()
		OnLoad()
		. = ..()
	proc
		OnSave()
			do
				STAT_SAVE_START(src)
				//save handler
				STAT_SAVE_END(src)
			while(saving)
		OnLoad()
			do
				STAT_LOAD_START(src)
				//load handler
				STAT_LOAD_END(src)
			while(loading)
		SetName(name)
			if(name) src.name = name
		SetValue(value)
			if(value) src.value = value
		SetLevel(level)
			if(level) src.level = level
		SetXp(xp)
			if(xp) src.xp = xp
		SetXpNext(xp_next)
			if(xp_next) src.xp_next = xp_next
		SetXpTotal(xp_total)
			if(xp_total) src.xp_total = xp_total
		SetLimitGainRate(limit_gain_rate)
			if(limit_gain_rate) src.limit_gain_rate = limit_gain_rate
		SetXpGainRate(xp_gain_rate)
			if(xp_gain_rate) src.xp_gain_rate = xp_gain_rate
		
		GetName()
			return name
		GetValue()
			return value
		GetLimit()
			return limit
		GetXp()
			return xp
		GetXpTotal()
			return xp_total
		GetXpNext()
			return xp_next
		GetLimitGainRate()
			return limit_gain_rate
		GetXpGainRate()
			return xp_gain_rate
		AddXp(xp)
			STAT_PRIVATE_ON_ADDXP(src, xp)