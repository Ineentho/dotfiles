call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'mhartington/oceanic-next'
Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'

call plug#end()


:let mapleader = ","

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
"set clipboard=unnamed
set clipboard+=unnamedplus

set termguicolors
set gdefault


let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_javascript_enabled_makers = ['jshint']

"InsertChange,TextChanged,InsertLeave
"autocmd InsertChange,TextChanged,BufEnter,InsertLeave * update | Neomake
"autocmd CursorHold,BufEnter * update | Neomake

autocmd! BufWritePost,BufEnter * Neomake

nmap <c-p> :Files<cr>
set undolevels=100000

set number

call deoplete#enable()

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Trigger InsertLeave on ctrl-C
:ino <C-C> <Esc>

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -f -g ""'
"let $FZF_DEFAULT_COMMAND = 'git grep --line-number ""'

":nnoremap <leader>e :w | !eslint --fix % | e!
:nnoremap <leader>e :w<cr> \| :!eslint --fix %<cr> \| :e!<cr>

let g:ackprg = 'ag -f --vimgrep'

inoremap <expr> <plug>(fzf-complete-file-ag)     fzf#vim#complete#path("ag -l -g -f ''")

syntax enable
colorscheme OceanicNext
set background=dark

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100000

set updatetime=250

augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 10000 line=1 name=mysign buffer=" . bufnr('%')
augroup END

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"autocmd VimEnter * command! AgC call fzf#vim#ag_raw('-fs ')
autocmd VimEnter * command! -nargs=* -bang Ag call fzf#vim#ag_raw('-f "' . <q-args> . '"', <bang>0)
