.definelabel FREE_SPACE,0x8EF333C

.gba
.open ROM_IN,ROM_OUT,0x8000000

	.include "asm/bombbag.asm"
	.include "asm/eenie.asm"
	.include "asm/ocarina.asm"

.org FREE_SPACE

	.include "asm/bombbag.ext.asm"
	.include "asm/eenie.ext.asm"
	.include "asm/ocarina.ext.asm"

.close
