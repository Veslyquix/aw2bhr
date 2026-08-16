	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B648
sub_0801B648: @ 0x0801B648
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0801B65C @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801B660
	adds r0, r1, #0
	b _0801B666
	.align 2, 0
_0801B65C: .4byte gUnknown_0200CD0C
_0801B660:
	adds r0, r2, #0
	bl sub_0808AF00
_0801B666:
	pop {r1}
	bx r1
	.align 2, 0

