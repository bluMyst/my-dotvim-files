" vim: foldmethod=marker
" plug-vim {{{1
call plug#begin()
" Remember to use single-quotes!

" Asynchronous Linting Engine
" Vim 8+ only! :(
Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Python autocompletion
" Too many bugs and issues.
"if has("python3") || has("python")
"    Plug 'davidhalter/jedi-vim'
"endif

" Lets you align stuff with the tab key. (Actually the tab key part is because
" of some keybinds in this file.)
" Plug 'godlygeek/tabular.git'
" nmap <Tab>= :Tabularize /=<CR>
" vmap <Tab>= :Tabularize /=<CR>
"
" nmap <Tab>: :Tabularize /:\zs<CR>
" vmap <Tab>: :Tabularize /:\zs<CR>
"
" nmap <Tab>, :Tabularize /,\zs<CR>
" vmap <Tab>, :Tabularize /,\zs<CR>

" This align plugin looks way better:
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Lets you modify things inside brackets, parentheses, etc.
Plug 'tpope/vim-surround'

" F5 undo history.
" Disabled because I never use it.
" Plug 'sjl/gundo.vim'

" These together let you have a live preview of colorschemes using:
" Unite -auto-preview colorscheme
" Also Unite is good for searching for files.
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'

" Really good git frontend
Plug 'tpope/vim-fugitive'

" Adds commands like ]oh and [<Space>
Plug 'tpope/vim-unimpaired'

" Python folding
Plug 'tmhedberg/SimpylFold'

" Live-preview :s/foo/bar
Plug 'osyo-manga/vim-over'
nmap <Leader>o :OverCommandLine<CR>
vmap <Leader>o :OverCommandLine<CR>

" Helps you keep your indentation consistent by drawing lines
Plug 'Yggdroot/indentLine'
nmap <Leader>i :IndentLinesToggle<CR>

" HTML abbreviation engine
"Plug 'mattn/emmet-vim'

" Syntax highlighting for different languages:
Plug 'PProvost/vim-ps1'
Plug 'kchmck/vim-coffee-script'

" A programmer's scratchpad. Linux only!
if has("unix")
    Plug 'metakirby5/codi.vim'
endif

" Makes * and # work on visual selections
Plug 'bronson/vim-visual-star-search'

" Smarter find-and-replace.
Plug 'tpope/vim-abolish'

" Comment and uncomment with "gc"
Plug 'tpope/vim-commentary'

" Search by two characters
Plug 'justinmk/vim-sneak'

" Incrementally highlight ALL matches to search.
Plug 'haya14busa/incsearch.vim'

" Colorschemes
Plug 'dracula/vim'
Plug 'AlessandroYorba/Sidonia'
Plug 'djjcast/mirodark'
Plug 'jpo/vim-railscasts-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'whatyouhide/vim-gotham'

call plug#end()
filetype plugin indent on

"------------------------------------------------------------
" bluMyst's custom options. {{{1
set colorcolumn=79
set textwidth=79

" Put one space after punctuation when using 'gq'
set nojoinspaces

" Highlight non-American English as being a regional spelling.
" As opposed to just 'en', which accepts all spellings.
set spelllang=en_us

" Soft wrapped lines have the same level of indentation.
if exists("&breakindent")
    set breakindent
endif

" explicitly show certain invisible characters
set list listchars=tab:>-,trail:~,nbsp:&,extends:>,precedes:<

" tab completion on ex commands
" first complete as far as possible and show some options
" then on the second press of tab let the user choose from the list
set wildmode=longest:full,full

" TODO: fix this from showing an error
" Detect if .txt file is Expression 2 (Gmod Wiremod) code.
" if !exists("*TryE2Highlight")
"     function TryE2Highlight()
"         if getline(1) =~ '\v^\@(name|inputs|outputs|persist|trigger|model)>'
"             set filetype=e2
"         endif
"     endfunction
" endif

if has("autocmd")
    " autocmd BufReadPost *.txt call TryE2Highlight()

    " If you write a file multiple times, it'll get sourced multiple times in
    " a row, which is really not good.
    "
    " Are you sure, me-from-the-past? I've done this successfully before.
    "
    " Okay maybe I knew what I was talking about. After awhile I think it
    " starts to freeze.
    " autocmd BufWritePost vimrc source $MYVIMRC
endif

" Disable indentLine by default. It's only handy every now and then.
let g:indentLine_enabled=0

set display=lastline

" Don't open files with folds already closed. Leave them open.
set nofoldenable

" disabled except in gvim because terminal colors get messed up
" colorscheme

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" Note: Vundle requres nocompatible!
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" Set by Vundle above, and required.
" filetype indent plugin on

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
set nohlsearch

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

" easy editing of vimrc and gvimrc
nmap <Leader>v :edit $MYVIMRC<CR>
nmap <Leader>g :edit $MYGVIMRC<CR>

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
