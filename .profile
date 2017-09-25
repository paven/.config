export PATH=$PATH:~/bin
export SEAL_HOME=/home/pvn/SEAL_HOME
#export TERMINAL=sakura
export MAVEN_OPTS_DEBUG="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n"
export EDITOR="vim"

alias ovpnSEAL='sudo openvpn --script-security 2 --up /home/pvn/Projects/openvpn-update-resolv-conf/update-resolv-conf.sh --down /home/pvn/Projects/openvpn-update-resolv-conf/update-resolv-conf.sh --config /home/pvn/Projects/openvpn-update-resolv-conf/client.ovpn'
