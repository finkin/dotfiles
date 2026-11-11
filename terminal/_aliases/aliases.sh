alias l="lsd -la"
alias ..="cd .."
alias ...="cd ../.."
alias t="lsd --tree --depth=2"

# Jumps
alias ~="cd ~"
alias cdc='cd ~/Code'
alias cdd='cd ~/Downloads'
alias dotfiles='cd ~/.dotfiles'

# Apps
alias calude="claude"
alias codex-personal='CODEX_HOME=~/.codex-personal codex'
alias v="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vpn-connect='/usr/bin/osascript -e "tell application \"System Events\"" -e "tell process \"GlobalProtect\"" -e "click menu bar item 1 of menu bar 2" -e "delay 1" -e "click button \"Connect\" of window 1" -e "end tell" -e "end tell"'
alias vpn-disconnect='/usr/bin/osascript -e "tell application \"System Events\"" -e "tell process \"GlobalProtect\"" -e "click menu bar item 1 of menu bar 2" -e "delay 1" -e "click button \"Disconnect\" of window 1" -e "end tell" -e "end tell"'
alias java8='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version'
alias java11='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version'
alias java17='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 17`; java -version'
alias java21='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 21`; java -version'
alias java25='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 25`; java -version'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias aws-whoami='{ aws sts get-caller-identity & aws iam list-account-aliases; } | jq -s ".|add"'
alias aws-list-rds="aws rds describe-db-instances | jq -r '.DBInstances[] | { (.DBName):(.Endpoint.Address + \":\" + (.Endpoint.Port|tostring)), \"Engine\":(.Engine + \" \" + (.EngineVersion)), \"Instance Type\":(.DBInstanceClass)}'"
alias aws-list-instances="aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,LaunchTime,State.Name,InstanceType,PrivateIpAddress,Tags[?Key==\`Name\`].Value|[0]]' --output text | column -t"
alias tf="terraform"
alias gcane='git commit --amend --no-edit'
alias todo='nvim ~/todo/TODO.md'
