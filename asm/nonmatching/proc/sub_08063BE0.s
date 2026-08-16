	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063BE0
sub_08063BE0: @ 0x08063BE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08063C04 @ =gUnknown_0202F0E8
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08063C0C
	ldr r0, _08063C08 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _08063CAE
	.align 2, 0
_08063C04: .4byte gUnknown_0202F0E8
_08063C08: .4byte gUnknown_03001FBC
_08063C0C:
	adds r5, r6, #0
	adds r5, #0x44
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	ldr r4, _08063CC0 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	mov r0, r8
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r0, r4, #0
	lsls r2, r0, #4
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r1, r0, #5
	cmp r1, #0
	bne _08063C4C
	movs r1, #2
_08063C4C:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r4, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r1, r0, #5
	cmp r1, #0
	bne _08063C6E
	movs r1, #2
_08063C6E:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	adds r2, r7, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r0, [r6, #0x24]
	adds r0, #0x78
	movs r1, #0
	ldrsh r2, [r5, r1]
	subs r2, #0x58
	ldr r1, [r6, #0x28]
	subs r1, r1, r2
	ldr r2, _08063CC4 @ =gUnknown_085806F2
	ldrh r3, [r6, #0x1c]
	lsls r3, r3, #2
	bl sub_0801BD00
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bgt _08063CAE
	ldr r0, _08063CC8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08063CAE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063CC0: .4byte gUnknown_0808F100
_08063CC4: .4byte gUnknown_085806F2
_08063CC8: .4byte gUnknown_03001FBC

