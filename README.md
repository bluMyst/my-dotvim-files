# my-dotvim-files

You may have to symbolically link the files `vimrc` and `gvimrc` to `~/.vimrc` and `~/.gvimrc`. Make sure to clone into `~/.vim/` All of this is assuming you're on Linux.

Be sure to [get the submodules](http://stackoverflow.com/questions/3796927/how-to-git-clone-including-submodules) too! TL;DR:

    git clone --recursive git://github.com/foo/bar.git
    cd bar

or

    git clone git://github.com/foo/bar.git
    cd bar
    git submodule update --init --recursive
