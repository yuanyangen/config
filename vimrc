" Plug Scripts-----------------------------
function! InitPlugManager()
    let neobundle_readme=expand('~/.vim/autoload/plug.vim')
    if !filereadable(neobundle_readme)
        echo "Installing vim-plug..."
        echo ""
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
endfun

call InitPlugManager()

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/indentLine' " 缩进线
Plug 'thirtythreeforty/lessspace.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale' " 动态检查错误 lint
"Plug 'ludovicchabant/vim-gutentags' "自动生成tag
Plug 'mhinz/vim-signify' "左侧diff出修改与git之间的差别
"Plug 'maralla/completor.vim'
"Plug 'davidhalter/jedi-vim' " python 的静态语言分析与跳转
Plug 'vim-scripts/indentpython.vim'
Plug 'tell-k/vim-autopep8'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 文件切换，模糊搜索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 模糊搜索
Plug 'skywind3000/asyncrun.vim' "异步执行任务
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'vim-vdebug/vdebug'
call plug#end()

function InitDeoplete()
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
endfun
call InitDeoplete()

function InitJedi()
    "Completion <C-Space>
    "Goto assignments <leader>g (typical goto function)
    "Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
    "Show Documentation/Pydoc K (shows a popup with assignments)
    "Renaming <leader>r
    "Usages <leader>n (shows all the usages of a name)
    "Open module, e.g. :Pyimport os (opens the os module)
    echo "jedi use default config"
endfun
"call InitJedi()

function! InitAle()
    let g:ale_completion_enabled = 1
    let g:ale_emit_conflict_warnings = 0
endfun

call InitAle()

function! InitGutentags()
    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags

    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 检测 ~/.cache/tags 不存在就新建
    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif
endfun

"call InitGutentags()


function! CommonInit()
    set nowrap
    "自动选择编码方式,从左到右依此选择
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1
    set termencoding=utf-8
    set encoding=utf-8

    "设置保存php文件的时候, 将文件的编码保存为utf8
    "autocmd BufReadPost *.php :set fileencoding utf8
    "如果需要转换格式, 只需要执行: set fenc utf8

    "设置终端256色效果显示，有这个才能使各个主题的颜色正常
    set background=dark
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
    "set laststatus=0
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
    "设置跳回上次文件使用位置
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "map <C-[> :e# <CR>
endfunc
call CommonInit()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置NERDTree的快捷键为ctrl + n, 打开左侧的树状文件夹浏览器
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='cool'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置开启ConqueGdb 的快捷方式是\g
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <Leader>g :ConqueGdb


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""基于特定文件类型的配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype go call GoConfig()
autocmd filetype php call PhpConfig()
autocmd filetype python call PythonConfig()


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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python相关配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PythonConfig()
    let python_highlight_all=1
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "配置F5为使用python执行当前正在编辑的文件
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "nnoremap <F5> :! python % <CR>
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
