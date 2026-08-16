	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066A20
sub_08066A20: @ 0x08066A20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r2, _08066AAC @ =gUnknown_0816E154
	ldr r4, [r2]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x32
	strb r0, [r1]
	movs r3, #0
	ldr r0, [r4]
	mov r8, r2
	ldrb r0, [r0, #8]
	cmp r3, r0
	bge _08066A7C
	adds r7, r4, #0
	movs r6, #1
	rsbs r6, r6, #0
	ldr r4, _08066AB0 @ =gUnknown_03002040
	movs r2, #2
_08066A54:
	ldrh r1, [r4, #4]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08066A60
	adds r5, #1
_08066A60:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x70
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	beq _08066ACC
	adds r4, #0x14
	adds r3, #1
	ldrb r1, [r1, #8]
	cmp r3, r1
	blt _08066A54
_08066A7C:
	cmp r5, #0
	beq _08066ACC
	bl sub_08063A3C
	ldr r1, _08066AB4 @ =gUnknown_08580D90
	bl sub_08063A30
	ldr r0, _08066AB8 @ =gUnknown_08580AF0
	ldr r4, _08066ABC @ =sub_08065F68
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08066AC0 @ =gUnknown_08580B90
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08066AC4 @ =gUnknown_08580BC8
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08066AC8 @ =gUnknown_08580D0C
	bl sub_0806377C
	b _08066B32
	.align 2, 0
_08066AAC: .4byte gUnknown_0816E154
_08066AB0: .4byte gUnknown_03002040
_08066AB4: .4byte gUnknown_08580D90
_08066AB8: .4byte gUnknown_08580AF0
_08066ABC: .4byte sub_08065F68
_08066AC0: .4byte gUnknown_08580B90
_08066AC4: .4byte gUnknown_08580BC8
_08066AC8: .4byte gUnknown_08580D0C
_08066ACC:
	bl sub_08065E5C
	bl sub_080665D4
	mov r0, r8
	ldr r4, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x70
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08066AF6
	bl sub_08065EF4
_08066AF6:
	movs r3, #0
	ldr r0, [r4]
	ldrb r2, [r0, #8]
	cmp r3, r2
	bge _08066B1E
	adds r1, r0, #0
	adds r1, #0x70
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08066B1E
_08066B0C:
	adds r3, #1
	cmp r3, r2
	bge _08066B1E
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08066B0C
_08066B1E:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r3, r0
	bne _08066B32
	ldr r0, _08066B3C @ =gUnknown_08580D3C
	movs r1, #4
	bl sub_080152EC
_08066B32:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066B3C: .4byte gUnknown_08580D3C

