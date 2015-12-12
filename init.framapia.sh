#!/system/bin/sh

#OUTPUT
iptables -I OUTPUT -o rmnet0 -j DROP
iptables -I OUTPUT -o rmnet1 -j DROP
iptables -I OUTPUT -o rmnet0 -d 62.210.106.89 -j ACCEPT
iptables -I OUTPUT -o rmnet1 -d 62.210.106.89 -j ACCEPT
iptables -I OUTPUT -o rmnet0 -d 37.187.54.101 -j ACCEPT
iptables -I OUTPUT -o rmnet1 -d 37.187.54.101 -j ACCEPT

#INPUT
iptables -I INPUT -i rmnet0 -j DROP
iptables -I INPUT -i rmnet1 -j DROP
iptables -I INPUT -i rmnet0 -s 62.210.106.89 -j ACCEPT
iptables -I INPUT -i rmnet1 -s 62.210.106.89 -j ACCEPT
iptables -I INPUT -i rmnet0 -s 37.187.54.101 -j ACCEPT
iptables -I INPUT -i rmnet1 -s 37.187.54.101 -j ACCEPT

# le port 6000 est le port pour le server TCP
iptables -I INPUT -p tcp --dport 6000 -j ACCEPT

# Enable roaming
settings put global data_roaming 1
