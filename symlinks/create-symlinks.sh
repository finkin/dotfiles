# Bash
rm ~/.bashrc
ln -s ~/.dotfiles/terminal/bash/.bashrc ~/.bashrc
rm ~/.bashprofile
ln -s ~/.dotfiles/terminal/bash/.bashprofile ~/.bashprofile

# zsh
rm ~/.zlogin
ln -s ~/.dotfiles/terminal/zsh/.zlogin ~/.zlogin
rm ~/.zshenv
ln -s ~/.dotfiles/terminal/zsh/.zshenv ~/.zshenv
rm ~/.zshrc
ln -s ~/.dotfiles/terminal/zsh/.zshrc ~/.zshrc

# Visual Studio Code
rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/editor/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.dotfiles/editor/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
rm ~/Library/Application\ Support/Code/User/snippets
ln -s ~/.dotfiles/editor/vscode/snippets/ ~/Library/Application\ Support/Code/User/snippets

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitconfig-professional  ~/.gitconfig-professional
ln -s ~/.dotfiles/git/.gitconfig-personal  ~/.gitconfig-personal

# Vim
rm ~/.vimrc
ln -s ~/.dotfiles/editor/vim/.vimrc ~/.vimrc

# .config
rm ~/.config/gh/config.yml
ln -s ~/.dotfiles/.config/gh/config.yml ~/.config/gh/config.yml
