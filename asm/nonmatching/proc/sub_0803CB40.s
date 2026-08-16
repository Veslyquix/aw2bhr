	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CB40
sub_0803CB40: @ 0x0803CB40
	adds r3, r0, #0
	cmp r1, #0
	beq _0803CB5C
	ldr r0, _0803CB58 @ =gUnknown_030033F4
	asrs r2, r3, #3
	adds r2, r2, r0
	movs r0, #1
	lsls r0, r3
	ldrb r1, [r2]
	orrs r0, r1
	b _0803CB6A
	.align 2, 0
_0803CB58: .4byte gUnknown_030033F4
_0803CB5C:
	ldr r0, _0803CB70 @ =gUnknown_030033F4
	asrs r2, r3, #3
	adds r2, r2, r0
	movs r1, #1
	lsls r1, r3
	ldrb r0, [r2]
	bics r0, r1
_0803CB6A:
	strb r0, [r2]
	bx lr
	.align 2, 0
_0803CB70: .4byte gUnknown_030033F4

