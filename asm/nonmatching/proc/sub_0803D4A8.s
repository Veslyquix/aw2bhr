	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D4A8
sub_0803D4A8: @ 0x0803D4A8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _0803D4D8 @ =gUnknown_02000000
	cmp r5, #3
	bhi _0803D4C4
	adds r0, r5, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_0801AD70
	cmp r0, #0
	beq _0803D4E0
_0803D4C4:
	ldr r0, _0803D4DC @ =gUnknown_020280C0
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0xff
	strb r0, [r1, #0x13]
	movs r0, #0
	b _0803D534
	.align 2, 0
_0803D4D8: .4byte gUnknown_02000000
_0803D4DC: .4byte gUnknown_020280C0
_0803D4E0:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0801AC58
	lsls r4, r5, #3
	subs r4, r4, r5
	lsls r4, r4, #2
	ldr r5, _0803D53C @ =gUnknown_020280C2
	adds r0, r4, r5
	ldr r2, _0803D540 @ =0x000004B2
	adds r1, r6, r2
	bl sub_0803CC84
	subs r1, r5, #2
	adds r1, r4, r1
	ldr r2, _0803D544 @ =0x000004C3
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #0x13]
	adds r2, #6
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #0x19]
	adds r2, #1
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #0x1a]
	movs r2, #0
	adds r5, #0x12
	ldr r0, _0803D548 @ =0x000004C4
	adds r3, r6, r0
_0803D51E:
	adds r1, r2, r4
	adds r1, r1, r5
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _0803D51E
	movs r0, #1
_0803D534:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803D53C: .4byte gUnknown_020280C2
_0803D540: .4byte 0x000004B2
_0803D544: .4byte 0x000004C3
_0803D548: .4byte 0x000004C4

