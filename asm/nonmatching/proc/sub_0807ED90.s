	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807ED90
sub_0807ED90: @ 0x0807ED90
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x30
	bgt _0807EDCA
	adds r3, r0, #0
	movs r0, #0x30
	str r0, [sp]
	movs r0, #1
	movs r1, #0xf8
	movs r2, #0
	bl Interpolate
	str r0, [r6, #0x2c]
	movs r7, #0
	ldrsh r0, [r4, r7]
	cmp r0, #0x30
	bne _0807EE4E
	movs r0, #0x78
	bl sub_0803B4DC
	b _0807EE4E
_0807EDCA:
	cmp r0, #0x34
	bgt _0807EDE0
	movs r0, #0
	ldrsh r3, [r4, r0]
	subs r3, #0x30
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b _0807EE48
_0807EDE0:
	cmp r0, #0x38
	bgt _0807EDF4
	movs r1, #0
	ldrsh r3, [r4, r1]
	subs r3, #0x34
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	b _0807EE46
_0807EDF4:
	cmp r0, #0x3a
	bgt _0807EE0A
	movs r2, #0
	ldrsh r3, [r4, r2]
	subs r3, #0x38
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	b _0807EE48
_0807EE0A:
	cmp r0, #0x3c
	bgt _0807EE1E
	movs r7, #0
	ldrsh r3, [r4, r7]
	subs r3, #0x3a
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	b _0807EE46
_0807EE1E:
	cmp r0, #0x3d
	bgt _0807EE34
	movs r0, #0
	ldrsh r3, [r4, r0]
	subs r3, #0x3c
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #4
	b _0807EE48
_0807EE34:
	cmp r0, #0x3e
	bgt _0807EE4E
	movs r1, #0
	ldrsh r3, [r4, r1]
	subs r3, #0x3d
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #4
_0807EE46:
	movs r2, #0
_0807EE48:
	bl Interpolate
	str r0, [r6, #0x2c]
_0807EE4E:
	movs r4, #0
	movs r2, #0x4c
	adds r2, r2, r6
	mov sb, r2
	ldr r7, _0807EE90 @ =gUnknown_081D9368
	mov r8, r7
	movs r5, #0xa0
	lsls r5, r5, #2
_0807EE5E:
	lsls r1, r4, #6
	ldr r0, [r6, #0x2c]
	adds r0, #0x38
	adds r1, r1, r0
	ldr r0, _0807EE94 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #7
	orrs r0, r5
	str r0, [sp]
	movs r0, #0
	movs r2, #0x30
	mov r7, r8
	ldr r3, [r7]
	bl PutSprite
	adds r5, #0x40
	adds r4, #1
	cmp r4, #1
	ble _0807EE5E
	movs r4, #0
	movs r5, #0xf0
	lsls r5, r5, #2
	b _0807EEB8
	.align 2, 0
_0807EE90: .4byte gUnknown_081D9368
_0807EE94: .4byte 0x000001FF
_0807EE98:
	bl sub_0803BD14
	adds r1, r0, #0
	subs r1, #3
	subs r1, r4, r1
	lsls r1, r1, #4
	adds r1, #0x6f
	movs r2, #0x90
	lsls r2, r2, #8
	orrs r2, r5
	movs r0, #0xc0
	movs r3, #0
	bl sub_08043B60
	adds r5, #0xc
	adds r4, #1
_0807EEB8:
	bl sub_0803BD14
	cmp r4, r0
	blt _0807EE98
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x5f
	ble _0807EED4
	movs r0, #0
	strh r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0807EED4:
	mov r7, sb
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

