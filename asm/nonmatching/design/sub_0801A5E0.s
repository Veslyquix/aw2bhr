	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A5E0
sub_0801A5E0: @ 0x0801A5E0
	push {lr}
	ldr r0, _0801A5FC @ =gUnknown_030030B4
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _0801A600 @ =0x06006C00
	adds r0, r0, r1
	movs r1, #0
	movs r2, #8
	bl sub_0802D5A0
	pop {r0}
	bx r0
	.align 2, 0
_0801A5FC: .4byte gUnknown_030030B4
_0801A600: .4byte 0x06006C00

