#!/system/bin/sh

#OUTPUT
iptables -I OUTPUT -o rmnet0 -j DROP
iptables -I OUTPUT -o rmnet1 -j DROP
iptables -I OUTPUT -o rmnet0 -d 62.210.106.89 -j ACCEPT
iptables -I OUTPUT -o rmnet1 -d 62.210.106.89 -j ACCEPT

#INPUT
iptables -I INPUT -i rmnet0 -j DROP
iptables -I INPUT -i rmnet1 -j DROP
iptables -I INPUT -i rmnet0 -s 62.210.106.89 -j ACCEPT
iptables -I INPUT -i rmnet1 -s 62.210.106.89 -j ACCEPT

# le port 11111 est le port pour le server UDP
iptables -I INPUT -p udp --dport 11111 -j ACCEPT

# Enable roaming
settings put global data_roaming 1

