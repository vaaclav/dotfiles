My vim configuration

    git clone --recursive git://github.com/vaaclav/dotfiles

based on ideas taken from https://github.com/phunehehe/terminal-dotfiles

    rm -rf .vim
    ln -s dotfiles/_vim/ .vim
    ln -s dotfiles/_vimrc .vimrc
    ln -s path/to/vimwiki/ vimwiki
    git config --global user.name ""
    git config --global user.email ""
