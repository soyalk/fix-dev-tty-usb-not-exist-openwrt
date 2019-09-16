lsusb | awk '{print $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " " $15 }' | awk '{print i++ ")" $0}' ;
read  -p "choose the device you want to be loaded at boot:"  choise ;
choise=$( expr $choise + 1  )
pv=$( lsusb |  awk FNR==$choise | awk '{print $6}' | tr : " " )
pv=" "$pv" "
cmd="echo ""$pv"" > /sys/bus/usb-serial/drivers/option1/new_id"
echo -e "$cmd \n$(cat /etc/rc.local)" > /etc/rc.local



