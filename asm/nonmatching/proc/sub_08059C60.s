	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059C60
sub_08059C60: @ 0x08059C60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	ldr r0, _08059D64 @ =gUnknown_03003F38
	ldrb r0, [r0]
	lsrs r0, r0, #6
	adds r0, #1
	str r0, [sp, #8]
	movs r3, #0
_08059C7A:
	ldr r0, _08059D68 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08059D6C @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	asrs r1, r3
	movs r0, #1
	ands r1, r0
	adds r0, r3, #1
	str r0, [sp, #0xc]
	cmp r1, #0
	bne _08059C9E
	b _08059DD8
_08059C9E:
	lsls r1, r3, #6
	mov r8, r1
	mov r0, r8
	adds r0, #0x40
	mov r4, r8
	adds r2, r4, #0
	str r2, [sp, #0x10]
	cmp r8, r0
	blt _08059CB2
	b _08059DD8
_08059CB2:
	lsls r0, r3, #7
	add r0, r8
	lsls r0, r0, #2
	str r0, [sp, #0x14]
_08059CBA:
	ldr r0, _08059D70 @ =gUnknown_08499594
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	adds r5, r0, r1
	ldrb r2, [r5]
	cmp r2, #0
	beq _08059DC4
	ldrb r0, [r5, #3]
	lsls r0, r0, #2
	ldr r3, _08059D74 @ =gUnknown_03003340
	adds r0, r0, r3
	ldrb r1, [r5, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08059DC4
	cmp r2, #0x18
	bne _08059CF4
	mov r4, r8
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl sub_080257C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08059DC4
_08059CF4:
	ldr r0, _08059D68 @ =gUnknown_030033EC
	ldrb r0, [r0]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl sub_08020DBC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08059DC4
	ldr r0, _08059D6C @ =gUnknown_08499598
	mov sb, r0
	ldr r1, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r6, r0, #2
	adds r1, r6, r1
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	ldr r3, _08059D78 @ =gUnknown_030040D8
	mov sl, r3
	ldr r2, [r3]
	ldrb r2, [r2]
	ldrb r3, [r5]
	movs r4, #0
	str r4, [sp]
	bl sub_08043070
	adds r4, r0, #0
	mov r0, sb
	ldr r1, [r0]
	adds r1, r6, r1
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	mov r3, sl
	ldr r2, [r3]
	ldrb r2, [r2]
	ldrb r3, [r5]
	movs r7, #1
	str r7, [sp]
	bl sub_08043070
	cmp r4, r0
	bge _08059D7C
	mov r4, sb
	ldr r1, [r4]
	adds r1, r6, r1
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	mov r3, sl
	ldr r2, [r3]
	ldrb r2, [r2]
	ldrb r3, [r5]
	str r7, [sp]
	b _08059D92
	.align 2, 0
_08059D64: .4byte gUnknown_03003F38
_08059D68: .4byte gUnknown_030033EC
_08059D6C: .4byte gUnknown_08499598
_08059D70: .4byte gUnknown_08499594
_08059D74: .4byte gUnknown_03003340
_08059D78: .4byte gUnknown_030040D8
_08059D7C:
	mov r4, sb
	ldr r1, [r4]
	adds r1, r6, r1
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	mov r3, sl
	ldr r2, [r3]
	ldrb r2, [r2]
	ldrb r3, [r5]
	movs r4, #0
	str r4, [sp]
_08059D92:
	bl sub_08043070
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bls _08059DC4
	ldrb r0, [r5, #2]
	ldr r1, [sp, #4]
	strb r0, [r1]
	ldrb r0, [r5, #3]
	strb r0, [r1, #1]
	ldrb r0, [r5, #3]
	lsls r0, r0, #2
	ldr r2, _08059DF8 @ =gUnknown_03003340
	adds r0, r0, r2
	ldrb r1, [r5, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, [sp, #4]
	strh r0, [r3, #2]
	adds r3, #4
	str r3, [sp, #4]
_08059DC4:
	ldr r4, [sp, #0x14]
	adds r4, #0xc
	str r4, [sp, #0x14]
	movs r0, #1
	add r8, r0
	ldr r0, [sp, #0x10]
	adds r0, #0x40
	cmp r8, r0
	bge _08059DD8
	b _08059CBA
_08059DD8:
	ldr r3, [sp, #0xc]
	cmp r3, #3
	bgt _08059DE0
	b _08059C7A
_08059DE0:
	ldr r0, _08059DFC @ =0x0000FFFF
	ldr r1, [sp, #4]
	strh r0, [r1, #2]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059DF8: .4byte gUnknown_03003340
_08059DFC: .4byte 0x0000FFFF

