	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F114
sub_0801F114: @ 0x0801F114
	push {r4, r5, lr}
	movs r1, #0
	ldr r0, _0801F148 @ =gUnknown_0200F920
	adds r5, r0, #0
	adds r5, #8
	ldr r0, _0801F14C @ =0x0000FFFF
	adds r4, r0, #0
_0801F122:
	lsls r0, r1, #4
	adds r3, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r5
	movs r2, #0x1f
_0801F12E:
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r1, #4
	subs r2, #1
	cmp r2, #0
	bge _0801F12E
	adds r1, r3, #0
	cmp r1, #5
	ble _0801F122
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F148: .4byte gUnknown_0200F920
_0801F14C: .4byte 0x0000FFFF

