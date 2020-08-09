#!/usr/bin/env bash
set -euo pipefail

# ====================
# Set up environment
# ====================

unalias -a
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export DATA="$HOME/.harden"
export BACKUP=/backup

# ====================
# Utilities
# ====================

todo () {
    # Follow the instruction; might have to leave terminal
    echo -e "\033[0;31mTODO:\033[0m $*"
    read -n 1 -rp "Press [ENTER] when you finish"
}

ready() {
    # Wait for user to be ready
    echo -e "\033[0;35mREADY:\033[0m $*"
    read -n 1 -rp "Press [ENTER] when you are ready"
}

do_task() {
    # in case the script is stopped midway
    # we don't have to go through everything again
    # unless it is not marked complete
    if [ -f "$DATA/$1" ]; then
        return
    fi
    eval "$@"
    echo
    echo "Tip: Don't forget to record scoring reports and take notes!"
    read -p "Mark this task as finished? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        touch "$DATA/$1"
    fi
    clear
}
