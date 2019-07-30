"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" Git integration
Plug 'tpope/vim-fugitive'

" Colorscheme
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'

"Go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'SirVer/ultisnips'
call plug#end()

""""""""""""
" Settings "
""""""""""""
let mapleader = ","
let g:python3_host_prog = "~/.venv/neovim/bin/python"

set termguicolors

set number
set listchars=tab:▸\ ,eol:¬
set list
set hidden
set noshowmode

set splitbelow
set splitright

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" CoC https://github.com/neoclide/coc.nvim
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Use [c and ]c to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Act like D and C
nnoremap Y y$

" NeoVim Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Use ripgrep instead of vimgrep
set grepprg=rg\ -H\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m

" Enter automatically into the files directory
"autocmd BufEnter * silent! lcd %:p:h

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" one
set background=dark
let g:onedark_terminal_italics = 1
colorscheme onedark

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'onedark'

" netrw
let g:netrw_altv = 1
"let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" vim-go
let g:go_autodetect_gopath = 0
let g:go_def_mode = "gopls"
let g:go_fmt_command = "goimports"
let g:go_info_mode = "gopls"
let g:go_list_type = "quickfix"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType go nmap <C-g> :GoDeclsDir<CR>
  autocmd FileType go imap <C-g> <ESC>:<C-u>:GopDeclsDir<CR>
" autocmd FileType go nmap <Leader>b :<C-u>call <SID>build_go_files()<CR>
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
