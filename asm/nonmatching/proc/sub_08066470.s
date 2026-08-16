	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066470
sub_08066470: @ 0x08066470
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #6
	adds r5, r0, #0
	movs r0, #3
	subs r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r7, r0, r1
	ldr r6, _0806656C @ =gUnknown_0808F100
	adds r0, r6, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	mov r8, r0
	adds r1, r5, #0
	cmp r5, #0
	bne _080664A8
	movs r1, #2
_080664A8:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r0, #0
	ldrsh r6, [r6, r0]
	rsbs r0, r6, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	cmp r7, #0
	bne _080664C4
	movs r1, #2
_080664C4:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r6, #4
	adds r1, r5, #0
	cmp r1, #0
	bne _080664D8
	movs r1, #2
_080664D8:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r7, #0
	cmp r1, #0
	bne _080664E8
	movs r1, #2
_080664E8:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x1c]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sl
	mov r2, sb
	adds r3, r5, #0
	bl sub_0801E108
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, _08066570 @ =0x000001FF
	ands r0, r1
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08066574 @ =gUnknown_08580CFC
	ldrh r2, [r4, #0x1c]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl sub_0801BD00
	ldr r2, _08066578 @ =gUnknown_08580934
	ldr r0, [r2]
	adds r0, #0x70
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806655C
	ldr r0, [r2]
	adds r0, #0x70
	ldrh r4, [r4, #0x1c]
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0806657C @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0806655C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806656C: .4byte gUnknown_0808F100
_08066570: .4byte 0x000001FF
_08066574: .4byte gUnknown_08580CFC
_08066578: .4byte gUnknown_08580934
_0806657C: .4byte gUnknown_03001FBC

