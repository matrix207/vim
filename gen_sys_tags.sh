#!/bin/sh
################################################################################
# generate system tags file
# History:
#       2013/04/16 Dennis  Create
#       2013/04/17 Dennis  generate tags of all header files except boost
################################################################################

system_file=`mktemp	tmp.XXXXXXXXXX`
out_file=system

#find /usr/include -maxdepath 1 -name "*.h" >$system_file  2>/dev/null
#find /usr/include/linux/       -name "*.h" >>$system_file 2>/dev/null
#find /usr/include/bits/        -name "*.h" >>$system_file 2>/dev/null
#find /usr/include/asm/         -name "*.h" >>$system_file 2>/dev/null
#find /usr/include/sys/         -name "*.h" >>$system_file 2>/dev/null
#find /usr/include/arpa/        -name "*.h" >>$system_file 2>/dev/null
#find /usr/include/netinet/     -name "*.h" >>$system_file 2>/dev/null
find /usr/include/ -path /usr/include/boost -prune -o -name '*.h' -print >$system_file

ctags -R -I __THROW --c++-kinds=+p --fields=+iaS --extra=+q -L $system_file -f $out_file
#ctags -R -I --c++-kinds=+p --fields=+iaS --extra=+q -L $system_file -f $out_file

rm -f $system_file

mkdir -p ~/.vim/tags

mv $out_file ~/.vim/tags/$out_file
