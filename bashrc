if [ -f ~/bash_aliases ]; then
	. ~/bash_aliases
fi
shopt -s histappend
shopt -s checkwinsize
shopt -u progcomp
HISTSIZE=
HISTFILESIZE=
HISTFILE=history
HISTCONTROL=ignoredups:erasedups

usbinfo() { udevadm info --query property /dev/disk/by-uuid/$(lsblk -o NAME,UUID|grep $1|awk '{print $2}') |egrep -i "ID_VENDOR_ID=|ID_MODEL_ID="; }

gitbranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

osrelease() {
  cat /etc/os-release |grep VERSION=|sed 's/VERSION=\"\(.*\)\"/\1/g'
}

intfname () 
{ 
    #find /sys/class/net ! -type d | xargs --max-args=1 realpath | awk -v pciid=$(lspci|awk '/Ethernet/{print $1}') -F\/ '{if($0 ~ pciid){print $NF}}'
    #ip addr | awk '/state UP/ {print $2}' | sed 's/.$//'
    #ip route get 1.1.1.1 | awk '{print $5}'
    route | grep '^default' | grep -o '[^ ]*$'
    #nmcli|head -n 1|awk '{print $1}'|sed 's/.$//'
}
ipaddr(){
  ip address show dev $(intfname) | grep -w inet | awk '{print $2}'
}
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n> '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;38;5;208m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;38;5;223m\]($(osrelease)),$(gitbranch),$(ipaddr)\n> \[\033[01;38;5;249m\]'
#PROMPT_COMMAND="history -a $HISTFILE; $PROMPT_COMMAND"
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a $HISTFILE; history -c; history -r"

function colorgrid( )
{
    iter=16
    while [ $iter -lt 52 ]
    do
        second=$[$iter+36]
        third=$[$second+36]
        four=$[$third+36]
        five=$[$four+36]
        six=$[$five+36]
        seven=$[$six+36]
        if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$[$iter+1]
        printf '\r\n'
    done
}

export PATH=$PATH:/home/ckayhan/feh/src

# https://support.xilinx.com/s/article/69355?language=en_US
# LIBRARY_PATH is needed for Vitis HLS
#export "LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH"

#bind -r '\e0'
#bind -r '\e1'
#bind -r '\e2'
#bind -r '\e3'
#bind -r '\e4'
#bind -r '\e5'
#bind -r '\e6'
#bind -r '\e7'
#bind -r '\e8'
#bind -r '\e9'

#export TERM=xterm-256color
export TERM=xterm
export VISUAL=vim
export EDITOR=vim
PATH=$PATH:/usr/sbin/
