call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'freeo/vim-kalisi'
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'ternjs/tern_for_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'szw/vim-maximizer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'raimondi/delimitmate'
let delimitMate_expand_cr = 1
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"tab completion
Plug 'ervandew/supertab'
"colorscheme
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim'
Plug 'mhartington/oceanic-next'
"transparency
Plug  'miyakogi/seiya.vim'
Plug 'preservim/nerdtree'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'mattn/vim-lsp-settings'
"language servers
Plug 'ryanolsonx/vim-lsp-typescript'

Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins'}

call plug#end()
"""""""""""""""""""""""""""""""""color schemes"""""""""""""""""""""""""""""""""""""""""""
" colorscheme monokai
colorscheme dracula

filetype plugin indent on    " required
""""""""""""""""""""""""""""relative line numbering""""""""""""""""""""""""""""""""""""""""
set relativenumber
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tabs and spaces
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
set autoindent " automatically set indent of new line
set smartindent
""""""""""""""""""""""""""""""""""""""""
set history=1000 " change history to 1000
set textwidth=120
" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
set mouse=c

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" disable Ex mode
noremap Q <NOP>
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
" make yank copy to the global system clipboard
set clipboard=unnamed

"stop delays
set timeoutlen=1000 ttimeoutlen=0
"""""""""""""""""""""""""""""""""" toggle invisible characters"""""""""""""""""""""""""""""""""""""""'
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none ctermfg=8 " make the highlighting of tabs less annoying
highlight NonText ctermbg=none ctermfg=8
set showbreak=↪
""""""""""""""""""""""""""""""""""""" LEADER KEY BINDINGS""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader ="\<Space>"
let g:mapleader = "\<Space>"
" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>
"inset semicolon to end of the line
inoremap <leader>; <c-o>A;
inoremap <leader>, <c-o>A,
inoremap <leader>. <c-o>A.
inoremap <leader>] <c-o>A]
inoremap <leader>} <c-o>A}
inoremap <leader>) <c-o>A)
inoremap <leader><space> <c-o>A

nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
map <leader>o o<ESC>
map <leader>O O<ESC>
" console.log word under cursor
nmap <leader>cl yiwoconsole.log('<c-r>"', <c-r>");<esc>^
" noremap <leader>t :tab all<esc>
noremap <leader>d :r!date<esc>
noremap <leader>n :E<esc>
noremap <leader>s :w !sudo tee %<esc>
noremap <leader>q :s/\"\(.*\)\"/\'\1\'<esc>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>
vmap <leader>" S"lvi"
vmap <leader>' S'lvi'
vmap <leader>` S`lvi`
vmap <leader>( S)lvi(
vmap <leader>{ S}lvi{
vmap <leader>[ S]lvi[
vmap <leader>< S>lvi<
"""""""""""""""""""""""""""""""""""""""OTHER KEY BINDINGS""""""""""""""""""""""""""""""""""""""""""""""""
" toggle cursor line
let g:fzf_layout = { 'down': '~25%' }
"select newly pasted text
nnoremap gV `[v`]
"fzf to ctrl p
noremap <c-p> <Esc>:FZF<CR>
" tell it to use an undo file
let g:netrw_liststyle=3

:let g:AirlineTheme='durant'


"""""""""""""""""""""""""""""""""""""""Language Server Settings""""""""""""""""""""""""""""""""""""""""""""""""
" TypeScript
" if executable('typescript-language-server')
" au User lsp_setup call lsp#register_server({
"       \ 'name': 'typescript-language-server',
"       \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"       \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"       \ 'whitelist': ['typescript', 'typescript.tsx'],
"       \})
" endif
"
" Rust
autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden
"
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
\}

"" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
" }
