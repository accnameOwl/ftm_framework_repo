#define AURA_BUFF "buff"
#define AURA_DEBUFF "debuff"
#define AURA_PASSIVE "passive"

#define AURA_TYPE_BUFF(aura)\
	aura.aura_type = AURA_BUFF;\
	aura.isTemp = TRUE;
#define AURA_TYPE_DEBUFF(aura)\
	aura.aura_type = AURA_DEBUFF;\
	aura.isTemp = TRUE;
#define AURA_TYPE_PASSIVE(aura)\
	aura.aura_type = AURA_PASSIVE;\
	aura.isTemp = FALSE;
