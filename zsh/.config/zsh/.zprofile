export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.

export GIT_TERMINAL_PROMPT=1

export WIFI_STATION="$(ip route | grep '^default' | awk '{print $5}' | head -n1)"

export RICE="catppuccin-frappe"

ssh-add ~/.ssh/id_rsa_github_nahojer

[[ -f "$ZDOTDIR/.workprofile" ]] && . "$ZDOTDIR/.workprofile" 
[[ -f "$ZDOTDIR/.zshprivate" ]] && . "$ZDOTDIR/.zshprivate" 

