export GIT_TERMINAL_PROMPT=1

export WIFI_STATION="$(ip route | grep '^default' | awk '{print $5}' | head -n1)"

export RICE="rose-pine"

# Redirect stdout to /dev/null
# 2>&1 combines stderr and stdout into fd 1, then redirects fd 1 to /dev/null
# 1>&2 redirects fd 1 back to stderr
ssh-add ~/.ssh/id_rsa_github_nahojer 2>&1 >/dev/null | 1>&2

export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.

# Vim
#export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
#export VIMINIT="source $MYVIMRC"
# Neovim
export NVIM_APPNAME="nvim"

