// Extend Zeffa appear check routine
// to add exception for the rooftop in Cloud Tops
.align 2
sub_ocarina_check:
	push	r4,lr
	add	sp,-0x4

	// Check if the current map is the rooftop
	ldr	r0,=0x3000BF4
	ldrh	r0,[r0]
	cmp	r0,0x31
	// If so, return true (nonzero)
	beq	@@end

	// Call normal location check
	ldr	r1,=0x8052249
	mov	lr,pc
	bx	r1

@@end:
	ldr	r1,=0x809CF99
	bx	r1

	.pool
