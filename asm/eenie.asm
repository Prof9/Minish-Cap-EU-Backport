// Place hook for Eenie and Meenie's script
.org 0x800B1E6
hook_script_eenie:
	// Jump command with length 3 to free space
	.dh	0x0007|(3<<10)
	.dw	ext_script_eenie
hook_script_eenie_end:
