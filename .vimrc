set number "Para que aparezcan los numeros de linea
set mouse=a "Para poder usar el mouse dentro del editor
set numberwidth=1 "El ancho de la columna de numeros de linea
set clipboard=unnamed "Para que lo que copiamos dentro del editor no se almacene en la papelera del SO
syntax enable "Para colorear la sintaxis
set showcmd "Para mostrar los comandos que ejecutamos
set ruler "Para mostrar la posicion del cursor
set encoding=utf-8 "Para usar caracteres latinoamericanos
set showmatch "Para que muestre el cierre de parentesis, etc. cuando nos posicionamos en el inicial
set sw=2 "Para que cuando identemos el texto nos reemplace el TAB por 2 espacios
set relativenumber "Para que muestre numeros relativos
set laststatus=2 "Para que la barra de abajo siempre sea visible
set noshowmode "Para que no muestre el modo actual


call plug#begin('~/.vim/plugged')

" Temas
Plug 'sainnhe/edge'

" Wiki
Plug 'vimwiki/vimwiki'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let g:edge_style = 'aura'
let g:edge_transparent_background = 1
colorscheme edge

"let NERDTreeQuitOnOpen=1 //Sirve para cerrar nerdtree cuando abrimos un
"archivo

let mapleader=" " "Para establecer el espacio como tecla lider para ejecutar comandos 

" Reconfiguracion de teclas
nmap <Leader>f <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
