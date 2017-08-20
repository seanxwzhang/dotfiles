set background=dark
let g:solarized_termcolors=256 "this is what fixed it for me
colorscheme solarized

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

let g:go_auto_type_info = 1
set updatetime=100
autocmd BufEnter * lcd %:p:h
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey60

set number
" Highlight
let g:go_autodetect_gopath = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_list_type = "quickfix"

let g:NERDTreeWinPos = "left"
let g:godef_split = 3

let g:jedi#use_splits_not_buffers = "left"
let g:winresizer_enable = 1

set clipboard=unnamed
call pathogen#helptags()

nmap <leader>p :Project %<cr>
nmap <leader>b :TagbarToggle<CR>
set winheight=30
set winminheight=5
set cmdwinheight=1
set cmdheight=1
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> < :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> > :exe "resize " . (winwidth(0) * 3/2)<CR>

nnoremap gi :GoImplements<cr>
nnoremap gr :GoReferrers
nnoremap td :TernDef<cr>
nnoremap tr :TernRefs<cr>
nnoremap tm :TernRename<cr>
set statusline+=%F
let g:airline_section_c='%F'
set foldmethod=syntax
set foldcolumn=1
set laststatus=0
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
let g:ctrlp_open_new_file = 'v'
vnoremap // y/<C-R>"<CR>
let g:pymode_rope_autoimport = 0
let g:pymode_rope = 0
