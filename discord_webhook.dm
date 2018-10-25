//#define TICK_LAG (1/60)*10
#define DEBUG
//#define CHECK_TICK if(world.tick_usage > 80) sleep(world.tick_lag)
var/list/clients = list()
var/webhook_url = "https://discordapp.com/api/webhooks/501956443323498506/QET1VI6ymnRGgMoNBTuC8oPis9IbgIOgx3Cbf45f-OLSprRowTHp75UeIuvI2wzewVmv"
world
	//tick_lag = TICK_LAG 		// 25 frames per second
	Del()
		discord_relay("*Zanequinha station FECHADA")
		..()

/* proc/distance(atom/movable/A, atom/B)
	return sqrt((B.x-A.x+(A.step_x/64))**2 + (B.y-A.y+(A.step_y/64))**2)

proc/atomdistance(atom/A, atom/B)
	return sqrt((B.x-A.x)**2 + (B.y-A.y)**2) */

/proc/discord_relay(var/content)
	call("ByondPOST.dll", "send_post_request")("[webhook_url]", " { \"content\" : \"[content]\" } ", "Content-Type: application/json")
