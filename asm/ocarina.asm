// Place hook in the Zeffa appearance check routine
.org 0x0809CF90
	ldr	r0,=sub_ocarina_check|1
	bx	r0
	.pool
