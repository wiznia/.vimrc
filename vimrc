set ignorecase      " ignores case in searches
set smartcase       " copes with camel/underscore/upper/lower case on searches and replacements
set nocompatible    " keeps things vimmy, and not vi-y filetype plugin indent on
set autoread
set re=0
syntax on           " syntax highlighting

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'alvan/vim-closetag'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-commentary'
Plugin 'kennykaye/vim-relativity'
Plugin 'luochen1990/rainbow'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-obsession'
Plugin 'tmux-plugins/vim-tmux-focus-events'

autocmd BufNewFile,BufReadPost *.*.liquid let b:liquid_subtype = 'html'
au BufRead,BufNewFile *.ejs setfiletype html
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
set background=dark
set encoding=utf-8
call vundle#end()            " required
filetype plugin indent on    " required

let g:indent_guides_enable_on_vim_startup = 1
let g:NERDTreeIgnore=['\~$', 'tmp']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

set runtimepath^=~/.vim/bundle/ctrlp.vim
set showmode        " shows inputs or replacement mode at the bottom
set showcmd         " shows you what you just yanked or have selected or whatever
set shiftround      " finds tabstop multiples on lines and <<'s or >>'s to those intervals
set autoindent      " indents on CR
set backspace=1     " allows use of the backspace key
set ruler           " lets you know your cursor position
set number          " line numbers!
set tabstop=2       " how many columns a tab counts for
set shiftwidth=2    " how many columns an indent or unindent (typing ">>" or "<<") uses
set expandtab       " turns tabs into spaces
set wrapscan        " goes back to the top of the file when search reaches the end
set showmatch       " highlights the matching braced or parenthesis to the one the cursor is on
set hlsearch        " highlights all search pattern matches
set incsearch       " keeps matching searches as you type each character
set backspace=indent,eol,start    " backspace through everything in insert mode
set cursorline      " highlights the whole line your cursor is on (so you can find it easily)

set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is                                   " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is                                   " off and the line continues beyond the right of the screen

" remove swap and backup files from your working dir
set backupdir=~/.vim/.tmp
set directory=~/.vim/.tmp
set laststatus=2
set noswapfile

" syntax matching help -- perlgem-centric,
au BufNewFile,BufRead *.logic set filetype=perl
au BufNewFile,BufRead *.tmpl set filetype=html.perl
autocmd FileType html setlocal indentkeys-=*<Return>
autocmd FileType tmpl setlocal indentkeys-=*<Return>
autocmd FileType mustache setlocal indentkeys-=*<Return>

" set the value of <leader> to ","
let mapleader = ","           " commented out in case you like your
" set autoclose tags for these file types
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.scss,*.css,*.js'
" activate rainbow plugin on init
let g:rainbow_active =1
let g:user_emmet_leader_key=','

nmap <leader>ne :NERDTreeToggle<cr>
map <Leader>f :CtrlP<cr>
map <leader>a :Ack!<space>
map <leader>gb :Gblame<cr>
nmap <leader>b :b#<cr>

" clears search highlights
nmap <silent> <leader><space> :nohlsearch<CR>

" insert new lines without having to enter text
nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>

" don't skipped wrapped lines when moving up and down
nnoremap j gj
nnoremap k gk

vnoremap j gj
vnoremap k gk

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
exec "set <F24>=\<Esc>[O"
exec "set <F25>=\<Esc>[I"

colorscheme gruvbox
highlight Cursorline ctermbg=black


