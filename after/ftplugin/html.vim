" The default html settings keep your shiftwidth, etc. at default.  This file
" is in after/ftplugin/ and not ftplugin/ so that it'll run after the
" $VIMRUNTIME/ftplugin/html.vim file. This way our settings won't get
" invisibly overwritten by the $VIMRUNTIME file.
setlocal tabstop=2 softtabstop=2 shiftwidth=2
