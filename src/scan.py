# list wifi devices
# $ iw dev
# or
# $ cat /proc/net/wireless

# wlx20e8170c2fea

import sys, os, signal 
from multiprocessing import Process
import random
import time

from scapy.all import Dot11Beacon, Dot11Elt, Dot11, sniff

interface = 'wlx20e8170c2fea'

def sniffAP(p):
    if ( (p.haslayer(Dot11Beacon))):
        ssid       = p[Dot11Elt].info
        bssid      = p[Dot11].addr3    
        channel    = int( ord(p[Dot11Elt:3].info))
        capability = p.sprintf("{Dot11Beacon:%Dot11Beacon.cap%}{Dot11ProbeResp:%Dot11ProbeResp.cap%}")

        # Display discovered AP    
        print("%02d %s %s" % (int(channel), bssid, ssid))

def signal_handler(signal, frame):
    p.terminate()
    p.join()
    sys.exit(0)

if __name__ == "__main__":

    signal.signal(signal.SIGINT, signal_handler)

    channel=1
    os.system("sudo iw dev %s set channel %d" % (interface, channel))

    sniff(iface=interface,prn=sniffAP)