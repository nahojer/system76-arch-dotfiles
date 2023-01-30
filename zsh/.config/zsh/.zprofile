export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export WIFI_STATION="$(ip route | grep '^default' | awk '{print $5}' | head -n1)"

export RICE="rose-pine"

