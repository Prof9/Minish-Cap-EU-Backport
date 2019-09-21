// Extend Eenie and Meenie's script to check the fusion result
.align 2
ext_script_eenie:
	// Skip past call command if Kinstone fusion was cancelled
	.dh	0x0005|(2<<10)	// skip command with length 2
	.dh	@@end-.

	// Mark Kinstone fusion as finished
	.dh	0x000B|(3<<10)	// subroutine call command with length 3
	.dw	0x806B73D
@@end:
	// Jump back to Eenie script
	.dh	0x0007|(3<<10)	// jump command with length 3
	.dw	hook_script_eenie_end
