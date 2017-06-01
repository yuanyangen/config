" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/vim/bundle/neobundle.vim/
  set runtimepath+=~/.config/vim/
endif

let neobundle_readme=expand('~/.config/vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('~/.config/vim/bundle'))
NeoBundle 'scrooloose/nerdtree'  
NeoBundle 'alvan/vim-php-manual'  
NeoBundle 'thirtythreeforty/lessspace.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'sukima/xmledit'
NeoBundle 'icymind/NeoSolarized'
"NeoBundle 'Valloric/YouCompleteMe', {
"     \ 'build'      : {
"        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
"        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
"        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
"        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
"        \ }
"     \ }

call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"使用鼠标
set mouse=a
set mouse-=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"编码相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动选择编码方式,从左到右依此选择
set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8


"设置保存php文件的时候, 将文件的编码保存为utf8
"autocmd BufReadPost *.php :set fileencoding utf8
"如果需要转换格式, 只需要执行: set fenc utf8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置终端256色效果显示，有这个才能使各个主题的颜色正常
"
set background=dark
colorscheme NeoSolarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim都会使用的配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置语法检查
"设置语法高亮
syntax on
"高亮显示
set showmatch
"设置显示左边的行号
set number 
"设置一个tab为4个空格
set tabstop=4 
"回车自动与上一行对齐
set expandtab 
"设置拼写检查
"set spell

set cindent shiftwidth=4     " Tab key occupy 4 spaces 

set completeopt=longest,menu     " Auto complete setting 

set autoread     " Set to auto read when a file is changed from the outside 

set nocompatible     " Use Vim defaults (much better!) 

"设置del和backspace可以删除其他行的东西，必备啊
set bs=indent,eol,start  " allow backspacing over everything in insert mode 

set viminfo='20,\"50     " read/write a .viminfo file, don't store more than 50 lines of registers 

set history=50   " keep 50 lines of command line history 

set ff=unix 

""记录历史的行数（vim最下面的一行）
set history=999

"设置制表符占4个空格大小
set tabstop=4

set shiftwidth=4

set expandtab

"智能缩进
set smartindent
"
"显示标尺
set ruler

"代码折叠
set foldmethod=marker

"搜索时一边输入一边显示效果
set incsearch

"使用C/C++语言的自动缩进方式（按o键时会自动缩进）
set cindent
"突出显示当前行
set cursorline 

"状态行
""进入文件出现提示，需要二次回车的原因是：终端宽度不够，折行了，缩小字体即可
"0表示：不显示状态行
"1表示：在两个窗口以上才显示状态行
"2表示：总是显示状态行
set laststatus=0

"根据后缀名判断文件类型，删掉后某些插件将不能使用
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置快捷键， 进行窗口宽度的缩放， 快捷键是 ctrl+shift+ 上|下|左|右
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-S-Right> :vertical res +1<CR>
map <C-S-Left> :vertical res -1<CR>
map <C-S-Up> :res +1<CR>
map <C-S-Down> :res -1<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置syntax 不检查的文件类型
"“”"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['foo', 'bar'],
                           \ 'passive_filetypes': ['java'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置NERDTree的快捷键为ctrl + n, 打开左侧的树状文件夹浏览器
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='cool'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp 实现的功能是查看最近的使用的文件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-e> :CtrlPBuffer<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap <F3> :Tab /
"nnoremap <F3> :Tab /
"inoremap <F3> :Tab /

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"一直显示状态栏
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set ruler    " show the cursor position all the time

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置开启ConqueGdb 的快捷方式是\g
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <Leader>g :ConqueGdb


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""基于特定文件类型的配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype go call GoConfig()
autocmd filetype php call PhpConfig()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置转换文件的类型为html 和phtml 主要是为了在写phtml模板的时候,
" 可以进行自动对齐
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>h :set ft=html<CR> 
map <Leader>p :set ft=phtml<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"php相关配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PhpConfig()
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "php documentro 相关配置,设定\d为生成注释 
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    noremap <Leader>d :call PhpDocSingle()<CR>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "配置F5为使用php执行当前正在编辑的文件
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    nnoremap <F5> :! php %   
endfun

"go相关配置
function! GoConfig()
    nnoremap <S-K> :Godoc<CR> 
    nnoremap <F5> <Esc>:GoRun 
    nnoremap <F4> <Esc>:GoTest  
    nmap <leader>r <Plug>(go-run)
    nmap <leader>b <Plug>(go-build)
    nmap <leader>t <Plug>(go-test)
    nmap <leader>c <Plug>(go-coverage)
    nmap <Leader>ds <Plug>(go-def-split)
    nmap <Leader>dv <Plug>(go-def-vertical)
    nmap <Leader>dt <Plug>(go-def-tab)
    nmap <Leader>gb <Plug>(go-doc-browser)
    nmap <Leader>i <Plug>(go-info)
    nmap <Leader>gd <Plug>(go-doc)
    nmap <Leader>gv <Plug>(go-doc-vertical)
    nmap <Leader>gb <Plug>(go-doc-browser)
    nmap <Leader>s <Plug>(go-implements)
    nmap <Leader>e <Plug>(go-rename)


    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    "配置F5为使用goimports格式化当前的文件
    let g:go_fmt_command = "goimports"
endfun
