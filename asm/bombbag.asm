// Place hook in the shop's object loading routine
.org 0x804EBB6
	bne	hook_bomb_bag_check

.org 0x804EBC0
hook_bomb_bag_check:
	ldr	r1,=sub_bomb_bag_check|1
	bx	r1
	.pool


// Place hook in the purchase flag set routine
.org 0x8064DF8
hook_flag_set:
	ldr	r1,=sub_flag_set|1
	bx	r1
	.pool


// Shop data for the big bomb bag
.org 0x80FD1D0
	.dw	600
	.dh	0x2C25
	.db	0x63,0x05


// Re-point shop text table pointers to free space
// so that more entries can be added
.org 0x89AEB60+0x2C*4
ptr_text_en:
	.dw	table_text_en-0x89AEB60

.org 0x89F7420+0x2C*4
ptr_text_fr:
	.dw	table_text_fr-0x89F7420

.org 0x8A3EEB0+0x2C*4
ptr_text_de:
	.dw	table_text_de-0x8A3EEB0

.org 0x8A81E70+0x2C*4
ptr_text_es:
	.dw	table_text_es-0x8A81E70

.org 0x8AC37A0+0x2C*4
ptr_text_it:
	.dw	table_text_it-0x8AC37A0
