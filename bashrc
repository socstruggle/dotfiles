if [ -f ~/bash_aliases ]; then
	. ~/bash_aliases
fi
shopt -s histappend
shopt -s checkwinsize
shopt -u progcomp
HISTSIZE=INFINITE_HISTSIZE
HISTFILESIZE=INFINITE_HISTFILESIZE
HISTCONTROL=ignoredups:erasedups
PROMPT_COMMAND="history -a; history -n"

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

function ulaqPetaDev()
{
  cd ~/PETALINUX/AseyeCc && \
  petalinux-create -t project -n $1 --template zynqMP && \
  cd $1 && \
  git init && \
  git remote add origin git@10.230.1.226:ankaraswprojects/fpgagroup/aseye/sw/petalinux.git && \
  git fetch origin && \
  git checkout -f ULAQ_Development
}

function sancarPetaDevElements2()
{
  cd ~/PETALINUX/AseyeCc && \
  petalinux-create -t project -n $1 --template zynqMP && \
  cd $1 && \
  git init && \
  git remote add Elements2 file:///mnt/Elements2/GIT/ASEYE_PETALINUX && \
  git fetch Elements2 && \
  git checkout -f SANCAR_Development
}

function petaPackageZynqMp(){
  petalinux-package --force --boot --fsbl --fpga images/linux/system.bit  --u-boot --pmufw
}

function petaPackageZynqMpR5(){
  petalinux-package --force --boot --fsbl --fpga images/linux/system.bit  --add $1 --cpu=r5-0 --u-boot --pmufw
}

function petaBuild()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build $*
}

function petaBuildClean()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build
}

function petaBuildKernelClean()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c kernel -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c kernel && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build
}

function petaZynqMPBuild()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c device-tree && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build && \
  petaPackageZynqMp
}

function petaHwConfig()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-config --get-hw-description=$1 --silentconfig
}

function petaConfig()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-config $*
}

function petaBuildDt()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c device-tree && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build && \
  petaPackageZynqMp
}

function petaBuildDtClean()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c device-tree -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c device-tree && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build && \
  petaPackageZynqMp
}

function petaBuildUbClean()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c u-boot -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c u-boot && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build && \
  petaPackageZynqMp
}

function petaZynqMPBuildClean()
{
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c device-tree -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -c device-tree && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build -x cleansstate && \
  GEM3_HWADDR=$(cat GEM3_HWADDR) GEM2_HWADDR=$(cat GEM2_HWADDR) petalinux-build && \
  petaPackageZynqMp
}

export VISUAL=vim
export EDITOR=vim
export TCLLIBPATH=~/gpp4323
export DISK1=/mnt/Elements2

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

eval `ssh-agent -s`
expect ~/expectSshAdd.exp
