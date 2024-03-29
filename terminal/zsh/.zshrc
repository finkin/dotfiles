# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES_PATH=$HOME/.dotfiles
# Exports
# shellcheck source=/dev/null
for exports in "$DOTFILES_PATH/terminal/_exports/"*; do source "$exports"; done

# Options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions history-substring-search colored-man-pages)

source $ZSH/oh-my-zsh.sh
source $DOTFILES_PATH/terminal/zsh/key-bindings.zsh

# Aliases (after oh-my-zsh because it contains a lot aliases)
alias sudo='sudo '
# shellcheck source=/dev/null
for aliasToSource in "$DOTFILES_PATH/terminal/_aliases/"*; do source "$aliasToSource"; done

# Pyenv
eval "$(pyenv init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# export LANG=en_US.UTF-8

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

# Created by `pipx` on 2021-12-28 12:51:46
export PATH="$PATH:/Users/javieralonso/.local/bin"

# z
. $(brew --prefix z)/etc/profile.d/z.sh

# Created by `pipx` on 2022-06-03 10:39:06
export PATH="$PATH:/Users/javier.alonso/.local/bin"
