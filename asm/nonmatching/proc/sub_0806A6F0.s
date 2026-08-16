	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A6F0
sub_0806A6F0: @ 0x0806A6F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	ldr r0, _0806A798 @ =gUnknown_0817B150
	ldr r1, _0806A79C @ =0x06013940
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	ldr r0, _0806A7A0 @ =gUnknown_0817B950
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0806A7A4 @ =gUnknown_030020C0
	movs r2, #0
	movs r1, #0xf
	ldr r3, _0806A7A8 @ =0x0000029E
	adds r0, r0, r3
_0806A71A:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _0806A71A
	lsls r0, r4, #0xc
	str r0, [r5, #0x38]
	lsls r0, r6, #0xc
	str r0, [r5, #0x3c]
	movs r0, #0xf0
	subs r0, r0, r4
	lsls r0, r0, #0xc
	str r0, [r5, #0x30]
	adds r0, r6, #0
	subs r0, #0x80
	lsls r0, r0, #0xc
	str r0, [r5, #0x34]
	adds r1, r5, #0
	adds r1, #0x58
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r6, r5, #0
	adds r6, #0x5a
	movs r0, #0x33
	strh r0, [r6]
	ldr r1, [r5, #0x30]
	str r1, [r5, #0x40]
	ldr r4, [r5, #0x34]
	str r4, [r5, #0x44]
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl __divsi3
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x3c]
	subs r0, r0, r4
	movs r3, #0
	ldrsh r1, [r6, r3]
	bl __divsi3
	str r0, [r5, #0x4c]
	ldr r0, _0806A7AC @ =gUnknown_085815D0
	adds r1, r5, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	ldr r0, _0806A7B0 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	adds r2, r5, #0
	adds r2, #0x5e
	strh r0, [r2]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	adds r0, #0x60
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A798: .4byte gUnknown_0817B150
_0806A79C: .4byte 0x06013940
_0806A7A0: .4byte gUnknown_0817B950
_0806A7A4: .4byte gUnknown_030020C0
_0806A7A8: .4byte 0x0000029E
_0806A7AC: .4byte gUnknown_085815D0
_0806A7B0: .4byte gUnknown_08499590

