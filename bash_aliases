alias 'l=ls -ltr --color=auto'
alias 'vivado=faketime -f "-5y" vivado'
alias 'vivado_hls=faketime -f "-5y" vivado_hls'
alias '.1=cd ..'
alias '.2=cd ../..'
alias '.3=cd ../../..'
alias '.4=cd ../../../..'
alias '.5=cd ../../../../..'
alias 'grep=grep --color=auto'
alias 'md=mkdir'
alias 'tclsh=rlwrap tclsh'
alias 'tcl=rlwrap tclsh'
alias 'hmp4040=NO_AT_BRIDGE=1 rlwrap tclsh'
alias 'keepass=keepass ~/keepass.kdbx -preselect:/run/media/ckayhan/Elements1/KEEPASS/keepassxc.key'
alias 'peta-package=petalinux-package --boot --fsbl --u-boot --fpga images/linux/system.bit --pmufw --force'
#alias 'peta-package-r5=petalinux-package --boot --fsbl --u-boot --fpga images/linux/system.bit --add ./project-spec/meta-user/recipes-apps/r5/files/r5.elf --cpu=r5-0 --pmufw --force'
alias 'peta-boot=petalinux-boot --jtag --u-boot --fpga --bitstream images/linux/system.bit -v'
alias 'peta-build=petalinux-build'
alias 'peta-md5sum=md5sum /var/lib/tftpboot/{BOOT.BIN,image.ub} images/linux/{BOOT.BIN,image.ub}'
#alias 'peta-cfg-fs=petalinux-config -c rootfs'
alias 'tmux=tmux -2'

# tmux aliases
alias 'tT=tmux choose-tree -u'
alias 'tN=tmux select-pane -t :.-'
alias 'tP=tmux select-pane -t :-+'
alias 'tC=tmux split-window -v'
alias 'tV=tmux split-window -h'
alias 'tB=tmux new-window -c ~/'
alias 'tX=tmux kill-pane'
alias 'tR=tmux respawn-pane -k'
alias 'tO=tmux resize-pane -Z'
alias 'tJ=tmux resize-pane -D'
alias 'tH=tmux resize-pane -L'
alias 'tK=tmux resize-pane -U'
alias 'tL=tmux resize-pane -R'
alias 'tcmd=tmux command-prompt'
