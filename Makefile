

bootblock : bootblock.omf hfs.po
	mpw makebiniigs -s -org 2048 bootblock.omf -o bootblock 
	dd bs=512 if=bootblock of=hfs.po conv=notrunc oseek=0


bootblock.omf : bootblock.obj
	mpw linkiigs bootblock.obj -o bootblock.omf

bootblock.obj : bootblock.aii hfs.aii
	mpw asmiigs bootblock.aii -o bootblock.obj


.PHONY: clean
clean:
	$(RM) bootblock bootblock.omf bootblock.obj

hfs.po:
	mkfs-profuse --fst=hfs --size=800k --name="hfs boot" hfs.po
