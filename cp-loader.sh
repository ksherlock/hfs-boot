
export dir=`mktemp -d`
profuse -orw --fst=hfs hfs24.po "$dir"
cp loader "$dir/"\!
umount "$dir"
