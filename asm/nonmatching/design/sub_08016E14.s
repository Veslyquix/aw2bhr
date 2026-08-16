	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016E14
sub_08016E14: @ 0x08016E14
	push {r4, lr}
	bl sub_08016A14
	ldr r4, _08016E38 @ =gUnknown_02000000
	adds r0, r4, #0
	bl sub_08016B2C
	adds r2, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_0801A7D8
	bl sub_0803D48C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016E38: .4byte gUnknown_02000000

