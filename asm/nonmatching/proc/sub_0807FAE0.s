	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FAE0
sub_0807FAE0: @ 0x0807FAE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldr r0, [r5, #0x58]
	lsls r0, r0, #2
	adds r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0
	bl sub_08074234
	str r0, [r5, #0x2c]
	adds r0, #0xa8
	ldr r1, _0807FBE4 @ =0x000001FF
	ands r0, r1
	ldr r2, _0807FBE8 @ =0x000041CA
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	movs r6, #0
	ldr r0, [r5, #0x58]
	cmp r6, r0
	blt _0807FB26
	b _0807FC30
_0807FB26:
	ldr r2, _0807FBEC @ =0x0000030A
	str r2, [sp, #4]
	movs r0, #8
	mov sl, r0
_0807FB2E:
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	lsls r0, r6, #2
	cmp r3, r0
	blt _0807FBFC
	cmp r3, sl
	bge _0807FC00
	subs r3, r3, r0
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08074234
	str r0, [r5, #0x2c]
	ldr r4, _0807FBF0 @ =gUnknown_0808F100
	adds r1, r4, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	mov r8, r1
	adds r1, r0, #0
	cmp r1, #0
	bne _0807FB6C
	movs r1, #2
_0807FB6C:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r5, #0x2c]
	cmp r1, #0
	bne _0807FB88
	movs r1, #2
_0807FB88:
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r4, #4
	ldr r1, [r5, #0x2c]
	cmp r1, #0
	bne _0807FB9A
	movs r1, #2
_0807FB9A:
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r5, #0x2c]
	cmp r1, #0
	bne _0807FBAA
	movs r1, #2
_0807FBAA:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r6, #0
	mov r1, sb
	adds r2, r7, #0
	adds r3, r4, #0
	bl sub_0801E108
	lsls r1, r6, #9
	ldr r0, _0807FBF4 @ =gUnknown_030059A0
	adds r0, r6, r0
	ldrb r0, [r0]
	orrs r1, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xcc
	lsls r2, r2, #2
	ldr r3, _0807FBF8 @ =gUnknown_0848B6E6
	bl sub_0801BEFC
	b _0807FC1C
	.align 2, 0
_0807FBE4: .4byte 0x000001FF
_0807FBE8: .4byte 0x000041CA
_0807FBEC: .4byte 0x0000030A
_0807FBF0: .4byte gUnknown_0808F100
_0807FBF4: .4byte gUnknown_030059A0
_0807FBF8: .4byte gUnknown_0848B6E6
_0807FBFC:
	cmp r3, sl
	blt _0807FC1C
_0807FC00:
	ldr r0, _0807FC4C @ =gUnknown_030059A0
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r1, #8
	movs r0, #0xc0
	lsls r0, r0, #6
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _0807FC50 @ =gUnknown_0848B6E6
	bl sub_0801BEBC
_0807FC1C:
	ldr r0, [sp, #4]
	adds r0, #8
	str r0, [sp, #4]
	movs r1, #4
	add sl, r1
	adds r6, #1
	ldr r0, [r5, #0x58]
	cmp r6, r0
	bge _0807FC30
	b _0807FB2E
_0807FC30:
	adds r2, r5, #0
	adds r2, #0x4c
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r5, #0x58]
	lsls r0, r0, #2
	adds r0, #8
	cmp r1, r0
	bge _0807FC54
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0807FC5E
	.align 2, 0
_0807FC4C: .4byte gUnknown_030059A0
_0807FC50: .4byte gUnknown_0848B6E6
_0807FC54:
	movs r0, #0
	strh r0, [r2]
	adds r0, r5, #0
	bl Proc_Break
_0807FC5E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

