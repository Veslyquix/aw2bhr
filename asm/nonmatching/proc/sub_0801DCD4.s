	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DCD4
sub_0801DCD4: @ 0x0801DCD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	mov r8, r1
	ldr r0, _0801DD28 @ =gUnknown_03003040
	mov r1, sb
	strh r1, [r0]
	ldr r1, _0801DD2C @ =gUnknown_0200E438
	movs r0, #0x4c
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldr r5, [r4, #8]
	cmp r5, #0
	bne _0801DCFE
	b _0801DEC6
_0801DCFE:
	ldr r3, _0801DD30 @ =0x00000FFF
	mov sl, r3
_0801DD02:
	ldrh r2, [r5]
	ldr r1, _0801DD34 @ =0xFFFFF000
	adds r0, r1, #0
	adds r1, r0, #0
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	beq _0801DD78
	cmp r1, r0
	bgt _0801DD38
	cmp r1, #0
	beq _0801DD4A
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r1, r0
	beq _0801DD84
	b _0801DEBA
	.align 2, 0
_0801DD28: .4byte gUnknown_03003040
_0801DD2C: .4byte gUnknown_0200E438
_0801DD30: .4byte 0x00000FFF
_0801DD34: .4byte 0xFFFFF000
_0801DD38:
	movs r0, #0xe0
	lsls r0, r0, #8
	cmp r1, r0
	beq _0801DDFC
	movs r0, #0xf0
	lsls r0, r0, #8
	cmp r1, r0
	beq _0801DE08
	b _0801DEBA
_0801DD4A:
	mov r3, r8
	cmp r3, #0
	bne _0801DD52
	b _0801DEC6
_0801DD52:
	ldrh r1, [r4, #0x1c]
	movs r3, #0x1c
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0801DD60
	subs r0, r1, #1
	b _0801DD66
_0801DD60:
	mov r0, sl
	ands r0, r2
	subs r0, #1
_0801DD66:
	strh r0, [r4, #0x1c]
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801DD72
	b _0801DEC6
_0801DD72:
	adds r0, r5, #2
	str r0, [r4, #8]
	b _0801DEC6
_0801DD78:
	mov r0, sl
	ands r0, r2
	ldr r5, [r4, #4]
	lsls r0, r0, #1
	adds r5, r5, r0
	b _0801DEBA
_0801DD84:
	movs r0, #0xff
	ands r0, r2
	strh r0, [r4, #0x24]
	adds r5, #2
	mov r2, r8
	cmp r2, #0
	beq _0801DD94
	b _0801DEBA
_0801DD94:
	ldr r3, [r4, #0x20]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r3, r3, r0
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	cmp r0, #0
	bge _0801DDAA
	b _0801DEBA
_0801DDAA:
	lsls r0, r1, #0x1a
	cmp r0, #0
	bge _0801DDBE
	ldr r0, _0801DDF8 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801DDBE
	b _0801DEBA
_0801DDBE:
	ldrb r7, [r4, #0x1e]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801DDCC
	adds r1, #0xff
_0801DDCC:
	asrs r6, r1, #8
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801DDDA
	adds r1, #0xff
_0801DDDA:
	asrs r2, r1, #8
	ldr r3, [r3]
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	str r0, [sp]
	str r1, [sp, #4]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_0801ECE8
	b _0801DEBA
	.align 2, 0
_0801DDF8: .4byte gUnknown_03004008
_0801DDFC:
	mov r0, sl
	ands r0, r2
	str r0, [r4, #0x2c]
	adds r5, #2
	str r5, [r4, #8]
	b _0801DEBA
_0801DE08:
	movs r3, #0xf0
	lsls r3, r3, #4
	adds r1, r3, #0
	ands r1, r2
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r1, r0
	beq _0801DEAA
	cmp r1, r0
	bgt _0801DE26
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r1, r0
	beq _0801DEB0
	b _0801DEBA
_0801DE26:
	movs r0, #0xe0
	lsls r0, r0, #4
	cmp r1, r0
	beq _0801DE9C
	cmp r1, r3
	bne _0801DEBA
	str r5, [r4, #8]
	mov r2, r8
	cmp r2, #0
	bne _0801DEC6
	ldr r3, [r4, #0x20]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r3, r3, r0
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	cmp r0, #0
	blt _0801DEC6
	lsls r0, r1, #0x1a
	cmp r0, #0
	bge _0801DE60
	ldr r0, _0801DE98 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801DEC6
_0801DE60:
	ldrb r6, [r4, #0x1e]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801DE6E
	adds r1, #0xff
_0801DE6E:
	asrs r5, r1, #8
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	adds r1, r1, r0
	cmp r1, #0
	bge _0801DE7C
	adds r1, #0xff
_0801DE7C:
	asrs r2, r1, #8
	ldr r3, [r3]
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	str r0, [sp]
	str r1, [sp, #4]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0801ECE8
	b _0801DEC6
	.align 2, 0
_0801DE98: .4byte gUnknown_03004008
_0801DE9C:
	mov r2, r8
	cmp r2, #0
	beq _0801DEC6
	mov r0, sb
	bl sub_0801D81C
	b _0801DEC6
_0801DEAA:
	strb r2, [r4, #0x1e]
	adds r5, #2
	b _0801DEBA
_0801DEB0:
	str r5, [r4, #8]
	adds r5, #2
	ldr r0, [r4, #8]
	adds r0, #2
	str r0, [r4, #8]
_0801DEBA:
	movs r3, #0
	cmp r3, #0
	bne _0801DEC6
	cmp r5, #0
	beq _0801DEC6
	b _0801DD02
_0801DEC6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

