	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027CC8
sub_08027CC8: @ 0x08027CC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #2
	bl Div
	ldr r1, [r4, #0x34]
	subs r1, r1, r0
	str r1, [r4, #0x34]
	cmp r1, #4
	bgt _08027CF0
	adds r0, r4, #0
	bl Proc_End
	b _08027DBC
_08027CF0:
	ldr r7, _08027DCC @ =gSinLut
	adds r5, r4, #0
	adds r5, #0x48
	movs r6, #0xff
	ldrb r0, [r5]
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	cmp r1, #0
	bne _08027D0C
	movs r1, #2
_08027D0C:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldrh r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [r4, #0x38]
	cmp r1, #0
	bne _08027D30
	movs r1, #2
_08027D30:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldrh r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldr r1, [r4, #0x34]
	cmp r1, #0
	bne _08027D52
	movs r1, #2
_08027D52:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldrh r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldr r1, [r4, #0x38]
	cmp r1, #0
	bne _08027D76
	movs r1, #2
_08027D76:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x6a
	movs r2, #0
	ldrsh r1, [r5, r2]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sl
	mov r2, sb
	mov r3, r8
	bl SetObjAffine
	ldr r1, [r4, #0x2c]
	ldr r0, _08027DD0 @ =0x000001FF
	ands r1, r0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #9
	orrs r1, r0
	ldr r2, [r4, #0x30]
	ands r2, r6
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	ldr r3, _08027DD4 @ =gUnknown_08499E10
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_08027DBC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027DCC: .4byte gSinLut
_08027DD0: .4byte 0x000001FF
_08027DD4: .4byte gUnknown_08499E10

