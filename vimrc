" https://github.com/fatih/vim-go-tutorial/blob/master/vimrc
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'sheerun/vim-polyglot'
call plug#end()


""""""""""""
" Settings "
""""""""""""

set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection

set ttyfast                     " Indicate fast terminal conn for faster redraw
set laststatus=2                " Show status line always
"set cursorcolumn
"set cursorline
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
"set list                        " Don't show special characters
set listchars=tab:▸\ ,eol:¬     " Special characters
set showbreak=…                 " Continuation character when line is wrapped
set nowrap                      " Don't wrap long lines
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
"set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set lazyredraw                  " Wait to redraw

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Color theme: https://github.com/sonph/onehalf/tree/master/vim
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
colorscheme onehalfdark

highlight DiffAdd    ctermfg=236 ctermbg=114 guifg=#282c34 guibg=#98c379
highlight DiffDelete ctermfg=236 ctermbg=168 guifg=#282c34 guibg=#e06c75
highlight DiffChange ctermfg=236 ctermbg=180 guifg=#282c34 guibg=#e5c07b
highlight DiffText   ctermfg=168 ctermbg=180 guifg=#e06c75 guibg=#e5c07b


""""""""""""
" Mappings "
""""""""""""

let mapleader = ","

" Act like D and C
nnoremap Y y$

" Search mappings
nnoremap n nzzzv
nnoremap N Nzzzv

" QuickFix list
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" NeoVim Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Enter automatically into the files directory
"autocmd BufEnter * silent! lcd %:p:h

" fzf
nnoremap <C-p> :FZF<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

"""""""""""
" Plugins "
"""""""""""

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onehalfdark'

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType go nmap <C-g> :GoDeclsDir<CR>
  autocmd FileType go imap <C-g> <ESC>:<C-u>:GopDeclsDir<CR>
  autocmd FileType go nmap <Leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <Leader>r <Plug>(go-run)
  autocmd FileType go nmap <Leader>t <Plug>(go-test)
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  autocmd Filetype go command! -bang A  call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
