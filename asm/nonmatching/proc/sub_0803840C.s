	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803840C
sub_0803840C: @ 0x0803840C
	movs r1, #0
	ldr r2, _08038414 @ =gUnknown_0200C420
	ldr r0, [r2, #0x38]
	b _08038428
	.align 2, 0
_08038414: .4byte gUnknown_0200C420
_08038418:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x28
	bhi _08038430
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0, #0x38]
_08038428:
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	bne _08038418
_08038430:
	adds r0, r1, #1
	bx lr

