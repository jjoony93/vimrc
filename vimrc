call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'altercation/vim-colors-solarized'
Plug 'ambv/black', { 'for': 'python' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier',
        \ { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'python', 'html'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-apathy'
Plug 'valloric/youcompleteme'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale', { 'for': 'javascript' }
call plug#end()

"prettier
"au BufWritePre *.js,*.json,*.html,*.tsx,*.ts Prettier
au BufWritePre *.py Black
au FileType python se softtabstop=4 shiftwidth=4
"let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#print_width = 160
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#arrow_parens= 'always'
let g:prettier#config#parser= 'typescript'
let g:prettier#config#jsx_bracket_same_line= 'false'
let g:prettier#config#bracket_spacing = 'true'

"youcompleteme
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]

"lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

se bg=dark
silent! colorscheme solarized

let mapleader="\<Space>"
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>e :Lexplore<cr>
nnoremap <leader>s :/
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>t :term<cr>
nnoremap <leader>1 :set rnu!<cr>
"open file under cursor in a vertical split
nnoremap <leader>v :vertical wincmd f<CR>
se cursorline
se expandtab
se hlsearch
se noswapfile
se nowrap
se number
se shiftwidth=2
se showcmd
se showmatch
se sidescrolloff=0
se softtabstop=2
se visualbell
set guitablabel=\[%N\]\ %t\ %M
set splitbelow
set termwinsize =15x0
set noimd
