	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038434
sub_08038434: @ 0x08038434
	push {r4, lr}
	movs r3, #0
	movs r1, #0
	ldr r2, _08038470 @ =gUnknown_0200C420
	ldr r0, [r2, #0x38]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	beq _08038462
	adds r4, r2, #0
	adds r4, #0xa0
_0803844A:
	adds r1, #1
	ldrh r0, [r2, #0x3a]
	lsrs r0, r0, #4
	adds r3, r3, r0
	adds r2, #4
	cmp r2, r4
	bgt _08038462
	ldr r0, [r2, #0x38]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	bne _0803844A
_08038462:
	adds r0, r3, #0
	bl Div
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08038470: .4byte gUnknown_0200C420

