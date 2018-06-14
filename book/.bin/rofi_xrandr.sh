#!/usr/bin/env zsh

internal=eDP-1
ext=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | grep -v $internal | head -1)
if [ -z $ext ]; then
  ext="NO_CONN"
fi
$(xrandr -q | grep " disconnected" | cut -d ' ' -f1 | grep -v $internal | xargs -I dest xrandr --output dest --off)

external_right() {
cat <<EOF
 eDP-1     $ext
┏━━━━━┓ ┌──────────┐
┃     ┃ │          │
┗━━━━━┛ │          │
        └──────────┘
EOF
}
external_off() {
cat <<EOF
 eDP-1     $ext
┏━━━━━┓ ╭┄┄┄┄┄┄┄┄┄┄╮
┃     ┃ ┆          ┆
┗━━━━━┛ ┆          ┆
        ╰┄┄┄┄┄┄┄┄┄┄╯
EOF
}
internal_off() {
cat <<EOF
 eDP-1     $ext
╭┄┄┄┄┄╮ ┏━━━━━━━━━━┓
┆     ┆ ┃          ┃
╰┄┄┄┄┄╯ ┃          ┃
        ┗━━━━━━━━━━┛
EOF
}
no_conn() {
cat <<EOF


    NO EXTERNAL MONITOR IS CONNECTED


EOF
}
print_menu() {
if [ $ext = "NO_CONN" ]; then
  no_conn
else
  external_right
  echo -n -e '\0'
  external_off
  echo -n -e '\0'
  internal_off
fi
}

update_i3() {
    i3-msg restart
    return
}

element_height=5
element_count=3

res=$(print_menu | rofi -dmenu -sep '\0' -lines "$element_count" -eh "$element_height" -p '' -no-custom -format i)
if [ $ext = "NO_CONN" ] || [ -z "$res" ]; then
  exit
fi

case "$res" in
    0)
        xrandr --output DP-1 --auto --right-of eDP-1 --output eDP-1 --auto --primary $all_disconnected_str
        ;;
    1)
        xrandr --output DP-1 --off --output eDP-1 --auto --primary $all_disconnected_str
        ;;
    2)
        xrandr --output eDP-1 --off --output DP-1 --auto --primary $all_disconnected_str
        ;;
    *)
        ;;
esac

update_i3
