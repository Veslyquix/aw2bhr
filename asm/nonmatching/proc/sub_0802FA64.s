	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802FA64
sub_0802FA64: @ 0x0802FA64
	push {lr}
	ldr r0, _0802FA90 @ =gUnknown_0202575C
	movs r1, #0xa9
	strb r1, [r0]
	ldr r1, _0802FA94 @ =gUnknown_0849B018
	ldr r3, [r1]
	ldrb r1, [r3, #6]
	strb r1, [r0, #1]
	ldr r2, _0802FA98 @ =gUnknown_03003FC0
	ldrb r1, [r3, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	adds r2, #0x3e
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0802F588
	pop {r0}
	bx r0
	.align 2, 0
_0802FA90: .4byte gUnknown_0202575C
_0802FA94: .4byte gUnknown_0849B018
_0802FA98: .4byte gUnknown_03003FC0

