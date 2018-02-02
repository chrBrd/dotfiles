source /usr/share/defaults/etc/profile
export PATH=$PATH:/mnt/code/main/docker/node:/mnt/code/main/docker/composer

for file in ~/.bashrc.d/*;
do
	source $file
done

alias off='systemctl poweroff'
alias reboot='systemctl reboot'
alias main='cd /mnt/code/main'
alias ssh=color-ssh
alias sshDev='ssh -t chris@dev-server "bash"'

ssh_auth_sock
