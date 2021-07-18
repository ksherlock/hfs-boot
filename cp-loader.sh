
export dir=`mktemp -d`
profuse -orw --fst=hfs hfs.po "$dir"
cp loader "$dir/"\!
umount "$dir"
