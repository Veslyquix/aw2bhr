	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070BAC
sub_08070BAC: @ 0x08070BAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _08070C8C @ =0x68736D53
	cmp r1, r0
	bne _08070C82
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _08070BEE
	ldr r0, [r5]
	cmp r0, #0
	beq _08070BD8
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08070BE4
_08070BD8:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _08070BEE
	cmp r1, #0
	blt _08070BEE
_08070BE4:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _08070C82
_08070BEE:
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0
	str r1, [r5, #4]
	str r7, [r5]
	ldr r0, [r7, #4]
	str r0, [r5, #0x30]
	strb r2, [r5, #9]
	str r1, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x20]
	adds r0, #0x6a
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r6, #0
	ldr r4, [r5, #0x2c]
	ldrb r1, [r7]
	cmp r6, r1
	bge _08070C4E
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _08070C6E
	mov r8, r6
_08070C22:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0807004C
	movs r0, #0xc0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, #0x20]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x40]
	adds r6, #1
	adds r4, #0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _08070C4E
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _08070C22
_08070C4E:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _08070C6E
	movs r1, #0
	mov r8, r1
_08070C58:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0807004C
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _08070C58
_08070C6E:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _08070C7E
	ldrb r0, [r7, #3]
	bl sub_08070990
_08070C7E:
	ldr r0, _08070C8C @ =0x68736D53
	str r0, [r5, #0x34]
_08070C82:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070C8C: .4byte 0x68736D53

