To reinstall the dotfiles you'll need to resources below

https://github.com/zimfw/zimfw 
#might not need below
#http://vim.spf13.com/

#for vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

you'll also need i3gaps, fontawesome... other stuff...

compile vim8

./configure --prefix=/home/mark/.local \
            --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib/python3.4/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope

pip3 install neovim
python3 -c 'import neovim'
