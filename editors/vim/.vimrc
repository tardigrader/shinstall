set encoding=utf-8

if v:progname == 'vi'
  set noloadplugins
endif

filetype on
filetype plugin on
packadd! matchit
set omnifunc=syntaxcomplete#Complete

"-- PLUGINS ------------------------------------------------------------------
"
" Install Plug: 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"
Plug 'scrooloose/nerdtree'              " File manager
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'junegunn/goyo.vim'                " Distraction-free writing
Plug 'jlanzarotta/bufexplorer'          " Buffers
"Plug 'vim-pandoc/vim-pandoc'            " Pandoc integration
Plug 'vim-syntastic/syntastic'          " Syntax checking
Plug 'python-mode/python-mode'          " Python IDE for Vim
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'gitgutter/Vim'                    " Git gutter
Plug 'kien/ctrlp.vim'                   " Fuzzy search 
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " Code completion
Plug 'tpope/vim-commentary'             " Easy commenting
"Plug 'mhinz/vim-signify'                " Git, Mercurial, Subversion, cvs etc
"Plug 'dracula/vim'                      " Color theme
"Plug 'andbar-ru/vim-unicon'             " Color theme
Plug 'morhetz/gruvbox'                  " Color theme
Plug 'luochen1990/rainbow'              " Rainbow parenthesis

" Initialize plugin system
call plug#end()
"
"-- KEY MAPPINGS -------------------------------------------------------------

nmap <Leader>n :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>

" Vertical split with \v
nmap <Leader>v <C-w>v-<C-w>l

" Horizontal split with \h
nmap <Leader>h <C-w>s-<C-w>l            

" Toggle showing invisible characters on/off
nmap <Leader>l :set list!<CR>

" Toggle highlightning of search results
nmap <Leader>/ :set nohlsearch!<CR>

" Toggle line numbering
nmap <Leader>n :set number!<CR>
nmap <F3> :set number!<CR>

" De-highlight matches and redraw screen
nnoremap <leader><C-l> 
      \:nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>zz<c-l>

"-- Emacs-like stuff---------------------------------------------------------

" Ctrl-g aborts current action
imap <C-g> <Esc>

" Alt-<   Top of file, Alt-> Bottom, like in Emacs
nmap < gg
nmap > G

" Open file 
map <C-x><C-f> :NERDTreeFind<CR>
"imap <C-x><C-f> <ESC>:NERDTreeFind<CR> " CONFLICTS WITH VIMS COMPLETION!

" Rewrap text
map q gql
vmap q gql
imap q <Esc>gqli

"map <C-x><C-s> :w<CR><C-q><CR>      " Save file. Not possible because of XOFF?

" Get RID OFF F0 kelp key! Make it an ESC key instead.
inoremap <F1> <ESC>
noremap  <F1> <ESC>
noremap  <F1> <ESC>


"-- THEME AND VISUALS--------------------------------------------------------

"if $TERM ==# "xterm-256color"
"    set termguicolors
"endif

let g:gruvbox_italic=1
colorscheme gruvbox
let g_gruvbox_termcolors=16
set background=light
syntax enable           " Turn on syntax highlighting allowing local overrides
set cursorline          " Highlight the line the cursor is on

"-- Statusbar---------------------------------------------------------------
if has("statusline") && !&cp
  set laststatus=2                  " Always show the status bar
  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=\ Col:%v
  set statusline+=\ Buf:#%n
  set statusline+=[%b][0x%B]
  set statusline+=\ \ <F2>\ NERDt\ <F3>\ LineNrs\ <F4>\ Tagbar
endif

"----------------------------------------------------------------------------

set wrap
set linebreak
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85                  " Show colored column at col 85.
                                    "THAT'S A TOO LONG LINE!
set number                          " Show line numbers
set ruler                           " Show line and column number

set tabstop=4                       " A tab is four spaces
set shiftwidth=2                    " An autoindent (with <<) is two spaces
set expandtab                       " Use spaces, not tabs

set scrolloff=2                     " When page starts to scroll keep the
                                    "cursor two lines from top/bottom

" List chars
set list                            " Show invisible characters
set listchars=""                    " Reset the listchars
set listchars=tab:▸\ ,eol:¬         " A tab should display as "▸"
set listchars+=trail:.              " Show trailing spaces as dots
set listchars+=extends:>            " The character to show in the last
                                    " column when wrap is off and the line
                                    " continues beyond the right of the
                                    " screen
set listchars+=precedes:<           " The character to show in the last
                                    " column when wrap is off and the line
                                    " continues beyond the left of the
                                    " screen

"-- SEARCHING ----------------------------------------------------------------

set hlsearch                        " Highlight matches
set incsearch                       " Incremental searching

" Searches are insensitive BUT it messes with omni complete in html files.
" The remedy below sets noignorecase on html/css/etc.
augroup ignorecase
    autocmd! BufEnter *.css,*.html,*.htm,*scss :set noignorecase 
augroup END

set ignorecase                      " Searches are case insensitive...
set smartcase                       " ... unless they contain at least one
                                    " capital letter

"-- FILE MANAGEMENT ---------------------------------------------------------
"
"-- NERDTree ----------------------------------------------------------------

" Automatically load NERDTree if Vim is opened without any file specified.
if has("autocmd")
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

" Open Vim with NERDTree open if I happen to edit a directory.
if has("autocmd")
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) 
          \&& !exists("s:std_in") | wincmd p | ene | 
          \exe 'NERDTree' argv()[0] | endif
endif

" Let me close Vim even if the only window left is NERDTree.
if has("autocmd")
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") 
          \&& b:NERDTree.isTabTree()) | q | endif
endif

let NERDTreeQuitOnOpen = 1          " Automatically close after opening a file
let NERDTreeDirArrows = 1           " Show pretty arrows on directories
let NERDTreeShowHidden = 1          " Show hidden files

"-- BACKUP AND SWAP FILES ---------------------------------------------------

" Create backup directory if it doesn't exist.
if !isdirectory($HOME.'/.vim/_backup') && exists('*mkdir')
  call mkdir($HOME.'/.vim/_backup')
endif

" Create temp directory if it doesn't exist.
if !isdirectory($HOME.'/.vim/_temp') && exists('*mkdir')
  call mkdir($HOME.'/.vim/_temp')
endif

set backup                          " Enable backups.
set backupdir^=~/.vim/_backup//     " Where to put backup files.
set directory^=~/.vim/_temp//       " Where to put swap files.
set undofile                        " Save the undo tree
set undodir=~/.vim/_backup/         " ...in this directory. 


" -- PROGRAMMING FILETYPE SPECIFIC ------------------------------------------
let g:rainbow_active = 1                " Enable rainbow parenthesis

au FileType ruby setlocal sts=2 sw=2    " Enable width of 2 for ruby tabbing

" Load indentation rules and plugins according to the detected filetype.

if has("autocmd")
  filetype plugin indent on
endif

" Reread configuration of Vim if .vimrc is saved
augroup VimConfig
  au!
  autocmd BufWritePost ~/.vimrc       so ~/.vimrc
  autocmd BufWritePost vimrc          so ~/.vimrc
augroup END

" -- MAIL SETTINGS ----------------------------------------------------------
if has('autocmd')"
  autocmd FileType mail   setl noai
  autocmd FileType mail   setl nojs
  autocmd FileType mail   setl nosmartindent
  autocmd FileType mail   setl ts=14
  autocmd FileType mail   setl tw=72
  autocmd FileType mail   setl shiftwidth=2
  autocmd FileType mail   setl expandtab
endif


" From wiki.archlinux.org
" I should read and learn these sometime

" VIM TIPS / HELP / TRICKS   {{{1
" ===========================================================================

" BEST TRICKS {{{2

" TERMCAP HELP {{{3
" :help termcap

" :g/^\s*$/;//-1sort to sort each block of lines in a file.


" VIEW DIFF OF EDITS AGAINST BUFFER VS ORIGINAL FILE {{{3
" :w !colordiff -u % -


" INSERT CURRENT FILENAME {{{3
" :r! echo %

" DELETE TRAILING WHITESPACE {{{3
" :%s/\s\+$//

" Changing Case
" guu                             : lowercase line
" gUU                             : uppercase line
" Vu                              : lowercase line
" VU                              : uppercase line
" g~~                             : flip case line
" vEU                             : Upper Case Word
" vE~                             : Flip Case Word
" ggguG                           : lowercase entire file
"
" " Titlise Visually Selected Text (map for .vimrc)
" vmap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>
"
" " Title Case A Line Or Selection (better)
vnoremap <F6> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]
"
" " titlise a line
" nmap ,t :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]
"
" " Uppercase first letter of sentences
" :%s/[.!?]\_s\+\a/\U&\E/g


" :r file " read text from file and insert below current line

" :so $VIMRUNTIME/syntax/hitest.vim	  " view highlight options

"}}}2


" HELP HELP {{{3
" ---------------------------------
" :helpg pattern					  search grep!! ---  JUMP TO OTHER MATCHES WITH: >
" :help holy-grail
" :help all
" :help termcap
" :help user-toc.txt          Table of contents of the User Manual. >
" :help :subject              Ex-command "subject", for instance the following: >
" :help :help                 Help on getting help. >
" :help CTRL-B                Control key <C-B> in Normal mode. >
" :help 'subject'             Option 'subject'. >
" :help EventName             Autocommand event "EventName"
" :help pattern<Tab>          Find a help tag starting with "pattern".  Repeat <Tab> for others. >
" :help pattern<Ctrl-D>       See all possible help tag matches "pattern" at once. >
"		  :cn                         next match >
"		  :cprev, :cN                 previous match >
"		  :cfirst, :clast             first or last match >
"		  :copen,  :cclose            open/close the quickfix window; press <Enter> to jump to the item under the cursor



" SET HELP {{{3
" ---------------------------------
" :verbose set opt? - show where opt was set
" set opt!		- invert
" set invopt		- invert
" set opt&		- reset to default
" set all&		- set all to def
" :se[t]			Show all options that differ from their default value.
" :se[t] all		Show all but terminal options.
" :se[t] termcap		Show all terminal options.  Note that in the GUI the



" TAB HELP   {{{3
" ---------------------------------
" tc	- create a new tab
" td	- close a tab
" tn	- next tab
" tp	- previous tab



" UPPERCASE, LOWERCASE, INDENTS {{{3
" ---------------------------------
" '.	- last modification in file!
" gf  - open file under cursor
" guu - lowercase line
" gUU - uppercase line
" =   - reindent text



" FOLDS {{{3
" ---------------------------------
" F 	- create a fold from matching parenthesis
" fm	- (zm)  more folds
" fl  - (zr) less/reduce folds
" fo	- open all folds (zR)
" fc	- close all folds (zM)
" ff  -  (zf)	- create a fold
" fd	- (zd)	- delete fold at cursor
" zF	- create a fold N lines
" zi	- invert foldenable



" KEYSEQS HELP {{{3
" ---------------------------------
" CTRL-I - forward trace of changes
" CTRL-O - backward trace of changes!
" C-W W	 - Switch to other split window
" CTRL-U		  - DELETE FROM CURSOR TO START OF LINE
" CTRL-^		  - SWITCH BETWEEN FILES
" CTRL-W-TAB  		  - CREATE DUPLICATE WINDOW
" CTRL-N		  - Find keyword for word in front of cursor
" CTRL-P		  - Find PREV diddo


" SEARCH / REPLACE {{{3
" ---------------------------------
" :%s/\s\+$//    		  - delete trailing whitespace
" :%s/a\|b/xxx\0xxx/g             modifies a b      to xxxaxxxbxxx
" :%s/\([abc]\)\([efg]\)/\2\1/g   modifies af fa bg to fa fa gb
" :%s/abcde/abc^Mde/              modifies abcde    to abc, de (two lines)
" :%s/$/\^M/                      modifies abcde    to abcde^M
" :%s/\w\+/\u\0/g                 modifies bla bla  to Bla Bla
" :g!/\S/d				delete empty lines in file


"  COMMANDS {{{3
" ---------------------------------
" :runtime! plugin/**/*.vim  - load plugins
" :so $VIMRUNTIME/syntax/hitest.vim	  " view highlight options
" :so $VIMRUNTIME/syntax/colortest.vim

" :!!date - insert date
" :%!sort -u  - only show uniq (and sort)

" :r file " read text from file and insert below current line
" :v/./.,/./-1join  - join empty lines

" :e! return to unmodified file
" :tabm n  - move tab to pos n
" :jumps
" :history
" :reg   -  list registers

" delete empty lines
" global /^ *$/ delete
