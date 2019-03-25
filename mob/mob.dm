#define FILE_DIR ./
#define PLAYER_PRIVATE_DEATH_START(mob)\
	mob._dead = TRUE;\
#define PLAYER_PRIVATE_DEATH_END(mob)\
	mob_dead = FALSE;\


mob

	var tmp
		_dead = FALSE
	proc
		OnDeath()

		DeathStart()
			PLAYER_PRIVATE_DEATH_START(src)
		DeathEnd()
			PLAYER_PRIVATE_DEATH_END(src)



	OnDeath()
		DeathStart()
		do

		while(_dead)
		DeathEnd()