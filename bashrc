if [ -f ~/bash_aliases ]; then
	. ~/bash_aliases
fi
shopt -s histappend
shopt -s checkwinsize
shopt -u progcomp
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=ignoredups:erasedups

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
    route | grep '^default' | grep -o '[^ ]*$'|head -n 1
    #nmcli|head -n 1|awk '{print $1}'|sed 's/.$//'
}
ipaddr(){
  #ip address show dev $(intfname) | grep -w inet | awk '{print $2}'
  retval="noip"
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;38;5;208m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;38;5;223m\]($(osrelease)),$(gitbranch),$(ipaddr)\n> \[\033[01;38;5;249m\]'
#PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

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

function ulaqDev()
{
  cd ~/PETALINUX/AseyeCc && \
  petalinux-create -t project -n $1 --template zynqMP && \
  cd $1 && \
  git init && \
  git remote add origin git@10.230.1.226:ankaraswprojects/fpgagroup/aseye/sw/petalinux.git && \
  git fetch origin && \
  git checkout -f ULAQ_Development
}

function petaPackageZynqMp(){
  petalinux-package --force --boot --fsbl --fpga images/linux/system.bit  --u-boot --pmufw
}

function petaPackageZynqMpR5(){
  petalinux-package --force --boot --fsbl --fpga images/linux/system.bit  --add $1 --cpu=r5-0 --u-boot --pmufw
}

export VISUAL=vim
export EDITOR=vim
export TCLLIBPATH=~/gpp4323
export DISK1=/mnt/Elements2

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  expect ~/expectSshAdd.exp
fi
