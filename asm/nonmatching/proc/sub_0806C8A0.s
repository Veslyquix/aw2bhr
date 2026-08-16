	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C8A0
sub_0806C8A0: @ 0x0806C8A0
	push {r4, r5, lr}
	movs r0, #0
	ldr r5, _0806C8D0 @ =gUnknown_08499578
	movs r4, #0
_0806C8A8:
	adds r3, r0, #1
	lsls r0, r0, #6
	adds r1, r0, #0
	adds r1, #0x10
	movs r2, #0x15
_0806C8B2:
	ldr r0, [r5]
	adds r0, r1, r0
	strh r4, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0806C8B2
	adds r0, r3, #0
	cmp r0, #0x13
	ble _0806C8A8
	bl sub_08013AEC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C8D0: .4byte gUnknown_08499578

