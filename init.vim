"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Git support
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Colors
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

"Go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()


""""""""""""
" Settings "
""""""""""""
set cursorcolumn
set cursorline
set hlsearch
set noerrorbells

set ignorecase
set smartcase

set number
set listchars=tab:▸\ ,eol:¬
set showbreak=…

set hidden
set noshowmode

set splitbelow
set splitright

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set termguicolors
set laststatus=2
colorscheme onedark


""""""""""""
" Mappings "
""""""""""""
let mapleader = ","

" Act like D and C
nnoremap Y y$

" NeoVim Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

map <C-n> :NERDTreeToggle<CR>


"""""""""""
" Plugins "
"""""""""""
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'onedark'

" Use ripgrep instead of vimgrep
set grepprg=rg\ -H\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" vim-go
let g:go_autodetect_gopath = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
