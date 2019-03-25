#define CLIENT_START_CONNECTION(client)\
	client.connected = TRUE
#define CLIENT_END_CONNECTION(client)\
	client.connected = FALSE


client

	var tmp
		connected = FALSE
	
	New()
		. = ..()
		CLIENT_START_CONNECTION(src)
	
	Del()
		.=..()
		CLIENT_END_CONNECTION(src)
	