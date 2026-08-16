	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DB04
sub_0801DB04: @ 0x0801DB04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _0801DBFC @ =gUnknown_0200E438
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x4c
	muls r0, r1, r0
	adds r0, r0, r2
	mov r8, r0
	movs r1, #0x3a
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _0801DBEC
	mov r2, r8
	ldrh r4, [r2, #0x3e]
	ldrh r1, [r2, #0x3c]
	movs r3, #0x3c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0801DB36
	movs r1, #2
_0801DB36:
	cmp r4, #0
	bne _0801DB3C
	movs r4, #2
_0801DB3C:
	ldr r0, _0801DC00 @ =gUnknown_0808F100
	mov sb, r0
	mov r7, r8
	adds r7, #0x40
	movs r6, #0xff
	ldrb r0, [r7]
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #4
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	movs r1, #2
	cmp r5, #0
	beq _0801DB60
	adds r1, r5, #0
_0801DB60:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r1, [r7]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r3, #0
	ldrsh r0, [r0, r3]
	rsbs r0, r0, #0
	lsls r2, r0, #4
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r1, #2
	cmp r4, #0
	beq _0801DB8A
	adds r1, r4, #0
_0801DB8A:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldrh r1, [r7]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #2
	cmp r5, #0
	beq _0801DBAE
	adds r1, r5, #0
_0801DBAE:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldrh r0, [r7]
	ands r6, r0
	adds r0, r6, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	movs r1, #2
	cmp r4, #0
	beq _0801DBD0
	adds r1, r4, #0
_0801DBD0:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	movs r2, #0x3a
	ldrsh r1, [r3, r2]
	str r0, [sp]
	adds r0, r1, #0
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r5, #0
	bl sub_0801E108
_0801DBEC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DBFC: .4byte gUnknown_0200E438
_0801DC00: .4byte gUnknown_0808F100

