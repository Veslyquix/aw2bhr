	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018984
sub_08018984: @ 0x08018984
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080189AC @ =gUnknown_030032D8
	ldrh r0, [r0]
	cmp r0, #0xc
	bne _080189B4
	ldr r2, _080189B0 @ =gUnknown_0200C528
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	b _080189B6
	.align 2, 0
_080189AC: .4byte gUnknown_030032D8
_080189B0: .4byte gUnknown_0200C528
_080189B4:
	movs r0, #0
_080189B6:
	bx lr

