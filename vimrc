call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'altercation/vim-colors-solarized'
Plug 'ambv/black', { 'for': 'python' }
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
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
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-apathy'
" Plug 'valloric/youcompleteme', {'do': './install.py --clang-completer', 'for': ['javascript', 'typescript']}
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'jparise/vim-graphql'
call plug#end()
let g:ale_fixers = {
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}
let g:ale_linters = {
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}
" let g:ale_javascript_eslint_use_local_config = 1
" let g:ale_linters_explicit = 1
" let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
" let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"prettier
"au BufWritePre *.js,*.json,*.html,*.tsx,*.ts Prettier
au BufWritePre *.py Black
au FileType python se softtabstop=4 shiftwidth=4
" let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#print_width = 160
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#arrow_parens= 'always'
let g:prettier#config#parser= 'typescript'
let g:prettier#config#jsx_bracket_same_line= 'false'
let g:prettier#config#config_precedence = 'prefer-file'
" let g:prettier#config#bracket_spacing = 'false'

"youcompleteme
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]

"fzf
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'absolutepath' ]],
  \   'right': [ [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'filetype' ] ] 
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename'
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \ }
function! LightlineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction
function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
  \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
  \  &ft == 'unite' ? unite#get_status_string() :
  \  &ft == 'vimshell' ? vimshell#get_status_string() :
  \ '' != expand('%:t') ? expand('%:t') : '') .
  \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction
se bg=dark
silent! colorscheme solarized

let mapleader="\<Space>"
nnoremap <leader>T :se t_ti= t_te=<cr>
nnoremap <leader>t :w \| !python3 %<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Files ~<cr>
nnoremap <leader>s :Vex<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>r :Rg!<cr>
nnoremap <leader>R :Rg<cr>
nnoremap <leader>e :Lexplore<cr>
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
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
set noimd
set ignorecase
set smartcase
" set autochdir
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END
