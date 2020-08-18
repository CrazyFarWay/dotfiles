set number "Para que aparezcan los numeros de linea
set mouse=a "Para poder usar el mouse dentro del editor
set numberwidth=1 "El ancho de la columna de numeros de linea
set clipboard=unnamed "Para que lo que copiamos dentro del editor no se almacene en la papelera del SO
syntax on "Para colorear la sintaxis
set showcmd "Para mostrar los comandos que ejecutamos
set ruler "Para mostrar la posicion del cursor
set encoding=utf-8 "Para usar caracteres latinoamericanos
set showmatch "Para que muestre el cierre de parentesis, etc. cuando nos posicionamos en el inicial
set sw=2 "Para que cuando identemos el texto nos reemplace el TAB por 2 espacios
set relativenumber "Para que muestre numeros relativos
set laststatus=2 "Para que la barra de abajo siempre sea visible
set noshowmode "Para que no muestre el modo actual
set noerrorbells "Para que no suene la campanita cuando vas al final e la linea
"set smartindent "Para que indente lo mejor que pueda
set noswapfile "Para que no se creen los archivos swap editables
set nobackup "Para no hacer backup
set undodir=~/.vim/undodir "Direccion del undofile
set undofile "Para establecer un archivo personalizado donde guardamos los undo
set incsearch "Para que mientras buscas se van resaltando las cosas
set termguicolors
set wildmenu
"set enconding=UTF-8 "Para vim solamente, neovim ya utiliza utf-8 predeterminado

call plug#begin('~/.vim/plugged')

" Personalizacion
Plug 'danilo-augusto/vim-afterglow'
Plug 'ryanoasis/vim-devicons'
Plug 'ajh17/spacegray.vim'

" Wiki
Plug 'vimwiki/vimwiki'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
"Plug 'Valloric/youcompleteme'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'
Plug 'ap/vim-css-color'
Plug 'sts10/vim-pink-moon'

" GAMES
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()

set background=dark
"let g:afterglow_blackout=1
colorscheme spacegray

" Para poner background transparente
"hi Normal guibg=NONE ctermbg=NONE

"No entendi muy bien para que sirve, es algo sobre git
if executable('rg')
  let g:rg_derive_root='true'
endif

let g:ctrlp_use_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "Para excluir archivos en la busqueda

let mapleader=" " "Para establecer el espacio como tecla lider para ejecutar comandos 

let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"You complete me
"nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" Reconfiguracion de teclas
nmap <Leader>f <Plug>(easymotion-s2)

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+p

"COC keybindings

"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? coc#_select_confirm() :
"  \ coc#expandableOrJumpable() ?
"  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ coc#refresh()
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"let g:coc_snippet_next = '<tab>'
"
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
