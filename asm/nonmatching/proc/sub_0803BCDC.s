	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BCDC
sub_0803BCDC: @ 0x0803BCDC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0803BD14
	adds r3, r0, #0
	movs r1, #0
	ldr r5, _0803BD10 @ =gUnknown_0809112C
	cmp r1, r3
	bge _0803BD02
	ldr r0, [r5]
	adds r2, r0, #0
	adds r2, #0x3e
_0803BCF4:
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #1
	cmp r1, r3
	blt _0803BCF4
_0803BD02:
	ldr r0, [r5]
	adds r0, #0x3d
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803BD10: .4byte gUnknown_0809112C

