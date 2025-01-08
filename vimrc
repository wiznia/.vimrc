syntax on           " syntax highlighting

set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
set nobackup
set noswapfile
set nopaste
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'alvan/vim-closetag'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'kennykaye/vim-relativity'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'tpope/vim-surround'
Plugin 'troydm/zoomwintab.vim'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'
Plugin 'apazzolini/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'ervandew/supertab'
Plugin 'neoclide/coc.nvim'
Plugin 'neoclide/coc-tsserver'

" SirVer/ultisnips Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:coc_global_extensions = ['coc-tsserver']

" vim-closetag filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

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
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']

let g:vim_jsx_pretty_colorful_config = 1

set ignorecase      " ignores case in searches
set smartcase       " copes with camel/underscore/upper/lower case on searches and replacements
set nocompatible    " keeps things vimmy, and not vi-y filetype plugin indent on
set autoread
set relativenumber  " shows relative number lines
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
set laststatus=2
set noswapfile

" syntax matching help -- perlgem-centric,
augroup syntax
  autocmd!
  au BufNewFile,BufRead *.logic set filetype=perl
  au BufNewFile,BufRead *.tmpl set filetype=html.perl
  au FileType html setlocal indentkeys-=*<Return>
  au FileType tmpl setlocal indentkeys-=*<Return>
  au FileType mustache setlocal indentkeys-=*<Return>
  au BufNewFile,BufReadPost *.pug set filetype=pug
  au BufNewFile,BufReadPost *.json set foldmethod=syntax
  au BufNewFile,BufReadPost *.*.liquid let b:liquid_subtype = 'html'
  au BufRead,BufNewFile *.ejs setfiletype html
  au BufNewFile,BufRead *.jsx setlocal ft=html ft=javascript
  au FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup end

" set the value of <leader> to ","
let mapleader = ","

" set autoclose tags for these file types
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.scss,*.css,*.js'

" activate rainbow plugin on init
let g:rainbow_active =1
let g:user_emmet_leader_key=','

nmap <leader>ne :NERDTreeToggle<cr>
map <Leader>f :CtrlP<cr>
map <leader>a :Ack!<space>
map <leader>gb :Git blame<cr>
nmap <leader>b :b#<cr>
" map * to move a line up
nnoremap * ddkP
" map - to move a line down
nnoremap - ddp
" map ,ev to open VIMRC file on a split horizontal window
nnoremap <leader>ev :split $MYVIMRC<cr>
" map ,sv to source VIMRC file
nnoremap <leader>sv :source $MYVIMRC<cr>
" map oo to insert a new line below without entering insert mode
nnoremap oo o<esc>
" map OO to insert a new line above without entering insert mode
nnoremap OO O<esc>
" map ,v to split pane vertically and move to it
nnoremap <leader>v <C-w>v<C-w><C-w>
" map ,h to split pane horizontally and move to it
nnoremap <leader>h <C-w>s<C-w><C-w>
" map ,z to trigger zoom toggle on panes
nnoremap <leader>z :ZoomWinTabToggle<cr>


" insert new lines without having to enter text
nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>

" don't skipped wrapped lines when moving up and down
nnoremap j gj
nnoremap k gk

vnoremap j gj
vnoremap k gk
noremap <Leader>d "_ddP

" ABBREVIATIONS:
iabbrev wiz wiznia@gmail.com

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

colorscheme gruvbox
highlight Cursorline ctermbg=black

set visualbell
set foldlevelstart=20

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" Ignore <F24> and <F25> globally
if exists('$WT_SESSION')
    nnoremap <F24> <nop>
    nnoremap <F25> <nop>
    inoremap <F24> <nop>
    inoremap <F25> <nop>
endif
