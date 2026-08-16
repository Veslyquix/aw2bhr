	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806370C
sub_0806370C: @ 0x0806370C
	push {lr}
	adds r3, r0, #0
	ldr r2, _08063728 @ =0x000003FF
	ands r2, r1
	cmp r3, #0
	bge _08063730
	lsls r0, r2, #5
	ldr r1, _0806372C @ =0x06010000
	adds r0, r0, r1
	movs r1, #0x80
	bl sub_08011D7C
	b _08063754
	.align 2, 0
_08063728: .4byte 0x000003FF
_0806372C: .4byte 0x06010000
_08063730:
	ldr r1, _08063758 @ =gUnknown_08614258
	ldr r0, _0806375C @ =gUnknown_02028E40
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r1, r3, #7
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r1, r2, #5
	movs r2, #0x80
	lsls r2, r2, #9
	orrs r1, r2
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	bl sub_08011E54
_08063754:
	pop {r0}
	bx r0
	.align 2, 0
_08063758: .4byte gUnknown_08614258
_0806375C: .4byte gUnknown_02028E40

