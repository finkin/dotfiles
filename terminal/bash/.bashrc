export DOTFILES_PATH=$HOME/.dotfiles

source $DOTFILES_PATH/terminal/init.sh
. "$HOME/.cargo/env"

### SCLOUD - shell integration
command -v scloud >/dev/null 2>&1 && eval "$(scloud --shell bash)"
### SCLOUD
