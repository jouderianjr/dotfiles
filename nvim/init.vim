call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
" Syntax highlighting
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'jparise/vim-graphql'
" Language server client
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'morhetz/gruvbox'
Plug 'gabesoft/vim-ags'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'editorconfig/editorconfig-vim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

let mapleader=','

colorscheme gruvbox

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

map <leader>p :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
map ; :FZF<CR>
map <leader>f :Ags 
map <leader>t :e#<CR>
map <leader>a <Plug>(easymotion-s)
map <leader>w :w<CR>
map <leader>q :q<CR>
map <F3> <ESC>
map! <F3> <ESC>
inoremap <C-F> <C-R>"

noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

nmap <silent> <leader>d <Plug>(coc-diagnostic-next)

" Refresh all buffers
nnoremap <F5> :checktime<CR>

" Turn off highlight match on press enter
nnoremap <CR> :noh<CR><CR>       

" go to definition
nmap <silent> <Leader>la <Plug>(coc-codeaction)
nmap <silent> <Leader>ld <Plug>(coc-definition)
nmap <silent> <Leader>lt <Plug>(coc-type-definition)
nmap <silent> <Leader>li <Plug>(coc-implementation)
nmap <silent> <Leader>lr <Plug>(coc-references)
nmap <silent> <Leader>le <Plug>(coc-diagnostic-next)



" Copy to clipboard on selection+Y
"noremap Y "*y
"noremap P "*p

" make y p use the OS buffer for copy/paste from VIM to some other app
set clipboard=unnamedplus


set background=dark    " Setting dark mode
set number
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase                    " searches are case insensitive...
set smartcase                     " unless they contain at least one capital letter
set relativenumber


let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}

let g:ale_fix_on_save = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

let g:ycm_semantic_triggers = {
  \ 'elm' : ['.'],
\}

let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1


" from Ryan florence ->
" https://gist.github.com/ryanflorence/6d92b7495873263aec0b4e3c299b3bd3
" Keep the error column always visible (jumpy when linter runs on input)
:set signcolumn=yes

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
" let g:prettier#autoformat = 1

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync


" CoC recommendations
set termguicolors
set encoding=utf-8
set hidden
set nobackup
set nowritebackup

"augroup fmt
  "autocmd!
  "autocmd BufWritePre * undojoin | Neoformat brittany
"augroup END

autocmd Filetype haskell setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
