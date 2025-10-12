

name=$(nmcli -t -f DEVICE,TYPE,STATE,CONNECTION device | grep -v "lo" | grep -v "disconnected")
devType=$(echo $name | awk -F ":" '{print $2}')
conName=$(echo $name | awk -F ":" '{print $4}')

getConType() {
  if [ "$devType" == "ethernet" ];then
    echo " "
  elif [ "$devType" == "wifi" ];then
    echo " "
  else
    echo " ⃠ "
  fi  
}

getConName() {
  if [ "$devType" == "ethernet" ];then
    echo "Ethernet" 
  else
    echo $conName
  fi
}


"$@"
