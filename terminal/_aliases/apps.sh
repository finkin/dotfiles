alias lzd="lazydocker"
alias v="nvim"
alias hoplon='/usr/bin/osascript -e "tell application \"Tunnelblick\"" -e "connect \"Hoplon\"" -e "end tell"'
alias hoplon-off='/usr/bin/osascript -e "tell application \"Tunnelblick.app\"" -e "disconnect \"Hoplon\"" -e "end tell"'
alias heimdall='/usr/bin/osascript -e "tell application \"Tunnelblick\"" -e "connect \"Heimdall\"" -e "end tell"'
alias heimdall-off='/usr/bin/osascript -e "tell application \"Tunnelblick.app\"" -e "disconnect \"Heimdall\"" -e "end tell"'
alias java8='export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"'
alias java11='export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home"'
alias java12='export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home"'
alias java13='export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"'
alias typora="open -a typora"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias aws-whoami='{ aws sts get-caller-identity & aws iam list-account-aliases; } | jq -s ".|add"'
alias aws-list-rds="aws rds describe-db-instances | jq -r '.DBInstances[] | { (.DBName):(.Endpoint.Address + \":\" + (.Endpoint.Port|tostring)), \"Engine\":(.Engine + \" \" + (.EngineVersion)), \"Instance Type\":(.DBInstanceClass)}'"
alias aws-list-instances="aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,LaunchTime,State.Name,InstanceType,PrivateIpAddress,Tags[?Key==\`Name\`].Value|[0]]' --output text | column -t"
alias tf="terraform"
alias openbooks="docker run -p 8080:80 -v ~/Downloads/openbooks:/books evanbuss/openbooks --persist"
