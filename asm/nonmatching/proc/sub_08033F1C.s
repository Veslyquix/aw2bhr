	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033F1C
sub_08033F1C: @ 0x08033F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r1, _08033F6C @ =gUnknown_08090D80
	mov sl, r1
	ldr r2, _08033F70 @ =gUnknown_0849BC38
	mov sb, r2
_08033F36:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, r8
	bne _08033F74
	mov r0, r8
	lsls r4, r0, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r1, r5, r4
	movs r0, #0x60
	strh r0, [r1]
	mov r1, sb
	adds r0, r4, r1
	ldrh r1, [r0]
	mov r0, sb
	ldrh r2, [r0, #2]
	ldr r3, [r6, #0x4c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	adds r7, r0, #0
	adds r2, r4, #0
	b _08033F98
	.align 2, 0
_08033F6C: .4byte gUnknown_08090D80
_08033F70: .4byte gUnknown_0849BC38
_08033F74:
	ldr r3, [r6, #0x4c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x60
	movs r2, #0xf0
	bl Interpolate
	mov r1, r8
	lsls r2, r1, #1
	adds r3, r6, #0
	adds r3, #0x38
	adds r1, r3, r2
	strh r0, [r1]
	mov r4, sb
	adds r0, r2, r4
	ldrh r7, [r0]
	adds r5, r3, #0
_08033F98:
	mov r0, sl
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x30
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r5, r2
	ldrh r0, [r0]
	ldr r2, _08033FE4 @ =0x000001FF
	adds r1, r2, #0
	ands r1, r0
	movs r2, #0xff
	ands r2, r7
	mov r4, r8
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r4, #1
	lsls r0, r4, #0xc
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	mov r8, r4
	cmp r4, #2
	ble _08033F36
	ldr r0, [r6, #0x4c]
	cmp r0, #0x10
	bls _08033FE8
	movs r0, #0
	str r0, [r6, #0x4c]
	adds r0, r6, #0
	bl Proc_Break
	b _08033FEC
	.align 2, 0
_08033FE4: .4byte 0x000001FF
_08033FE8:
	adds r0, #1
	str r0, [r6, #0x4c]
_08033FEC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

