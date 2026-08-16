	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062474
sub_08062474: @ 0x08062474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08062540 @ =gUnknown_03004480
	ldrh r6, [r0]
	mov sl, r6
	ldr r2, _08062544 @ =gUnknown_030045CC
	ldrb r1, [r2]
	movs r0, #1
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _08062530
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _08062548 @ =gUnknown_08499590
	ldr r0, [r4]
	ldr r1, _0806254C @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r0, [r4]
	ldr r1, _08062550 @ =0x00003262
	adds r0, r0, r1
	movs r1, #0
	bl sub_080581A4
	ldr r2, _08062554 @ =gUnknown_085D5ABC
	ldr r0, _08062558 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r5, [r0, #0x1d]
	mov sb, r5
	ldr r7, _0806255C @ =gUnknown_08499598
	ldr r1, [r7]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r4, r0, #2
	adds r1, r4, r1
	adds r1, #0x2c
	ldrb r1, [r1]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _080624E2
	movs r0, #1
	adds r1, r5, #0
	bl sub_08062560
_080624E2:
	ldr r0, [r7]
	adds r0, r4, r0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080624FA
	movs r0, #2
	adds r1, r5, #0
	bl sub_08062560
_080624FA:
	ldr r0, [r7]
	adds r0, r4, r0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08062512
	movs r0, #3
	adds r1, r5, #0
	bl sub_08062560
_08062512:
	ldr r0, [r7]
	adds r0, r4, r0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806252A
	movs r0, #4
	mov r1, sb
	bl sub_08062560
_0806252A:
	mov r1, sl
	ldr r0, _08062540 @ =gUnknown_03004480
	strh r1, [r0]
_08062530:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062540: .4byte gUnknown_03004480
_08062544: .4byte gUnknown_030045CC
_08062548: .4byte gUnknown_08499590
_0806254C: .4byte 0x00002852
_08062550: .4byte 0x00003262
_08062554: .4byte gUnknown_085D5ABC
_08062558: .4byte gUnknown_030040D8
_0806255C: .4byte gUnknown_08499598

