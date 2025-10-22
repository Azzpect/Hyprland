eww="$HOME/eww/target/release/eww"

getConStatus() {
  con=$(nmcli -t -f TYPE,STATE device | grep "$1" | awk -F ":" '{print $2}')
  for c in $con; do
    if [ "$c" = "connected" ]; then
      echo "connected"
      return
    fi
  done
  echo "disconnected"
}

getWifiConName() {
  echo $(nmcli -t -f TYPE,CONNECTION device | grep "wifi" | awk -F ":" '{print $2}')
}

getWifiList() {
  names=$(nmcli -t -f SSID dev wifi list)
  tempFile=$(mktemp)
  echo "$names" > "$tempFile"
  list="["
  while IFS= read -r entry;do
    list+="\"${entry}\","
  done < "$tempFile"
  rm "$tempFile"
  list="${list%,}]"
  echo "$list"
}

wifiDisconnect() {
  wifiName=$(nmcli -t -f DEVICE,TYPE device | grep "wifi" | awk -F ":" '{print $1}')
  $(nmcli dev disconnect $wifiName)
}
openWifiConnectWindow() {
  $eww update connectingTo="$1"
  $eww open wifiConnectWindow
}
wifiConnect() {
  $eww close wifiConnectWindow
  $eww update password=""
  nmcli connection delete "$1"
  nmcli dev wifi connect "$1" password "$2"
}

ethDisconnect() {
  eth=$(nmcli -t -f DEVICE,TYPE device | grep "ethernet" | awk -F ":" '{print $1}')
  $(nmcli dev disconnect $eth)
}
ethConnect() {
  eth=$(nmcli -t -f DEVICE,TYPE device | grep "ethernet" | awk -F ":" '{print $1}')
  $(nmcli dev connect $eth)
}



"$@"
