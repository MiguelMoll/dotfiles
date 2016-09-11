set shell=/bin/bash

set nocompatible              " be iMproved, required by Vundle.

call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'benmills/vimux'
"Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode'
Plug 'chase/vim-ansible-yaml'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
filetype plugin indent on     " required by vundle

" Mapping space to leader instead of remapping leader to space.
map <Space> <Leader>

" Map buffers
map <Leader>b :bp<cr>
map <Leader>n :bn<cr>

colorscheme molokai
syntax on
set cursorline
set mouse=a
set ignorecase
set autoread
set incsearch
set hlsearch
set encoding=utf-8
set nofoldenable
set noswapfile
set number
set relativenumber
set completeopt-=preview

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

nnoremap <Leader><Space> :w<CR>
nnoremap <Leader>q :x<CR>
nnoremap <Leader>a :wa<CR>

" Copy & paste to system clipboard with xsel installed
set clipboard+=unnamedplus

let g:ctrlp_user_command = 'sift -i --no-conf --no-color --no-group --targets --path "" %s'
"let g:ctrlp_user_command = 'ag %s -Ul --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_show_hidden = 1

" Make sure to ignore gitignore
let g:ag_prg="ag -U --vimgrep --smart-case"

" disable Ex mode
noremap Q <NOP>

" NeoVim's terminal
" Saving it for a raniy day.
"tnoremap <ESC> <C-\><C-n>
"tnoremap <A-h> <C-\><C-n><C-w>h
"tnoremap <A-j> <C-\><C-n><C-w>j
"tnoremap <A-k> <C-\><C-n><C-w>k
"tnoremap <A-l> <C-\><C-n><C-w>l

nmap <F8> :TagbarToggle<CR>

" Dam tmux giving issues. Have to disable BCE
set t_ut=
set t_Co=256

" Stupid (visual)bell be gone!
set vb t_vb=
autocmd GUIEnter * set vb t_vb=

" Neat little spell checker. (Comments only?)
map <leader>ss :setlocal spell!<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Use tab instead of % for moving between brackets
nnoremap <tab> %
vnoremap <tab> %

" Clear search results.
noremap <silent> <leader>, :noh<cr>:call clearmatches()<cr>

" Save when losing focus
au BufLeave * wa

" edit ~/.nvimrc
map <leader>ev :e! ~/.nvimrc<cr>
" edit ~/.tmux.conf
map <leader>et :e! ~/.tmux.conf<cr>

" Resize splits when the window is resized
au VimResized * :wincmd =

autocmd FileType ruby set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
autocmd FileType go set tabstop=8|set shiftwidth=8|set softtabstop=8|set smarttab|set expandtab

" For some reason when tab == 8, backspace stopped working.
set backspace=indent,eol,start

" Always show the status line
set laststatus=2
let g:airline_powerline_fonts=1
"let g:airline_theme="powerlineish"
let g:airline_theme="wombat"
let g:airline#extensions#tabline#enabled=1

" Splits
" Using backslash since it's the same key as the pipe character.
" Associate pipe with vertical split; minus with horizontal split.
set splitright
set splitbelow
nmap <Leader>\ :vnew<CR>
nmap <Leader>- :new<CR>

" Easier split navigation
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>

" Multiple cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Map omnifunc to Ctrl-Space
inoremap <C-@> <c-x><c-o>

"Toggle line numbers.
nnoremap <F2> :set nonumber!<CR>

"Toggle NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

""""""""""""" For some reason home and end keys are not mapping properly.
" Reference: http://vim.wikia.com/wiki/VimTip315
" Home key
imap <expr> <esc>OH (col('.') == match(getline('.'), '\S')+1 ? '<C-o>0' : '<C-o>^')
nmap <expr> <esc>OH (col('.') == match(getline('.'), '\S')+1 ? '0' : '^')
vmap <expr> <esc>OH (col('.') == match(getline('.'), '\S')+1 ? '0' : '^')
cmap <esc>OH <Home>
"
"" Helper maps so tmux doesn't mess with my mappings above.
imap <Home> <esc>OH
nmap <Home> <esc>OH
vmap <Home> <esc>OH

"" Original and simple Home key mappings.
" Home key
"imap <esc>OH <esc>0i
"cmap <esc>OH <home>
"nmap <esc>OH 0
"vmap <esc>OH 0
"
"" End key
imap <esc>OF <esc>$a
cmap <esc>OF <end>
nmap <esc>OF $
vmap <esc>OF $
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""vim-go settings"""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
nnoremap <silent> <Leader>d :GoDef<cr>
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <leader>e :GoErrCheck<CR>
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_fmt_command = "goimports"
"""""""""""""""""""""""""""""""""""vim-go settings"""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""vimux settings"""""""""""""""""""""""""""""""""""
"nmap <Leader>b :call VimuxRunCommand("go install")<cr>
"""""""""""""""""""""""""""""""""""vimux settings"""""""""""""""""""""""""""""""""""
let g:pymode_lint_cwindow = 0

"""""""""""""""""""""""""""""""""""UltiSnips settings"""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<c-s>"
"""""""""""""""""""""""""""""""""""UltiSnips settings"""""""""""""""""""""""""""""""

"""""""""""""""""""Notes""""""""""""""""""""""""""""""""""""""""
" do * on the word I want to replace which places it in the search buffer("/), then
" :%s//new_name/gc (c is to confirm the replacement.)

" Automatically reload vimrc when it's saved (Not working... :(
" autocmd bufwritepost .vimrc source $MYVIMRC

" Small map to insert the license
nnoremap <F9> :0r ~/.config/nvim/agpllic.txt<CR>

au BufNewFile,BufRead *.yml set filetype=ansible
au BufNewFile,BufRead *.yaml set filetype=ansible
