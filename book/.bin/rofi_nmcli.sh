#!/usr/bin/env zsh

connected_prefix=" "
disconnected_prefix=" "

print_menu() {
  vpns=$(nmcli -t -f type,uuid,device,name con show | egrep '^vpn:')
  while read -r vpn; do
    device=$(echo $vpn | cut -d ':' -f3)
    name=$(echo $vpn | cut -d ':' -f 4-)
    online=$connected_prefix
    if [ -z $device ]; then
      online=$disconnected_prefix
    fi
    echo "$online$name"
  done <<< "$vpns"
}

res=$(print_menu | rofi -dmenu -p "vpn: " -no-custom -format s)
if [ -z "$res" ]; then
  exit
fi

connected=$(echo $res | egrep "^$connected_prefix")
name=$(echo $res | sed "s/^$connected_prefix//" | sed "s/^$disconnected_prefix//" )
if [ -z $connected ]; then
  nmcli con up id $name
else
  nmcli con down id $name
fi

