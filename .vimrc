" no need for old vi comapatibility 
set nocompatible

" setup Leader
let mapleader = ","
let g:mapleader = ","

" autopath load setup
filetype off                    " force reloading *after* pathogen loaded
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on       " enable detection, plugins and indenting in

let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree by default
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Setup javascript refactoring 

function! Refactor()
    call inputsave()
    let @z=input("What do you want to rename '" . @z . "' to? ")
    call inputrestore()
endfunction

" Locally (local to block) rename a variable
nmap <Leader>rf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x


let g:molokai_original = 1
au InsertLeave * hi Cursor guibg=green
au InsertEnter * hi Cursor guibg=green

" ctag cmd path for taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" better split window switch
set wmh=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <Leader>l <C-w>w
nmap <Leader>r <C-w>r

" Basic editor tweaks
set visualbell
au FocusLost * silent! wa
set history=1000
set wildmenu
set wildmode=list:longest
set ignorecase 
set smartcase
set title
set scrolloff=3
set ruler

" save all temp files at one place
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" soft/hard tabs width
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" indentation and autocmplete
set cindent
set smartindent
set autoindent
filetype plugin on
set ofu=syntaxcomplete#Complete
set nu
  
noremap <c-tab> :tabnext<cr> 
inoremap <C-Space> <C-N>
inoremap <C-@> <C-N>
nmap <F4> :w<CR>:make<CR>:cw<CR>

" Git setup
nmap <Leader>gd :GitDiff<cr>
nmap <Leader>gD :GitDiff –cached<cr>
nmap <Leader>gs :GitStatus<cr>
nmap <Leader>gl :GitLog<cr>
nmap <Leader>ga :GitAdd<cr>
nmap <Leader>gA :GitAdd <cfile><cr>
nmap <Leader>gc :GitCommit<cr>


"Pretty XML
function! DoPrettyXML()
  silent %!xmllint --format --nowarning -
  1d
endfunction
command! PrettyXML call DoPrettyXML()

