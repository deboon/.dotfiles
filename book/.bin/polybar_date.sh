t=0

toggle() {
    t=$(((t + 1) % 2))
}

trap "toggle" USR1

while true; do
    if [ $t -eq 0 ]; then
        date +'%Y-%m-%d %H:%M:%S'
    else
        date +'%s    '
    fi
    sleep 1 &
    wait
done
