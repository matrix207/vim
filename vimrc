""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"         Dennis
"         http://matrix207.github.com
"
" Version: 
"         1.8 - 26/09/2015 00:09:00
"
" Blogversion: 
"         https://github.com/matrix207/vimrc
"
" History:
"         2015/09/25 Dennis  Add highlight
"         2014/07/07 Dennis  Auto add file title when create new file
"         2014/06/23 Dennis  use clang-complete and change dictionary file
"         2014/06/19 Dennis  Fix dictionary path error
"         2014/06/18 Dennis  Automatically syntax highlight Markdown files 
"         2013/07/31 Dennis  forbid clang auto-compile, restore ctag, and update cscope
"         2013/07/05 Dennis  use clang-complete instead Omni plugin
"         2013/04/16 Dennis  Add plugin AutoComplPop.vim and snipMate.vim
"         2012/12/29 Dennis  Create
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 影响全部用户的配置:
" 插件 *.vim 拷贝到 /usr/share/vim/vim73/plugin/
" 文档 *.txt 拷贝到 /usr/share/vim/vim73/doc/
" 影响当前用户的配置:
" 插件 *.vim 拷贝到 ~/.vim/plugin/
" 文档 *.txt 拷贝到 ~/.vim/doc/
"
" 中文在线帮助
" http://man.chinaunix.net/newsoft/vi/doc/help.html
"
" 更多参考
" http://blog.csdn.net/wooin/article/details/1858917
" https://github.com/easwy/share/blob/master/vim/vimrc/_vimrc
"
" vimrc 语法相关
" help key-notation
" <CR>  回车
" <up> <left> <right> <down> 方向键
" <Esc>
" <C-x> 表示 Ctrl+x
" <S-x> 表示 Shift+x
" <Tab>
" <M-x> Alt+x
" <A-x> Alt+x
" iab 插入模式的缩写
" imap 插入模式的键映射
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"常规设置

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 字体
if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Inconsolata\ 12
	set guifont=Liberation\Mono\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"语言设置
set helplang=cn
set encoding=utf8 
set langmenu=zh_CN.UTF-8 
set imcmdline 
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim

"语法高亮
syntax enable
syntax on
colorscheme desert
" :hi List all the current highlight groups
" :so $VIMRUNTIME/syntax/hitest.vim
" vim.vim example of the syntax
hi DTSGroup term=bold cterm=bold,underline ctermfg=Cyan guifg=#80a0ff gui=bold
hi def link M7Group Todo
syn match M7Group "FixMe"
syn match Todo "\<TODO\>"
syn match DTSGroup "\<DTS\d\{8}\>"
autocmd FileType c,cpp match Error /\s\+$/ | 2match Error /\t/

set wildignore=*.o,*~,*.pyc

set number

set autochdir

set tags=tags

set hlsearch

"set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set tabstop=4 softtabstop=4 shiftwidth=4
" using 4 spaces instead of Tab key
"set et ts=4 sw=4

set nowrap
set nobackup

" default <Leader> map backslash
:let mapleader = ","

"分割为两行
:nnoremap K i<CR><Esc>

:set colorcolumn=81

"全选
"map <C-a> ggVG

"自动对齐
set autoindent 

" 开始折叠
set foldenable
" 设置语法折叠
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
set foldmethod=indent
"折叠相关的快捷键
"zR 打开所有的折叠
"za Open/Close (toggle) a folded group of lines.
"zA Open a Closed fold or close and open fold recursively.
"zi 全部 展开/关闭 折叠
"zo 打开 (open) 在光标下的折叠
"zc 关闭 (close) 在光标下的折叠
"zC 循环关闭 (Close) 在光标下的所有折叠
"zM 关闭所有可折叠区域
" 设置折叠区域的宽度
set foldcolumn=0
" 设置折叠层数为
setlocal foldlevel=1
" 新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable


" splite
" 横向划分
nmap <Leader>h :spl<CR>
" 竖向划分
nmap <Leader>v :vspl<CR>
" 加宽
nmap + <C-W>+
" 减宽
nmap - <C-W>-

map <leader>y "+y
map <leader>p "+gP

" 刷新文件
" :e

"设置文件默认语法格式
au BufferRead,BufferWrite file *.md set filetype=markdown

" 设置代码自动补全快捷键(这些方法在插件中已经实现)
"设置文件头
:iab ihead <Esc>ggO/*<CR>Copyleft(c) 2012-2013 <CR>Authored by Dennis on:<Esc>:
	\ read !date <CR>kJ$a<CR>@desc:<CR>@history<CR>/<Esc>

"插入日期和时间
:iab idate A<C-R>=strftime("%c")<CR><Esc>

"c框架frame
:iab ifc  #include <stdio.h><CR><CR>int main(int argc, char* argv[])<CR>{<CR>
	\ <Tab>return 0;<CR>}<Esc>2<up>
"c++框架frame
:iab ifcpp #include <iostream><CR>using namespace std;<CR><CR>int main(int argc,
	\ char* argv[])<CR>{<CR><Tab>return 0;<CR>}<Esc>2<up>

:iab iif if ()<CR>{<CR>}<Esc>2<UP>f)i
:iab FF for(int i=0; i<; i++)<CR>{<CR>}<Esc>2<UP>f<a
:iab iswitch switch()<CR>{<CR><Tab>case :<CR><Tab>break;<CR><Tab>default :<CR>
	\ <Tab>break;<CR>}<Esc>7<UP>f)i

filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ctags 定位变量、宏和函数的定义
"yum install ctags
"ctags -R
":set tags=/home/***/tags
"<C-]> 定位到定义处 <C-T>返回
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/system

" build tags with Ctrl-F12
"--c++-kinds=+p  : 为C++文件增加函数原型的标签
"--fields=+iaS   : 在标签文件中加入继承信息(i)、
"                  类成员的访问控制信息(a)、以及函数的指纹(S)
"--extra=+q      : 为标签增加类修饰符。注意，如果没有此选项，将不能对类成员补全
map <C-F12> :!ctags -R -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"clang-complete
"c/c++自动补全插件
"https://github.com/Rip-Rip/clang_complete 
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_user_options='-stdlib=libstdc++ -std=c++11 -I/usr/include'
let g:neocomplcache_enable_at_startup = 1  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"echofunc.vim 
let g:EchoFuncShowOnStatus = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TagList 高效浏览源码
"http://www.vim.org/scripts/script.php?script_id=273
":Tlist 打开

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"WinManager
"http://www.vim.org/scripts/script.php?script_id=95
"wm 关闭/打开netrw和TagList窗口
":help winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
"刷新目录信息 :e .

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
" yum install cscope
" cscope -Rb
" :cscope add ../cscope.out
" (type ":help :cscope" in vim to show help)
" from http://vim.wikia.com/wiki/Autoloading_Cscope_Database 
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

" s symbol
" g definition
" d called
" c calling
" t text
" e grep
" f file
" i #include this file
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

:set cscopequickfix=s-,c-,d-,i-,t-,e-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix (已是标准,不用单独安装)
" :help quickfix
" :cw 打开 quickfix窗口
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MiniBufExplorer 快速浏览和操作Buffer
"http://www.vim.org/scripts/script.php?script_id=159
"<C-Tab> 向前循环切换到每个buffer上,并在当前窗口打开
"<C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开
let g:miniBufExplMapCTabSwitchBufs = 1
"用<C-h,j,k,l>切换到上下左右的窗口
let g:miniBufExplMapWindowNavVim = 1
"用<C-箭头键>切换到上下左右窗口中去
"let g:miniBufExplMapWindowNavArrows = 1
"设定自动开启MiniBufExplorer的文件数目
let g:miniBufExplorerMoreThanOne=2
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>
map <leader>b :MiniBufExplorer<cr>
map <leader>c :CMiniBufExplorer<cr>
map <leader>u :UMiniBufExplorer<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"c/h文件间相互切换 -- 插件: A
"http://www.vim.org/scripts/script.php?script_id=31
":A :AS横向窗口 :AV纵向窗口 :AT新建标签
nnoremap <silent> <F12> :A<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Grep 在工程中查找
"http://www.vim.org/scripts/script.php?script_id=311
"nnoremap <silent> <F3> :Grep<CR>

nnoremap <silent> <F3> :vimgrep <cword>  *.h *.c <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"close error window
nnoremap <silent> <F4> :cclose <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动补全
":help complete
"Ctrl+P 向前切换成员
"Ctrl+N 向后切换成员
"Ctrl+E 表示退出下拉窗口, 并退回到原来录入的文字
"Ctrl+Y 表示退出下拉窗口, 并接受当前选项
"Ctrl+X Ctrl+L 整行补全
"Ctrl+X Ctrl+N 根据当前文件里关键字补全
"Ctrl+X Ctrl+K 根据字典补全
"Ctrl+X Ctrl+T 根据同义词字典补全
"Ctrl+X Ctrl+I 根据头文件内关键字补全
"Ctrl+X Ctrl+] 根据标签补全
"Ctrl+X Ctrl+F 补全文件名
"Ctrl+X Ctrl+D 补全宏定义
"Ctrl+X Ctrl+V 补全vim命令
"Ctrl+X Ctrl+U 用户自定义补全方式
"Ctrl+X Ctrl+S 拼写建议

" dictionary
" http://www.vim.org/scripts/script.php?script_id=195
" tar xvf ~/Downloads/engspchk.tar.gz CVIMSYN/engspchk.dict
" English Wordlists 
" http://www-01.sil.org/linguistics/wordlists/english/ 

setlocal dictionary+=~/.vim/dict/wordsEn.txt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码自动提示 AutoComplPop 
"http://www.vim.org/scripts/script.php?script_id=1879
"代码模板补全 snipMate 
"http://www.vim.org/scripts/script.php?script_id=2540

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"注释代码
"注释 vimrc, 符号"
"nmap <C-M>v :s/^\("\)*/"/g<CR>:nohl<CR>
nmap <C-M>v :s/^/"/g<CR>:nohl<CR>
nmap <S-M>v :s/^\("\)//g<CR>:nohl<CR>
"vmap <C-M>v :s/^\("\)*/"/g<CR>:nohl<CR>
vmap <C-M>v :s/^/"/g<CR>:nohl<CR>
vmap <S-M>v :s/^\("\)//g<CR>:nohl<CR>
"注释 c/c++, 符号//
nmap <C-M>c :s#^\(//\)*#//#g<CR>:nohl<CR>
nmap <S-M>c :s#^\(//\)##g<CR>:nohl<CR>
vmap <C-M>c :s#^\(//\)*#//#g<CR>:nohl<CR>
vmap <S-M>c :s#^\(//\)##g<CR>:nohl<CR>
"注释 shelc, 符号#
nmap <C-M>s :s@^\(#\)*@#@g<CR>:nohl<CR>
nmap <S-M>s :s@^\(#\)@@g<CR>:nohl<CR>
vmap <C-M>s :s@^\(#\)*@#@g<CR>:nohl<CR>
vmap <S-M>s :s@^\(#\)@@g<CR>:nohl<CR>
"注释 batch, 符号::
nmap <C-M>b :s/^\(::\)*/::/g<CR>:nohl<CR>
nmap <S-M>b :s/^\(::\)//g<CR>:nohl<CR>
vmap <C-M>b :s/^\(::\)*/::/g<CR>:nohl<CR>
vmap <S-M>b :s/^\(::\)//g<CR>:nohl<CR>

" Blue:
"      classes structures typedefs interfaces namespaces
" Gray:
"	   variables
" Purple:
"      preprocessor macros
" Red:
"	   methods
" White:
"      comment
" Green:
"      

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically syntax highlight Markdown files
au BufRead,BufNewFile *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto add file title when create new file
autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 

func SetComment()
    call setline(1,"/*===============================================================") 
    call append(line("$"), " * Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line("$"), " * ") 
    call append(line("$"), " * 文件名称：".expand("%:t")) 
    call append(line("$"), " * 创 建 者：Matrix207")
    call append(line("$"), " * 创建日期：".strftime("%Y年%m月%d日")) 
    call append(line("$"), " * 描    述：") 
    call append(line("$"), " *")
    call append(line("$"), " * 更新日志：") 
    call append(line("$"), " *") 
    call append(line("$"), " ================================================================*/") 
endfunc

func SetTitle()
    call SetComment()
    if expand("%:e") == 'hpp' 
	 call append(line("$"), "#ifndef _".toupper(expand("%:t:r"))."_H_") 
	 call append(line("$"), "#define _".toupper(expand("%:t:r"))."_H_") 
	 call append(line("$"), "#ifdef __cplusplus") 
	 call append(line("$"), "extern \"C\"") 
	 call append(line("$"), "{") 
	 call append(line("$"), "#endif") 
	 call append(line("$"), "") 
	 call append(line("$"), "#ifdef __cplusplus") 
	 call append(line("$"), "}") 
	 call append(line("$"), "#endif") 
	 call append(line("$"), "#endif /* _".toupper(expand("%:t:r"))."_H_ */")
    elseif expand("%:e") == 'h' 
	 "call append(line("$"), "#pragma once") 
	 call append(line("$"), "#ifndef _".toupper(expand("%:t:r"))."_H_") 
	 call append(line("$"), "#define _".toupper(expand("%:t:r"))."_H_") 
	 call append(line("$"), "") 
	 call append(line("$"), "") 
	 call append(line("$"), "") 
	 call append(line("$"), "#endif /* _".toupper(expand("%:t:r"))."_H_ */")
    elseif &filetype == 'c' 
	 call append(line("$"), "#include \"".expand("%:t:r").".h\"") 
    elseif &filetype == 'cpp' 
	 call append(line("$"), "#include \"".expand("%:t:r").".h\"") 
    endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto add file title when create new file
autocmd BufNewFile Makefile exec ":call InitMakefile()" 

func MakefileComment()
    call setline(1,"#################################################################") 
    call append(line("$"), "# Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line("$"), "# ") 
    call append(line("$"), "# 文件名称：".expand("%:t")) 
    call append(line("$"), "# 创 建 者：Matrix207")
    call append(line("$"), "# 创建日期：".strftime("%Y年%m月%d日")) 
    call append(line("$"), "# 描    述：") 
    call append(line("$"), "#")
    call append(line("$"), "# 更新日志：") 
    call append(line("$"), "#") 
    call append(line("$"), "##################################################################") 

endfunc

" FIX: Should replace the four space key with TAB key
func InitMakefile()
	call MakefileComment()
	call append(line("$"), "CC     = gcc") 
	call append(line("$"), "FLAG   = -Wall") 
	call append(line("$"), "SRC    = ") 
	call append(line("$"), "OBJ    =$(SRC:.c=.o) ") 
	call append(line("$"), "LIB    = ") 
	call append(line("$"), "TARGET = ") 
	call append(line("$"), "") 
	call append(line("$"), "all:$(TARGET)") 
	call append(line("$"), "") 
	call append(line("$"), "$(TARGET):$(OBJ)") 
	call append(line("$"), "    $(CC) -o $@ $^ $(LIB)") 
	call append(line("$"), "")
	call append(line("$"), ".PHONY:clean")
	call append(line("$"), "clean:")
	call append(line("$"), "    rm -f $(OBJ) $(TARGET)")
endfunc
