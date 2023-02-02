export GIT_TERMINAL_PROMPT=1

export WIFI_STATION="$(ip route | grep '^default' | awk '{print $5}' | head -n1)"

export RICE="rose-pine"

