	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025D60
sub_08025D60: @ 0x08025D60
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _08025DB0 @ =gUnknown_08090A54
	ldr r7, [r5]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, [r7]
	adds r6, r1, r0
	adds r0, r6, #0
	bl sub_0802A5C4
	asrs r4, r4, #6
	adds r4, #1
	adds r0, r4, #0
	bl sub_08025D40
	ldrb r0, [r6, #7]
	adds r4, r5, #0
	cmp r0, #0
	beq _08025DC2
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r7]
	adds r5, r1, r0
	ldrb r1, [r5, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08025DB4
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r1, r0, #1
	b _08025DB6
	.align 2, 0
_08025DB0: .4byte gUnknown_08090A54
_08025DB4:
	movs r1, #0
_08025DB6:
	adds r0, r5, #0
	bl sub_08025B24
	ldrb r0, [r6, #7]
	bl sub_08025D60
_08025DC2:
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _08025DFE
	ldr r2, [r4]
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r5, r1, r0
	ldrb r1, [r5, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08025DF0
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r1, r0, #1
	b _08025DF2
_08025DF0:
	movs r1, #0
_08025DF2:
	adds r0, r5, #0
	bl sub_08025B24
	ldrb r0, [r6, #8]
	bl sub_08025D60
_08025DFE:
	movs r0, #0
	strb r0, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

