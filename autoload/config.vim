func! config#csupdate() abort
   :execute "!pwd | xargs -I args find args -name \"*.c\" -o -name \"*.cpp\" -o -name \"*.h\" >> cscope.files"
   :execute "cs kill 0"
   :execute "!cscope -Rbq -i cscope.files"
   :execute "cs add cscope.out"
endf

func! config#before() abort
    let g:spacevim_autocomplete_method = "deoplete"

    "粘贴后不将剪贴板内容覆盖
    xnoremap p "_dP

    "ale config
    let g:ale_linters = {'c': ['gcc', 'cppcheck'], 'c++': ['g++','cppcheck']}
    let g:ale_c_parse_makefile = 1
    "let g:ale_history_enabled = 1

    "碰到MakeFile文件自动将tab才能够空格改回tab
    autocmd FileType makefile set noexpandtab


    "设置newovim的python路径
    let g:python3_host_prog = '/usr/bin/python3'

    "设置shell
    tnoremap <ESC> <C-W>N
    tnoremap <ESC><ESC> <C-W>N
    set timeout timeoutlen=1000
    set ttimeout ttimeoutlen=100

    "设置折叠
    set fdm=indent
    set foldlevelstart=99
    "加载符号文件
    :execute "cscope add  cscope.out"

    "关闭ycm_conf询问
    let g:ycm_confirm_extra_conf = 0

    "设置终端鼠标可复制
    set mouse=r
    call SpaceVim#custom#SPC('nore', [ 'f',  '/'],'Leaderf file', 'search file', 1)

    "设置.h为c文件
    au BufRead,BufNewFile *.h set filetype=c
 endf

 func! config#after() abort
   set tabstop=4
   set shiftwidth=4
   set softtabstop=4
   set autoindent
   set expandtab 
   let g:ycm_global_ycm_extra_conf='/etc/ycm/cpp/ycm_conf.py'
   let g:ycm_server_python_interptreter='/usr/lib/python3.5'

   nnoremap <C-g> :YcmCompleter GoTo <C-R>=expand("<cword>")<CR><CR>zz
   nnoremap <C-d> <C-g>:cscope find g  <C-R>=expand("<cword>")<CR><CR>zz
   inoremap <C-d> <ESC>:YcmCompleter GoTo <C-R>=expand("<cword>")<CR><CR>zz
   nnoremap <C-f> :FlyGrep<CR>
   inoremap <C-f> :FlyGrep<CR>
   nnoremap <f4> :call config#csupdate()<CR> 
   "设置alt l 为进入normal模式并保存
   inoremap l <ESC>:w<CR>

   nnoremap J 13j
   nnoremap K 13k
   nnoremap H 8h
   nnoremap L 8l
   set norelativenumber
 endf



