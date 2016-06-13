call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'freeo/vim-kalisi'
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
"tern javascript
Plug 'ternjs/tern_for_vim'
"nerd tree 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'szw/vim-maximizer'
Plug 'ctrlpvim/ctrlp.vim'
" language-specific plugins
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support

Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
"youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

"pair completion 
Plug 'raimondi/delimitmate'
let delimitMate_expand_cr = 1
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"air line 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"tab completion
Plug 'ervandew/supertab'
call plug#end()





filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"relative line numbering 
set relativenumber 
set number 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''
"nerd tree cursor 
"autocmd VimEnter * NERDTree | wincmd p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"close nerd tree 
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"move splits with arrow keys 
    tnoremap <c-h> <C-\><C-n><C-w>h
    tnoremap <c-j> <C-\><C-n><C-w>j
    tnoremap <c-k> <C-\><C-n><C-w>k
    tnoremap <c-l> <C-\><C-n><C-w>l
    nnoremap <c-h> <C-w>h
    nnoremap <c-j> <C-w>j
    nnoremap <c-k> <C-w>k
    nnoremap <c-l> <C-w>l
"""""""""""""""""""""""""""""""""""""""""""
" Ali: to indent json files on save
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
"high light search results
set hlsearch
""""""""""""""""""""""""""""""""""""""""
"paste toggle
"set pastetoggle=<F2>
""""""""""""""""""""""""""""""""""""""""
"nerd tree toggle
map <F1> :NERDTreeToggle<CR>
" set a map leader for more key combos
 let mapleader = ','
 let g:mapleader = ','
set history=1000 " change history to 1000
set textwidth=120
" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

" switch syntax highlighting on
syntax on
syntax enable
set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
endif

set background=dark
set termguicolors
colorscheme one
set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time
" show hidden files in NERDTree
"let NERDTreeShowHidden=1
"tern stuff 
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
"set completeopt-=preview
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"auto complete html shit
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"copy into clipboard 
set clipboard=unnamed
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""''''"powerline/airline""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:bufferline_echo = 0
let g:airline#extensions#whitespace#enabled = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=c


" trying to get youcompleteme and snipmate to stop fighting
  " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

highlight Pmenu guibg=brown gui=bold
highlight Pmenu ctermbg=238 gui=bold
"disable search highlighting 
nnoremap <CR> :noh<CR><CR>
"reload vim without closing
nnoremap rv :source $MYVIMRC<CR>

let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 0

"save and restore sessions 
map <F7> :mksession! ~/vim_session <cr> " Quick write session with <F7>
map <F8> :source ~/vim_session <cr>     " And load session with <F8>

set splitbelow
set splitright

"remove trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e

"transparent vim 
hi Normal          ctermfg=252 ctermbg=none