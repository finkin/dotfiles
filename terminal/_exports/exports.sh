export FZF_DEFAULT_OPTS='
  --color=pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934
  --reverse
'

export HOMEBREW_AUTO_UPDATE_SECS=86400
export HOMEBREW_NO_ANALYTICS=true

export ZSH=$HOME/.oh-my-zsh

export GPG_TTY=$(tty)
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

paths=(
  "$HOME/bin"
  "$DOTFILES_PATH/bin"
  "$JAVA_HOME/bin"
  "$GEM_HOME/bin"
  "$HOME/.dotnet/tools"
  "$HOME/.vimpkg/bin"
  "$HOME/.cargo/bin"
  "$HOME/.jenv/bin"
  "$HOME/.pyenv/shims"
  "/usr/local/MacGPG2/bin"
  "/usr/local/share/dotnet"
  "/Library/Frameworks/Mono.framework/Versions/Current/Commands"
  "/bin"
  "/usr/local/bin" # This contains Brew ZSH. If it's below `/bin` it won't be executed.
  "/usr/local/opt/make/libexec/gnubin"
  "/usr/bin"
  "/usr/local/sbin"
  "/usr/sbin"
  "/sbin"
)

PATH=$(
  IFS=":"
  echo "${paths[*]}"
)

export PATH
