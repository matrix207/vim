""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description: .vimrc, for fedora
" Last Change: Sat Dec 29 22:52:36 CST 2012
" Author:      dennis.cpp@gmail.com
"              more vim skill see http://matrix207.github.com
" Version:     2.0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件 *.vim 拷贝到 /usr/share/vim/vim73/plugin/
" 文档 *.txt 拷贝到 /usr/share/vim/vim73/doc/
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

"语法高亮
syntax enable
syntax on
colorscheme desert

set number

set autochdir

set tags=tags

set hlsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4

set nowrap
set nobackup

"分割为两行
:nnoremap K i<CR><Esc>

:set colorcolumn=81

:iab iif if ()<CR>{<CR>}<Esc>2<UP>f)i
:iab FF for(int i=0; i<; i++)<CR>{<CR>}<Esc>2<UP>f<a
:iab iswitch switch()<CR>{<CR><Tab>case :<CR><Tab>break;<CR><Tab>default :<CR><Tab>break;<CR>}<Esc>7<UP>f)i

"全选
map <C-a> ggVG

"自动对齐
set autoindent 

"设置文件头
:iab ihead <Esc>ggO/*<CR>Copyleft(c) 2012-2013 2<CR>Authored by Dennis on:<Esc>:read !date <CR>kJ$a2<CR> @desc:2<CR> @history<CR>*/<Esc>

"插入日期和时间
:iab idate A<C-R>=strftime("%c")<CR><Esc>

"c框架frame
:iab ifc  #include <stdio.h><CR><CR>int main(int argc, char* argv[])<CR>{<CR><Tab>return 0;<CR>}<Esc>2<up>
"c++框架frame
:iab ifcpp #include <iostream><CR>using namespace std;<CR><CR>int main(int argc, char* argv[])<CR>{<CR><Tab>return 0;<CR>}<Esc>2<up>

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
nmap ,h :spl<CR>
" 竖向划分
nmap ,v :vspl<CR>
" 加宽
nmap + <C-W>+
" 减宽
nmap - <C-W>-

" 刷新文件
" :e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ctags 定位变量、宏和函数的定义
"yum install ctags
"ctags -R
":set tags=/home/***/tags
"<C-]> 定位到定义处 <C-T>返回

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
" yum install cscope
" ctags -Rb
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
" add any database in current directory
  if filereadable("cscope.out")
  cs add cscope.out
  endif
  set csverb
endif

" s symbol
" g 
" d call
" c called
" t text
" e grep
" f file
" i include this file
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
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"c/h文件间相互切换 -- 插件: A
"http://www.vim.org/scripts/script.php?script_id=31
":A :AS横向窗口 :AV纵向窗口 :AT新建标签
nnoremap <silent> <F12> :A<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Grep 在工程中查找
"http://www.vim.org/scripts/script.php?script_id=311
"nnoremap <silent> <F3> :Grep<CR>

nnoremap <silent> <F3> :vimgrep <cword>  *.h *.c *.cpp<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动补全
":help complete
"<C-X>
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

" 字典
" http://www.vim.org/scripts/script.php?script_id=195
" tar xvf ~/Downloads/engspchk.tar.gz CVIMSYN/engspchk.dict

setlocal dictionary+=$VIMRUNTIME/dict/english.dict

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"注释代码
"注释 vimrc, 符号"
nmap <C-M>v :s/^\("\)*/"/g<CR>:nohl<CR>
nmap <S-M>v :s/^\("\)//g<CR>:nohl<CR>
vmap <C-M>v :s/^\("\)*/"/g<CR>:nohl<CR>
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

":colorscheme bandit
