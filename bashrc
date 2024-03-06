if [ -f ~/bash_aliases ]; then
	. ~/bash_aliases
fi
shopt -s histappend
shopt -s checkwinsize
shopt -u progcomp
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=ignoredups:erasedups
#PROMPT_COMMAND="history -a; history -n"

gitbranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

osrelease() {
  cat /etc/os-release |grep VERSION=|sed 's/VERSION=\"\(.*\)\"/\1/g'
}

intfname () 
{ 
    /sbin/route -n | grep '^0.0.0.0' | grep -o '[^ ]*$'|head -n 1 
}
ipaddr(){
  ip address show dev $(intfname) | grep -w inet | awk '{print $2}'
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;38;5;208m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;38;5;223m\]($(osrelease)),$(gitbranch),$(ipaddr)\n> \[\033[01;38;5;249m\]'
#PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

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

function bangladesPetaDev()
{
  cd /mnt/Elements3/home/$LOGNAME/petalinux/aseyecc && \
  petalinux-create -t project -n $1 --template zynqMP && \
  cd $1 && \
  git init && \
  git remote add asisGitlab git@10.230.11.16:ankaraswprojects/fpgagroup/aseye/sw/petalinux.git && \
  git remote add localGitlab file:///GIT/ASEYE_PETALINUX && \
  git remote add Elements1 file:///mnt/Elements1/GIT/ASEYE_PETALINUX && \
  git remote add Elements2 file:///mnt/Elements2/GIT/ASEYE_PETALINUX && \
  git remote add Elements3 file:///mnt/Elements3/GIT/ASEYE_PETALINUX && \
  git remote add Elements4 file:///mnt/Elements4/GIT/ASEYE_PETALINUX && \
  git fetch asisGitlab && \
  git checkout -f Banglades_Development
}

function sancarPetaDev()
{
  cd /mnt/Elements3/home/$LOGNAME/petalinux/aseyecc && \
  petalinux-create -t project -n $1 --template zynqMP && \
  cd $1 && \
  git init && \
  git remote add asisGitlab git@10.230.11.16:ankaraswprojects/fpgagroup/aseye/sw/petalinux.git && \
  git remote add Elements1 file:///mnt/Elements1/GIT/ASEYE_PETALINUX && \
  git remote add Elements2 file:///mnt/Elements2/GIT/ASEYE_PETALINUX && \
  git remote add Elements3 file:///mnt/Elements3/GIT/ASEYE_PETALINUX && \
  git remote add Elements4 file:///mnt/Elements4/GIT/ASEYE_PETALINUX && \
  git fetch asisGitlab && \
  git checkout -f SANCAR_Development
}

function sancarVitisDev()
{
  cd /mnt/Elements3/home/$LOGNAME/vitis/aseyecc && \
  mkdir $1 && \
  cd $1 && \
  git init && \
  git remote add asisGitlab git@10.230.11.16:ankaraswprojects/fpgagroup/aseye/sw/vitis.git && \
  git remote add Elements1 file:///mnt/Elements1/GIT/ASEYE_VITIS && \
  git remote add Elements2 file:///mnt/Elements2/GIT/ASEYE_VITIS && \
  git remote add Elements3 file:///mnt/Elements3/GIT/ASEYE_VITIS && \
  git remote add Elements4 file:///mnt/Elements4/GIT/ASEYE_VITIS && \
  git fetch asisGitlab && \
  git checkout -f SANCAR_Development
}

function sancarVivadoDev()
{
  cd ~/vivado/aseyecc && \
  mkdir $1 && \
  cd $1 && \
  git init && \
  git remote add asisGitlab git@10.230.11.16:ankaraswprojects/fpgagroup/aseye/fw/digital_design.git && \
  git remote add Elements1 file:///mnt/Elements1/GIT/ASEYE_FW && \
  git remote add Elements2 file:///mnt/Elements2/GIT/ASEYE_FW && \
  git remote add Elements3 file:///mnt/Elements3/GIT/ASEYE_FW && \
  git remote add Elements4 file:///mnt/Elements4/GIT/ASEYE_FW && \
  git fetch asisGitlab && \
  git checkout -f SANCAR_Development
}

export VISUAL=vim
export EDITOR=vim
export TCLLIBPATH=~/gpp4323

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

eval `ssh-agent -s`
expect ~/expectSshAdd.exp
