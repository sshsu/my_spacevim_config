func! config#before() abort
    
    "ale config
    let g:ale_linters = {'c': ['gcc'], 'c++': ['g++']}
    "let g:ale_history_enabled = 1

    "碰到MakeFile文件自动将tab才能够空格改回tab
    autocmd FileType makefile set noexpandtab

    "设置语法检查ale
    let g:ale_c_parse_makefile = 1

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
 endf

 func! config#after() abort
   set tabstop=4
   set shiftwidth=4
   set softtabstop=4
   set autoindent
   set expandtab 
   let g:ycm_global_ycm_extra_conf='/etc/ycm/cpp/ycm_conf.py'
   let g:ycm_server_python_interptreter='/usr/lib/python3.5'

   nnoremap <C-g> :YcmCompleter GoTo <C-R>=expand("<cword>")<CR><CR>
   nnoremap <C-d> <C-g>:cscope find g  <C-R>=expand("<cword>")<CR><CR>
   inoremap <C-d> <ESC>:YcmCompleter GoTo <C-R>=expand("<cword>")<CR><CR>
   nnoremap <C-f> :FlyGrep<CR>
   inoremap <C-f> :FlyGrep<CR>
   
   set norelativenumber
 endf



