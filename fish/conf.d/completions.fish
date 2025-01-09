#custom script to run completion scripts
for f in /Users/sasan/.config/fish/completions/*.fishc
    . $f
end

. /Users/sasan/.config/fish/functions/custome.fish
alias lv="lvim"
alias lg="lazygit"
alias htop="sudo htop"
alias ansible_activate="source ~/Workspace/Ansible/ansible/bin/activate.fish"
alias bubo='brew update --force  && brew outdated --greedy --greedy-latest'
alias bubu='bubo && echo -e -n "\nContinue: (^C to cancel) " && sleep 5s && bubc && /usr/sbin/softwareupdate -l'
alias bubc='brew upgrade --greedy --greedy-latest --greedy-auto-updates --force  && brew  cleanup'
alias cdadj='cd /Users/sasan/Git/Adjust'
alias opckill='sudo kill -15 (ps aux |grep openconnect|grep -v grep|awk '\''{print $2}'\'')'
alias opcesh='screen -d -m ~/bin/adjust-openconnect+.sh esh'
alias opclax='screen -d -m ~/bin/adjust-openconnect+.sh lax'
alias opcoffice='screen -d -m ~/bin/adjust-openconnect+.sh office'
alias opclax12='screen -d -m ~/bin/adjust-openconnect+.sh lax12'
alias opcams2='screen -d -m ~/bin/adjust-openconnect+.sh ams2'
alias gpsup='git push --set-upstream origin $(__git.current_branch)'
alias yamltidy='trex -E nosudo yamltidy 
 trex validate_cmdb'
alias gsm='git switch master'
