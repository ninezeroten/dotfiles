syntax on
set number relativenumber
set encoding=utf-8

" leader
:let mapleader=','

" repeat backwards
:nnoremap <leader>; ,

" always use spaces
set expandtab
set tabstop=4
set shiftwidth=4

" plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tlhr/anderson.vim'
Plug 'shime/vim-livedown'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'bitc/vim-bad-whitespace'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" theme
set background=dark
set termguicolors
let g:gruvbox_contrast_dark = 'soft'
colorscheme anderson

" vimtex
let g:tex_flavor = 'latex'
let g:vimtext_view_method = 'zathura'

" nerdtree
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', 'venv$', '.egg-info$', '__pycache__$']

" window focus
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation
nnoremap <C-O> :tabnext<CR>
nnoremap <C-I> :tabprev<CR>

" split
set splitright
set splitbelow

" code folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
nnoremap <space> za

" autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" flag whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" code highlighting - not sure what this actually does?
let python_highlight_all=1

" file options
 au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

 au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
