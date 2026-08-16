	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DCD4
sub_0805DCD4: @ 0x0805DCD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp, #0x14]
	movs r5, #0
	str r5, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r2, _0805DE2C @ =gUnknown_0816DA50
	ldr r0, [r2]
	ldr r3, [r0]
	ldrb r1, [r3, #9]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0805DD0A
	b _0805DFA6
_0805DD0A:
	ldrb r0, [r3]
	cmp r0, #7
	beq _0805DD16
	cmp r0, #0x14
	beq _0805DD16
	b _0805DFA6
_0805DD16:
	adds r0, r3, #0
	bl sub_080202A4
	movs r0, #0x79
	bl sub_0801FD9C
	movs r7, #0
	ldr r0, _0805DE30 @ =gUnknown_0816DA54
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, [sp, #0x1c]
	ldrh r1, [r1, #2]
	cmp r3, r1
	bge _0805DDD6
	adds r3, r2, #0
_0805DD34:
	movs r4, #0
	ldr r0, [r3]
	adds r5, r7, #1
	mov sl, r5
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805DDCC
	ldr r1, _0805DE34 @ =gUnknown_03003340
	lsls r0, r7, #2
	adds r6, r0, r1
_0805DD48:
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805DDC2
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	str r3, [sp, #0x20]
	bl sub_0804236C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r0, #1
	bne _0805DDC2
	ldr r1, [r3]
	lsls r2, r7, #1
	ldr r5, _0805DE38 @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805DDC2
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	cmp r0, r1
	ble _0805DDC2
	add r5, sp, #4
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_08058DEC
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne _0805DDC2
	str r4, [sp, #8]
	str r7, [sp, #0xc]
	add r0, sp, #4
	ldrh r0, [r0]
	str r0, [sp, #0x14]
	ldrh r5, [r5, #2]
	str r5, [sp, #0x18]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x10]
_0805DDC2:
	adds r4, #1
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805DD48
_0805DDCC:
	mov r7, sl
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _0805DD34
_0805DDD6:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	ble _0805DE78
	ldr r0, _0805DE3C @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r3, [sp, #0x18]
	lsls r2, r3, #1
	ldr r5, _0805DE38 @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r2, [sp, #0x14]
	adds r0, r0, r2
	ldr r3, _0805DE40 @ =0x0000193A
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r0, _0805DE44 @ =gUnknown_084995A0
	ldr r0, [r0]
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _0805DE48 @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r2, [r3, #9]
	lsrs r1, r2, #6
	subs r1, #1
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	ldr r5, [sp, #8]
	ldr r0, [sp, #0x14]
	cmp r5, r0
	beq _0805DE4C
	subs r0, r0, r5
	adds r0, #3
	b _0805DE58
	.align 2, 0
_0805DE2C: .4byte gUnknown_0816DA50
_0805DE30: .4byte gUnknown_0816DA54
_0805DE34: .4byte gUnknown_03003340
_0805DE38: .4byte 0x0000417A
_0805DE3C: .4byte gUnknown_08499590
_0805DE40: .4byte 0x0000193A
_0805DE44: .4byte gUnknown_084995A0
_0805DE48: .4byte gUnknown_030040D8
_0805DE4C:
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r1, r2
	beq _0805DE5E
	subs r0, r1, r2
	adds r0, #2
_0805DE58:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_0805DE5E:
	ldr r3, [sp, #0x14]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r5, [sp, #0x18]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #8
	ldr r3, [sp, #0x1c]
	bl sub_0805D648
	b _0805DFA6
_0805DE78:
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x14]
	movs r7, #0
	ldr r1, _0805DE8C @ =gUnknown_08499590
	ldr r0, [r1]
	b _0805DF36
	.align 2, 0
_0805DE8C: .4byte gUnknown_08499590
_0805DE90:
	movs r4, #0
	ldr r1, _0805DEA0 @ =gUnknown_0816DA54
	ldr r2, _0805DEA4 @ =gUnknown_08499590
	ldr r0, [r2]
	adds r3, r7, #1
	mov sl, r3
	b _0805DF2A
	.align 2, 0
_0805DEA0: .4byte gUnknown_0816DA54
_0805DEA4: .4byte gUnknown_08499590
_0805DEA8:
	lsls r0, r7, #2
	ldr r5, _0805DF64 @ =gUnknown_03003340
	adds r0, r0, r5
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805DF22
	ldr r1, [r1]
	mov sb, r1
	ldr r2, [r1]
	lsls r6, r7, #1
	ldr r0, _0805DF68 @ =0x0000417A
	mov r8, r0
	adds r0, r2, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r1, r0, r4
	ldr r3, _0805DF6C @ =0x0000376A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r5, [sp, #0x10]
	cmp r0, r5
	ble _0805DF22
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805DF22
	add r5, sp, #4
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	str r3, [sp, #0x20]
	bl sub_08058DEC
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne _0805DF22
	str r4, [sp, #8]
	str r7, [sp, #0xc]
	add r0, sp, #4
	ldrh r0, [r0]
	str r0, [sp, #0x14]
	ldrh r5, [r5, #2]
	str r5, [sp, #0x18]
	mov r0, sb
	ldr r1, [r0]
	mov r2, r8
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	str r1, [sp, #0x10]
_0805DF22:
	adds r4, #1
	ldr r1, _0805DF70 @ =gUnknown_0816DA54
	ldr r3, _0805DF74 @ =gUnknown_08499590
	ldr r0, [r3]
_0805DF2A:
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805DEA8
	mov r7, sl
	ldr r5, _0805DF74 @ =gUnknown_08499590
	ldr r0, [r5]
_0805DF36:
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _0805DE90
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ble _0805DFA6
	ldr r0, _0805DF78 @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r2, [r3, #9]
	lsrs r1, r2, #6
	subs r1, #1
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x14]
	cmp r1, r2
	beq _0805DF7C
	subs r0, r2, r1
	adds r0, #3
	b _0805DF88
	.align 2, 0
_0805DF64: .4byte gUnknown_03003340
_0805DF68: .4byte 0x0000417A
_0805DF6C: .4byte 0x0000376A
_0805DF70: .4byte gUnknown_0816DA54
_0805DF74: .4byte gUnknown_08499590
_0805DF78: .4byte gUnknown_030040D8
_0805DF7C:
	ldr r3, [sp, #0xc]
	ldr r5, [sp, #0x18]
	cmp r3, r5
	beq _0805DF8E
	subs r0, r3, r5
	adds r0, #2
_0805DF88:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_0805DF8E:
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x18]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #8
	ldr r3, [sp, #0x1c]
	bl sub_0805D648
_0805DFA6:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

