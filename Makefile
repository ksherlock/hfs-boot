

bootblock : bootblock.omf
	mpw makebiniigs -org 2048 bootblock.omf -o bootblock 

bootblock.omf : bootblock.obj
	mpw linkiigs bootblock.obj -o bootblock.omf

bootblock.obj : bootblock.aii hfs.aii
	mpw asmiigs bootblock.aii -o bootblock.obj

