	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AFB0
sub_0804AFB0: @ 0x0804AFB0
	ldr r0, _0804AFC4 @ =gUnknown_030044E0
	ldr r0, [r0]
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804AFC2
	ldr r1, _0804AFC8 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
_0804AFC2:
	bx lr
	.align 2, 0
_0804AFC4: .4byte gUnknown_030044E0
_0804AFC8: .4byte gUnknown_03002F1C

