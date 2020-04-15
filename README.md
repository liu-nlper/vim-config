## VIM配置

整理ubuntu下vim的配置。

### 1. Vundle - vim插件管理器

Vundle下载：

    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

下载完成后，还需配置`.vimrc`文件：

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

### 2. 插件

在`.vimrc`中添加以下内容，打开vim并执行`:BundleInstall`安装插件。

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

### 3. 配置python自动补全

在`.vimrc`文件中添加`Bundle 'Valloric/YouCompleteMe'`，并执行`:BundleInstall`安装插件。

安装YouCompleteMe：

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh

若安装失败，则可能是环境没有配置正确：`sudo apt-get install python2.7-dev`。

### 4. 配置airline

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

注：需要安装[powerline](https://github.com/powerline/fonts)字体，才能正常显示箭头符号。

### 5. 配置主题

下载[`solarized.vim`](https://github.com/altercation/vim-colors-solarized)主题配置文件，放置在`~/.vim/colors/`下，并在`.vimrc`文件中添加以下内容：

    " 设置主题 Solarized
    let python_highlight_all=1
    syntax on
    syntax enable
    let g:solarized_termcolors=256
    set t_Co=256
    set background=dark
    " set background=light
    " colorscheme solarized

### updating...
