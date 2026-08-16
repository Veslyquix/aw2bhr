	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BB98
sub_0802BB98: @ 0x0802BB98
	ldr r0, _0802BBB4 @ =gUnknown_08090BC0
	ldr r1, [r0]
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #7
	bhi _0802BBBC
	ldr r2, _0802BBB8 @ =gUnknown_08090BC4
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xad
	str r0, [r1, #4]
	movs r0, #0x94
	b _0802BBC8
	.align 2, 0
_0802BBB4: .4byte gUnknown_08090BC0
_0802BBB8: .4byte gUnknown_08090BC4
_0802BBBC:
	ldr r2, _0802BBD8 @ =gUnknown_08090BC4
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #8]
	movs r0, #3
	str r0, [r1, #4]
_0802BBC8:
	str r0, [r1, #0xc]
	ldr r2, [r2]
	ldr r1, [r3]
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
	bx lr
	.align 2, 0
_0802BBD8: .4byte gUnknown_08090BC4

