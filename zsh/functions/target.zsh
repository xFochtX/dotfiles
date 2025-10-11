# target.zsh

function set-target() {
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > "$DOTFILES/opt/target"
}

function clean-target() {
    echo '' > "$DOTFILES/opt/target"
}

