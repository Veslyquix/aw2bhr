	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BBA8
sub_0803BBA8: @ 0x0803BBA8
	push {lr}
	ldr r2, _0803BBC8 @ =gUnknown_0849EACC
	ldr r0, _0803BBCC @ =gUnknown_030033FC
	ldr r0, [r0]
	lsls r0, r0, #3
	adds r1, r0, r2
	ldr r3, [r1]
	ldr r1, _0803BBD0 @ =gUnknown_0200C420
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	strb r0, [r1, #0xd]
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_0803BBC8: .4byte gUnknown_0849EACC
_0803BBCC: .4byte gUnknown_030033FC
_0803BBD0: .4byte gUnknown_0200C420

