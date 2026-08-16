	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026340
sub_08026340: @ 0x08026340
	movs r2, #0
	movs r1, #1
	ldr r3, _08026364 @ =gUnknown_03003FF8
_08026346:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08026354
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08026354:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _08026346
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08026364: .4byte gUnknown_03003FF8

