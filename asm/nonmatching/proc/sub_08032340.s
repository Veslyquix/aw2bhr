	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032340
sub_08032340: @ 0x08032340
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	cmp r1, r0
	beq _0803235E
	subs r0, r0, r1
	asrs r0, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0803235E:
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r5, _080323D0 @ =gUnknown_0849B108
	ldr r2, [r7, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r5
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r1, #0x48
	adds r1, r4, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r5
	movs r0, #0
	ldrsh r2, [r2, r0]
	adds r2, #0x58
	movs r6, #0
	str r6, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	ldr r1, [r7, #0x58]
	lsls r0, r1, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	adds r4, #0x78
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r4, r0
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r3, #0
	ldrsh r0, [r1, r3]
	movs r2, #0x3c
	subs r2, r2, r0
	str r6, [sp]
	movs r0, #0x50
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r7, #0x58]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	str r0, [r7, #0x58]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080323D0: .4byte gUnknown_0849B108

