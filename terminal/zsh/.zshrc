# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES_PATH=$HOME/.dotfiles

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

source $DOTFILES_PATH/terminal/init.sh

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status root_indicator dir dir_writable vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(pyenv)
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

COMPLETION_WAITING_DOTS="true"

plugins=(git python zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $DOTFILES_PATH/terminal/zsh/key-bindings.zsh

#autoload bashcompinit
#bashcompinit

# Aliases
alias l="colorls -lA --sd"

# Pyenv
# eval "$(pyenv init -)"

# export LANG=en_US.UTF-8

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
