	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080253B0
sub_080253B0: @ 0x080253B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0802544C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r4, #3]
	lsls r1, r1, #1
	ldr r3, _08025450 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4, #2]
	adds r0, r0, r1
	ldr r1, _08025454 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r3, [r2]
	ldr r2, _08025458 @ =gUnknown_08090A48
	ldr r1, [r2]
	ldrb r7, [r4]
	movs r0, #0x5c
	muls r0, r7, r0
	adds r1, #0x58
	adds r0, r0, r1
	movs r6, #0x1f
	ands r6, r3
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r5, [r0]
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	bne _0802549E
	ldr r0, _0802545C @ =gUnknown_03004084
	movs r1, #0xe0
	ldrh r0, [r0]
	ands r3, r1
	cmp r0, r3
	bne _0802540E
	ldr r0, _08025460 @ =gUnknown_084995DA
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, r6
	beq _0802549E
_0802540E:
	ldrb r1, [r4, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802541A
	movs r5, #5
_0802541A:
	ldr r0, _08025464 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r4]
	bl sub_08042C68
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r1, #0
	bge _08025434
	movs r5, #0
_08025434:
	ldrb r2, [r4, #6]
	lsls r3, r2, #0x19
	lsrs r1, r3, #0x19
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bgt _08025468
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r4, #6]
	b _0802547A
	.align 2, 0
_0802544C: .4byte gUnknown_08499590
_08025450: .4byte 0x0000417A
_08025454: .4byte 0x00001432
_08025458: .4byte gUnknown_08090A48
_0802545C: .4byte gUnknown_03004084
_08025460: .4byte gUnknown_084995DA
_08025464: .4byte gUnknown_030033EC
_08025468:
	lsrs r0, r3, #0x19
	subs r0, r0, r5
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #6]
_0802547A:
	ldrb r1, [r4, #6]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	bne _0802549E
	mov r3, r8
	ldr r2, [r3]
	ldrb r1, [r4]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r1, [r0, #0x1a]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0802549E
	movs r0, #1
	b _080254A0
_0802549E:
	movs r0, #0
_080254A0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

