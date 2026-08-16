	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A5B0
sub_0801A5B0: @ 0x0801A5B0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0801A5D8 @ =gUnknown_030030B4
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _0801A5DC @ =0x06006C00
	adds r0, r0, r1
	bl sub_0802D5B8
	adds r0, r4, #0
	bl sub_0801A548
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A5D8: .4byte gUnknown_030030B4
_0801A5DC: .4byte 0x06006C00

