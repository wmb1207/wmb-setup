#!/usr/bin/env bash

##################################################################################################
# Add new host script built by                                                                   #
#                                                                                                #
# ██╗    ██╗███╗   ███╗██████╗                                                                   #	
# ██║    ██║████╗ ████║██╔══██╗                                                                  #
# ██║ █╗ ██║██╔████╔██║██████╔╝                                                                  #
# ██║███╗██║██║╚██╔╝██║██╔══██╗                                                                  #
# ╚███╔███╔╝██║ ╚═╝ ██║██████╔╝                                                                  #
#  ╚══╝╚══╝ ╚═╝     ╚═╝╚═════╝                                                                   #
#                                                                                                #
# Status Code 1 = Not a valid IP                                                                 #
##################################################################################################

echo "Insert host name: "
read NAME
echo "Insert IP: "
read IP

read -r -d '' HOST << EOM
[$NAME]
$IP
EOM

if ! [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]
then
	exit 1
fi


echo "The next host will be added to the hosts file"
echo "$HOST"

echo "$HOST" >> hosts
