# FIXME: acquire /etc for Ubuntu 20
# FIXME: acquire /etc for Debian 10
# TODO: acquire /etc for Ubuntu 18
if [[ -d $RC/$OS/etc ]]; then
    colordiff -r --no-dereference ${RC}/${OS}/etc /etc | less -r
else
    perror "Default config for this OS version not found"
fi
