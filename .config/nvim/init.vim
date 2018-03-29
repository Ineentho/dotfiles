call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake'
Plug 'prettier/vim-prettier'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
"Plug 'heavenshell/vim-jsdoc'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'
Plug 'skwp/greplace.vim'
"Plug 'galooshi/vim-import-js'

call plug#end()

let g:fugitive_gitlab_domains = ['http://gitlab']

set diffopt+=vertical

let g:jsx_ext_required = 0


let g:vim_markdown_conceal = 0
let g:prettier#autoformat = 0
let g:prettier#config#tab_width = 4
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#print_width = 100

:let mapleader = ","

nmap <Leader>p <Plug>(Prettier) :w<cr>

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
"set clipboard=unnamed
set clipboard+=unnamedplus

set gdefault

let g:indentLine_char = 'â'


let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_javascript_enabled_makers = ['jshint']

"InsertChange,TextChanged,InsertLeave
"autocmd InsertChange,TextChanged,BufEnter,InsertLeave * update | Neomake
"autocmd CursorHold,BufEnter * update | Neomake

autocmd! BufWritePost,BufEnter * Neomake

" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"

nmap <c-p> :Files<cr>
set undolevels=100000

set number

" call deoplete#enable()

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Trigger InsertLeave on ctrl-C
:ino <C-C> <Esc>

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -f -g ""'
"let $FZF_DEFAULT_COMMAND = 'git grep --line-number ""'


let g:SuperTabDefaultCompletionType = "<c-n>"


set inccommand=split

":nnoremap <leader>e :w | !eslint --fix % | e!
:nnoremap <leader>e :w<cr> \| :!eslint --fix %<cr> \| :e!<cr>
:map <leader>- :tab split<cr>-
:map <leader>Ã¥ :GitGutterPrevHunk<cr>
:map <leader>Ã¤ :GitGutterNextHunk<cr>
:map <leader>Ã¶ :GitGutterPreviewHunk<cr>
:map <leader>f :Files<cr>expand("<cfile>")

:map <C-l> :Files<cr>www_webbookings/
:map <C-k> :Files<cr>common/
:map <C-j> :Files<cr>www_admin_2/
:map <C-h> :Files<cr>www_admin/admin/
:map <C-g> :Files<cr>www_dispatch_2/

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

:map <leader>l :TernDef<cr>
:map <leader>k :TernDefPreview<cr>

:map ; :Buffers<CR>

:map <leader>,c :%s/\(:.*\)\@<=

let g:ackprg = 'ag -f --vimgrep'

set grepprg=ag
let g:grep_cmd_opts = '-f --line-numbers --noheading'

inoremap <expr> <plug>(fzf-complete-file-ag)     fzf#vim#complete#path("ag -l -g -f ''")

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100000

set updatetime=250

set mouse=a

augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 10000 line=1 name=mysign buffer=" . bufnr('%')
augroup END

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

command! Imports call fzf#vim#grep("ag -f --color --color-match '1;1' \"import\\s+((\\w+|{[\\w\\s,]+})\\s+from|)\\s*['\\\"][\\w/.]+['\\\"]\"", "")

autocmd VimEnter * command! -nargs=* -bang Ag call fzf#vim#ag_raw('-f "' . <q-args> . '"', <bang>0)

augroup filetypedetect
    au BufRead,BufNewFile *.tag set filetype=html
augroup END


let g:deoplete#enable_at_startup = 1

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let @x = '/<?phpdf(ilkb<Loc text=f"f"df>i" />'


set t_Co=256
"set background=dark
set termguicolors
syntax enable
colorscheme OceanicNext

let g:indentLine_color_gui = '#444444'
