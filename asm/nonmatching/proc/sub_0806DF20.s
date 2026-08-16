	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DF20
sub_0806DF20: @ 0x0806DF20
	push {lr}
	ldr r0, _0806DF50 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0xf
	ble _0806DF30
	subs r0, r1, r0
_0806DF30:
	ldr r3, _0806DF54 @ =gUnknown_030020C0
	adds r1, r0, #0
	adds r1, #0xa
	lsls r0, r1, #0xa
	lsls r2, r1, #5
	adds r0, r0, r2
	adds r0, r0, r1
	movs r1, #0xa4
	lsls r1, r1, #2
	adds r3, r3, r1
	strh r0, [r3]
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0
_0806DF50: .4byte gUnknown_03004008
_0806DF54: .4byte gUnknown_030020C0

