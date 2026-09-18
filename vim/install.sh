#!/bin/bash

# Use a clean variable name instead of 'vim'
msg="[+] Setting up vim configs..."

for ((i=0; i<${#msg}; i++)); do
    echo -n "${msg:$i:1}"
    sleep 0.05
done
echo

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Check if the .vimrc file exists
if [ ! -f ~/.vimrc ]; then
    echo "Creating .vimrc file..."
    touch ~/.vimrc
fi

# Add vim-plug configuration to .vimrc if not already present
if ! grep -q "call plug#begin" ~/.vimrc; then
    echo "Adding vim-plug configuration to .vimrc..."
    cat << 'EOL' >> ~/.vimrc
call plug#begin('~/.vim/plugged')
Plug 'audibleblink/hackthebox.vim'
call plug#end()
EOL
fi

# Install plugins headlessly (won't freeze the script)
echo "Installing plugins with vim..."
vim -es -u ~/.vimrc +PlugInstall +qall

# Manual fallback instructions
manual="Do it manually if it doesn't work:"
for ((i=0; i<${#manual}; i++)); do
    echo -n "${manual:$i:1}"
    sleep 0.05
done
echo
echo "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo
echo "nano ~/.vimrc"
echo "call plug#begin('~/.vim/plugged')"
echo "Plug 'audibleblink/hackthebox.vim'"
echo "call plug#end()"
echo
echo "vim"
echo ":PlugInstall"
echo

exit_txt="Exiting script now..."
for ((i=0; i<${#exit_txt}; i++)); do
    echo -n "${exit_txt:$i:1}"
    sleep 0.05
done
echo
