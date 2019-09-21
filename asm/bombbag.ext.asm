// Extend the shop object loading routine
// to add a check and load for the big bomb bag
.align 2
sub_bomb_bag_check:
	// Add a check and item placement call for the big bomb bag
	// If the boomerang is not available, place the bomb bag
	bne	@@place_bomb_bag
	// This BNE is used with two different CMPs from the source routine, which is
	// pretty hackish, but it works

@@place_boomerang:
	// Otherwise, place the boomerang
	ldr	r0,=0x80F4E6C
	ldr	r1,=0x804AAF9
	mov	lr,pc
	bx	r1
	b	@@end

@@place_bomb_bag:
	// Check if big bomb bag has been bought
	mov	r0,0xCD
	ldr	r1,=0x807C5F5
	mov	lr,pc
	bx	r1
	cmp	r0,0x0
	bne	@@end

	// Place big bomb bag
	ldr	r0,=data_bomb_bag
	ldr	r1,=0x804AAF9
	mov	lr,pc
	bx	r1

@@end:
	ldr	r1,=0x804EBC9
	bx	r1


// Extend the purchase flag set routine to set the flag for the big bomb bag
.align 2
sub_flag_set:
	// Add a check for the big bomb bag and set its flag when it is bought
	ldrb	r5,[r0,0x6]
	mov	r0,0x0
	mov	r9,r0

	// If bought item is the big bomb bag
	cmp	r5,0x65
	bne	@@end
	// Set r9 to the big bomb bag's flag
	mov	r1,0xCD
	mov	r9,r1

@@end:
	cmp	r5,0x66
	ldr	r1,=0x8064E01
	bx	r1

	.pool


// Object data for the bomb bag
.align 4
data_bomb_bag:
	.db	0x06,0x0F,0x02,0x65
	.dw	0
	.dh	100,64
	.fill	4
	.dw	0xFF


// Rebuild string tables in free space to add text for the big bomb bag
.align 4
table_text_en:
	// First entry needs to follow table immediately; game uses this to calculate
	// the amount of entries in the table
	.dw	data_text_en_empty-table_text_en
	// Add backwards pointers for all the normal entries
	.dw	0x89DAF1C+0x95-table_text_en
	.dw	0x89DAF1C+0xD5-table_text_en
	.dw	0x89DAF1C+0x11F-table_text_en
	.dw	0x89DAF1C+0x16C-table_text_en
	.dw	0x89DAF1C+0x1B8-table_text_en
	.dw	0x89DAF1C+0x205-table_text_en
	.dw	0x89DAF1C+0x2FF-table_text_en
	.dw	0x89DAF1C+0x350-table_text_en
	.dw	0x89DAF1C+0x396-table_text_en
	.dw	0x89DAF1C+0x3DD-table_text_en
	.dw	0x89DAF1C+0x420-table_text_en
	.dw	0x89DAF1C+0x46A-table_text_en
	.dw	0x89DAF1C+0x4BE-table_text_en
	.dw	0x89DAF1C+0x543-table_text_en
	.dw	0x89DAF1C+0x585-table_text_en
	.dw	0x89DAF1C+0x5CD-table_text_en
	.dw	0x89DAF1C+0x604-table_text_en
	.dw	0x89DAF1C+0x655-table_text_en
	.dw	0x89DAF1C+0x69B-table_text_en
	.dw	0x89DAF1C+0x72B-table_text_en
	.dw	0x89DAF1C+0x74F-table_text_en
	.dw	0x89DAF1C+0x750-table_text_en
	.dw	0x89DAF1C+0x87A-table_text_en
	.dw	0x89DAF1C+0x896-table_text_en
	.dw	0x89DAF1C+0x8DA-table_text_en
	.dw	0x89DAF1C+0x915-table_text_en
	.dw	0x89DAF1C+0x974-table_text_en
	.dw	0x89DAF1C+0x98A-table_text_en
	.dw	0x89DAF1C+0x9EB-table_text_en
	.dw	0x89DAF1C+0xA33-table_text_en
	.dw	0x89DAF1C+0xA74-table_text_en
	.dw	0x89DAF1C+0xAB8-table_text_en
	.dw	0x89DAF1C+0xAED-table_text_en
	.dw	0x89DAF1C+0xB32-table_text_en
	.dw	0x89DAF1C+0xB33-table_text_en
	.dw	0x89DAF1C+0xB94-table_text_en
	// Add an extra entry for the big bomb bag
	.dw	data_text_en-table_text_en
data_text_en_empty:
	.db	0x00
data_text_en:
	.ascii	"That ",0x02,0x01,"big bomb bag",0x02,0x00," is a real bargain",0x0A
	.ascii	"at ",0x06,0x01," Rupees.",0x0A
	.ascii	0x07,0x2C,0x14,0x00

// Repeat for all other languages
.align 4
table_text_fr:
	.dw	data_text_fr_empty-table_text_fr
	.dw	0x8A236AC+0x95-table_text_fr
	.dw	0x8A236AC+0xE3-table_text_fr
	.dw	0x8A236AC+0x117-table_text_fr
	.dw	0x8A236AC+0x151-table_text_fr
	.dw	0x8A236AC+0x1A1-table_text_fr
	.dw	0x8A236AC+0x1F4-table_text_fr
	.dw	0x8A236AC+0x2DC-table_text_fr
	.dw	0x8A236AC+0x32C-table_text_fr
	.dw	0x8A236AC+0x360-table_text_fr
	.dw	0x8A236AC+0x39C-table_text_fr
	.dw	0x8A236AC+0x3DE-table_text_fr
	.dw	0x8A236AC+0x428-table_text_fr
	.dw	0x8A236AC+0x477-table_text_fr
	.dw	0x8A236AC+0x4E9-table_text_fr
	.dw	0x8A236AC+0x532-table_text_fr
	.dw	0x8A236AC+0x581-table_text_fr
	.dw	0x8A236AC+0x5BE-table_text_fr
	.dw	0x8A236AC+0x5EF-table_text_fr
	.dw	0x8A236AC+0x63A-table_text_fr
	.dw	0x8A236AC+0x6C7-table_text_fr
	.dw	0x8A236AC+0x6EC-table_text_fr
	.dw	0x8A236AC+0x6ED-table_text_fr
	.dw	0x8A236AC+0x821-table_text_fr
	.dw	0x8A236AC+0x838-table_text_fr
	.dw	0x8A236AC+0x869-table_text_fr
	.dw	0x8A236AC+0x89F-table_text_fr
	.dw	0x8A236AC+0x8E9-table_text_fr
	.dw	0x8A236AC+0x91F-table_text_fr
	.dw	0x8A236AC+0x99E-table_text_fr
	.dw	0x8A236AC+0x9E8-table_text_fr
	.dw	0x8A236AC+0xA28-table_text_fr
	.dw	0x8A236AC+0xA78-table_text_fr
	.dw	0x8A236AC+0xAA0-table_text_fr
	.dw	0x8A236AC+0xAD8-table_text_fr
	.dw	0x8A236AC+0xAD9-table_text_fr
	.dw	0x8A236AC+0xB26-table_text_fr
	.dw	data_text_fr-table_text_fr
data_text_fr_empty:
	.db	0x00
data_text_fr:
	.ascii	"Un ",0x02,0x01,"Grand Sac de Bombes",0x02,0x00," pour ",0x06,0x01," Rubis!",0x0A
	.ascii	"Le parfait outil de l'aventurier!",0x0A
	.ascii	0x07,0x2C,0x14,0x00

.align 4
table_text_de:
	.dw	data_text_de_empty-table_text_fr
	.dw	0x8A689EC+0x95-table_text_de
	.dw	0x8A689EC+0xDC-table_text_de
	.dw	0x8A689EC+0x115-table_text_de
	.dw	0x8A689EC+0x14D-table_text_de
	.dw	0x8A689EC+0x19E-table_text_de
	.dw	0x8A689EC+0x1F2-table_text_de
	.dw	0x8A689EC+0x2DF-table_text_de
	.dw	0x8A689EC+0x332-table_text_de
	.dw	0x8A689EC+0x36A-table_text_de
	.dw	0x8A689EC+0x3B5-table_text_de
	.dw	0x8A689EC+0x400-table_text_de
	.dw	0x8A689EC+0x443-table_text_de
	.dw	0x8A689EC+0x484-table_text_de
	.dw	0x8A689EC+0x4DE-table_text_de
	.dw	0x8A689EC+0x50B-table_text_de
	.dw	0x8A689EC+0x54B-table_text_de
	.dw	0x8A689EC+0x57E-table_text_de
	.dw	0x8A689EC+0x5AA-table_text_de
	.dw	0x8A689EC+0x5F4-table_text_de
	.dw	0x8A689EC+0x678-table_text_de
	.dw	0x8A689EC+0x696-table_text_de
	.dw	0x8A689EC+0x697-table_text_de
	.dw	0x8A689EC+0x7E2-table_text_de
	.dw	0x8A689EC+0x803-table_text_de
	.dw	0x8A689EC+0x833-table_text_de
	.dw	0x8A689EC+0x865-table_text_de
	.dw	0x8A689EC+0x8B4-table_text_de
	.dw	0x8A689EC+0x8DD-table_text_de
	.dw	0x8A689EC+0x958-table_text_de
	.dw	0x8A689EC+0x997-table_text_de
	.dw	0x8A689EC+0x9E1-table_text_de
	.dw	0x8A689EC+0xA33-table_text_de
	.dw	0x8A689EC+0xA6E-table_text_de
	.dw	0x8A689EC+0xAA6-table_text_de
	.dw	0x8A689EC+0xAA7-table_text_de
	.dw	0x8A689EC+0xAE9-table_text_de
	.dw	data_text_de-table_text_de
data_text_de_empty:
	.db	0x00
data_text_de:
	// Unfortunately, "Eine Große" doesn't fit on the screen anymore.
	// Making it fit would require adding an extra text box, or removing the flavor text.
	// Both of these would be out of place, so I've left out "Ein Große" here.
	.ascii	0x02,0x01,"Bombentasche",0x02,0x00,". Das macht ",0x06,0x01," Rubine.",0x0A
	.ascii	"Eine gro",0xDF,"e Hilfe bei deinen Abenteuern.",0x0A
	.ascii	0x07,0x2C,0x14,0x00
	// ß = 0xDF

.align 4
table_text_es:
	.dw	data_text_es_empty-table_text_es
	.dw	0x8AAAB9C+0x95-table_text_es
	.dw	0x8AAAB9C+0xD9-table_text_es
	.dw	0x8AAAB9C+0x10F-table_text_es
	.dw	0x8AAAB9C+0x146-table_text_es
	.dw	0x8AAAB9C+0x19C-table_text_es
	.dw	0x8AAAB9C+0x20A-table_text_es
	.dw	0x8AAAB9C+0x2CF-table_text_es
	.dw	0x8AAAB9C+0x315-table_text_es
	.dw	0x8AAAB9C+0x34D-table_text_es
	.dw	0x8AAAB9C+0x38B-table_text_es
	.dw	0x8AAAB9C+0x3CA-table_text_es
	.dw	0x8AAAB9C+0x411-table_text_es
	.dw	0x8AAAB9C+0x44C-table_text_es
	.dw	0x8AAAB9C+0x49B-table_text_es
	.dw	0x8AAAB9C+0x4CF-table_text_es
	.dw	0x8AAAB9C+0x50D-table_text_es
	.dw	0x8AAAB9C+0x531-table_text_es
	.dw	0x8AAAB9C+0x54C-table_text_es
	.dw	0x8AAAB9C+0x5AA-table_text_es
	.dw	0x8AAAB9C+0x627-table_text_es
	.dw	0x8AAAB9C+0x646-table_text_es
	.dw	0x8AAAB9C+0x647-table_text_es
	.dw	0x8AAAB9C+0x75F-table_text_es
	.dw	0x8AAAB9C+0x77E-table_text_es
	.dw	0x8AAAB9C+0x7A6-table_text_es
	.dw	0x8AAAB9C+0x7D7-table_text_es
	.dw	0x8AAAB9C+0x818-table_text_es
	.dw	0x8AAAB9C+0x835-table_text_es
	.dw	0x8AAAB9C+0x8A7-table_text_es
	.dw	0x8AAAB9C+0x8EF-table_text_es
	.dw	0x8AAAB9C+0x929-table_text_es
	.dw	0x8AAAB9C+0x977-table_text_es
	.dw	0x8AAAB9C+0x99A-table_text_es
	.dw	0x8AAAB9C+0x9B9-table_text_es
	.dw	0x8AAAB9C+0x9BA-table_text_es
	.dw	0x8AAAB9C+0xA04-table_text_es
	.dw	data_text_es-table_text_es
data_text_es_empty:
	.db	0x00
data_text_es:
	// Same as with the German translation. I left out "más grande" here.
	.ascii	"Un ",0x02,0x01,"saco de bombas ",0x02,0x00,"cuesta ",0x06,0x01," rupias.",0x0A
	.ascii	"Es indispensable para tu aventura.",0x0A
	.ascii	0x07,0x2C,0x14,0x00

.align 4
table_text_it:
	.dw	data_text_it_empty-table_text_it
	.dw	0x8AED2FC+0x95-table_text_it
	.dw	0x8AED2FC+0xD9-table_text_it
	.dw	0x8AED2FC+0x10D-table_text_it
	.dw	0x8AED2FC+0x147-table_text_it
	.dw	0x8AED2FC+0x18C-table_text_it
	.dw	0x8AED2FC+0x1CC-table_text_it
	.dw	0x8AED2FC+0x298-table_text_it
	.dw	0x8AED2FC+0x2D4-table_text_it
	.dw	0x8AED2FC+0x304-table_text_it
	.dw	0x8AED2FC+0x344-table_text_it
	.dw	0x8AED2FC+0x387-table_text_it
	.dw	0x8AED2FC+0x3CB-table_text_it
	.dw	0x8AED2FC+0x418-table_text_it
	.dw	0x8AED2FC+0x486-table_text_it
	.dw	0x8AED2FC+0x4D2-table_text_it
	.dw	0x8AED2FC+0x51A-table_text_it
	.dw	0x8AED2FC+0x552-table_text_it
	.dw	0x8AED2FC+0x589-table_text_it
	.dw	0x8AED2FC+0x5D7-table_text_it
	.dw	0x8AED2FC+0x668-table_text_it
	.dw	0x8AED2FC+0x685-table_text_it
	.dw	0x8AED2FC+0x686-table_text_it
	.dw	0x8AED2FC+0x7E2-table_text_it
	.dw	0x8AED2FC+0x7F7-table_text_it
	.dw	0x8AED2FC+0x826-table_text_it
	.dw	0x8AED2FC+0x869-table_text_it
	.dw	0x8AED2FC+0x8C1-table_text_it
	.dw	0x8AED2FC+0x8F8-table_text_it
	.dw	0x8AED2FC+0x96D-table_text_it
	.dw	0x8AED2FC+0x9B2-table_text_it
	.dw	0x8AED2FC+0x9F7-table_text_it
	.dw	0x8AED2FC+0xA5C-table_text_it
	.dw	0x8AED2FC+0xA8D-table_text_it
	.dw	0x8AED2FC+0xAC5-table_text_it
	.dw	0x8AED2FC+0xAC6-table_text_it
	.dw	0x8AED2FC+0xB22-table_text_it
	.dw	data_text_it-table_text_it
data_text_it_empty:
	.db	0x00
data_text_it:
	.ascii	0x02,0x01,"Portabombe grande",0x02,0x00,": ",0x06,0x01," Rupie.",0x0A
	.ascii	"Con questo la vita ",0xE8," pi",0xF9," semplice!",0x0A
	.ascii	0x07,0x2C,0x14,0x00
	// è = 0xE8
	// ù = 0xF9
