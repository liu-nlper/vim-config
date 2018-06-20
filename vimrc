set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Bundle 'Valloric/YouCompleteMe'

" python sytax checker
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'

" ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" 检索文件
Plugin 'kien/ctrlp.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" airline
let g:airline_powerline_fonts = 1
set t_Co=256
set laststatus=2
" 打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
" 我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#buffer_nr_show=1
" 设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 设置主题 Solarized
let python_highlight_all=1
syntax on
syntax enable
let g:solarized_termcolors=256
set t_Co=256
set background=dark
" set background=light
" colorscheme solarized

set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=99
set expandtab
set fileformat=unix
" set incsearch
set showcmd
" set wildmenu
set smartindent
set mouse=a
set cursorline  " 高亮当前行
set backspace=indent,eol,start
" set cursorcolumn

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree 树形，目录
" 设置快捷键
map <F5> :NERDTreeToggle<CR>
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tagbar
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" syntastic
" let g:syntastic_check_on_open = 1
let g:syntastic_python_python_exe='python3'
let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_aggregate_errors=1
"autocmd BufWritePost *.py call Flake8()

" youcompleteme
let g:ycm_python_binary_path='/usr/bin/python3.4'
let g:SimplyFold_docstring_preview=1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" 一键执行python代码
map <F8> :w<cr>:!python3 %<cr>
map <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'cpp'
        exec "!g++ -std=c++11 % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc
" py文件头
autocmd bufnewfile *.py call HeaderPython()
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- encoding: utf-8 -*-")
    normal G
    normal o
    normal o
endf
" sh文件头
autocmd bufnewfile *.sh call HeaderShell()
function HeaderShell()
    call setline(1, "#!/bin/bash")
    normal G
    normal o
    normal o
endf