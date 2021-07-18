
.PHONY: all
all : bootblock loader

bootblock : bootblock.omf | hfs.po
	mpw makebiniigs -s -org 2048 bootblock.omf -o bootblock 
	dd bs=512 if=bootblock of=hfs.po conv=notrunc oseek=0

loader : loader.omf | hfs.po
	mpw makebiniigs -s -org 8192 loader.omf -o loader 
	sh cp-loader.sh

# bootblock.omf : bootblock.obj
# 	mpw linkiigs bootblock.obj -o bootblock.omf

bootblock.obj : bootblock.aii hfs.aii
# 	mpw asmiigs bootblock.aii -o bootblock.obj

loader.obj : loader.aii hfs.aii macros.aii



.PHONY: clean
clean:
	$(RM) bootblock bootblock.omf bootblock.obj loader loader.omf loader.obj

hfs.po:
	mkfs-profuse --fst=hfs --size=800k --name="hfs boot" hfs.po




%.obj : %.aii
	mpw asmiigs -l $< -o $@

%.omf : %.obj
	mpw linkiigs $< -o $@
