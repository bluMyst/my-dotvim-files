" vim: foldmethod=marker
" By the way, every now and then you should run :Helptags to update help to
" include package stuff.
" bluMyst's custom options. {{{1

" when applicable, try to wrap things to 80 characters.
set textwidth=80

" automatically wrap comments to fit textwidth
set formatoptions=c

" Enables 'c' and automatically formats entire paragraphs at a time.
set formatoptions+=a

" Making a new line on a comment in insert mode will automatically become
" another comment.
set formatoptions+=r

" Hitting O or o on a comment will make another comment too.
set formatoptions+=o

" gq works on comments
set formatoptions+=q

" Don't auto-break lines that are already too long.
set formatoptions+=l

" Soft wrapped lines have the same level of indentation.
if exists("&breakindent")
    set breakindent
endif

" explicitely show certain invisible characters
set list listchars=tab:>-,trail:~,extends:>,precedes:<

" tab completion on ex commands
" first complete as far as possible and show some options
" then on the second press of tab let the user choose from the list
set wildmode=longest:full,full

" TODO: fix this from showing an error
" Detect if .txt file is Expression 2 (Gmod Wiremod) code.
if !exists("*TryE2Highlight")
    function TryE2Highlight()
        if getline(1) =~ '\v^\@(name|inputs|outputs|persist|trigger|model)>'
            set filetype=e2
        endif
    endfunction
endif

if has("autocmd")
    autocmd BufReadPost *.txt call TryE2Highlight()

    " if you write a file multiple times, it'll get sourced multiple times in
    " a row, which is really not good.
    "autocmd BufWritePost vimrc source $MYVIMRC
endif

" Activate pathogen plugin manager.
execute pathogen#infect()

set display=lastline

" disabled except in gvim because terminal colors get messed up
" colorscheme

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands on the right side of the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
" Disabled - ahto
" Re-enabled lol
set hlsearch

" Show pattern matches as you type
set incsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set modeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
" set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
" set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1

set expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Mappings {{{1

" easy editing of vimrc
" also see gvimrc for \g mapping that does the same.
nmap <Leader>v :edit $MYVIMRC<CR>

" F5 lets you view an undo history tree
nnoremap <F5> :GundoToggle<CR>

" space can toggle folds
nnoremap <Space> za
vnoremap <Space> za

map Y y$

nmap <Leader>y :%y+<CR>
vmap <Leader>y "+y

nmap <Leader>p "+p
vmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>P "+P

" <C-L> also disables search highlighting.
nnoremap <C-L> :nohl<CR><C-L>

" Lets you align things like this
" asdf:  foobar
" b:     baz
nmap <Tab>= :Tabularize /=<CR>
vmap <Tab>= :Tabularize /=<CR>

nmap <Tab>: :Tabularize /:\zs<CR>
vmap <Tab>: :Tabularize /:\zs<CR>

nmap <Tab>, :Tabularize /,\zs<CR>
vmap <Tab>, :Tabularize /,\zs<CR>

" interactivly shows you the effects an :s command will have
nmap <Leader>o :OverCommandLine<CR>
vmap <Leader>o :OverCommandLine<CR>
