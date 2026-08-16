	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033B3C
sub_08033B3C: @ 0x08033B3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r3, #0x10
	ldr r0, [r7, #0x4c]
	cmp r0, #8
	beq _08033B68
	cmp r0, #8
	bhi _08033B5C
	cmp r0, #4
	beq _08033B62
	b _08033B72
_08033B5C:
	cmp r0, #0xc
	beq _08033B6E
	b _08033B72
_08033B62:
	movs r0, #0
	str r0, [r7, #0x40]
	b _08033B72
_08033B68:
	movs r0, #0
	str r0, [r7, #0x44]
	b _08033B72
_08033B6E:
	movs r0, #0
	str r0, [r7, #0x48]
_08033B72:
	ldr r0, [r7, #0x4c]
	cmp r0, #0x10
	bhi _08033B7A
	adds r3, r0, #0
_08033B7A:
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r2, #0x38
	bl Interpolate
	movs r6, #0
	movs r0, #0x38
	adds r0, r0, r7
	mov sl, r0
	adds r1, r7, #0
	adds r1, #0x40
	str r1, [sp, #4]
_08033B98:
	lsls r0, r6, #1
	mov r2, sl
	adds r5, r2, r0
	movs r1, #0xf0
	strh r1, [r5]
	lsls r1, r6, #2
	ldr r2, [sp, #4]
	adds r4, r2, r1
	ldr r3, [r4]
	mov r8, r0
	mov sb, r1
	cmp r3, #0x10
	ble _08033BB8
	movs r0, #0x60
	strh r0, [r5]
	b _08033BD6
_08033BB8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _08033BD6
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0xf0
	movs r2, #0x60
	bl Interpolate
	strh r0, [r5]
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
_08033BD6:
	mov r0, sl
	add r0, r8
	ldrh r0, [r0]
	ldr r2, _08033C5C @ =0x000001FF
	adds r1, r2, #0
	ands r1, r0
	ldr r0, _08033C60 @ =gUnknown_0849BC38
	add r0, r8
	ldrh r2, [r0]
	ldr r0, _08033C64 @ =gUnknown_0849BC24
	add r0, sb
	ldr r3, [r0]
	adds r4, r6, #1
	lsls r0, r4, #0xc
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	adds r6, r4, #0
	cmp r6, #2
	ble _08033B98
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	cmp r0, #0x1c
	bls _08033C4C
	movs r0, #0
	str r0, [r7, #0x4c]
	movs r6, #0
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0x36
	adds r1, r1, r7
	mov sb, r1
	mov r5, r8
	adds r4, r7, #0
	adds r4, #0x33
	movs r2, #0
	ldr r3, [sp, #4]
_08033C26:
	adds r1, r5, r6
	adds r0, r4, r6
	strb r2, [r0]
	strb r2, [r1]
	stm r3!, {r2}
	adds r6, #1
	cmp r6, #2
	ble _08033C26
	mov r2, sb
	ldrb r0, [r2]
	add r0, r8
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x3e]
	adds r0, r7, #0
	bl Proc_Break
_08033C4C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033C5C: .4byte 0x000001FF
_08033C60: .4byte gUnknown_0849BC38
_08033C64: .4byte gUnknown_0849BC24

