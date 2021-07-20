# hfs-boot
GS/OS Boot block + loader for HFS

See [releases](https://github.com/ksherlock/hfs-boot/releases) for a bootable disk image.



Limitations:

* Boot volume must use 512 byte allocation blocks (ie, max size is 32MB. This limit should be removed at some point)
* All file data / catalog data needs to be in the first 3 extents (no overflow extent checking)
* The HFS FST caches the volume block count before GS/OS knows what it is. This causes display issues in
Finder, etc.  This could be fixed by the FST using the volume size information from the Master Directory Block or GS/OS
querying the device block count sooner.

More Information:
* [Inside Macintosh: Files, Chapter 2 - File Manager](https://developer.apple.com/library/archive/documentation/mac/Files/Files-72.html)
* [Technical Note TN1150 - HFS Plus Volume Format](https://developer.apple.com/library/archive/technotes/tn/tn1150.html)
