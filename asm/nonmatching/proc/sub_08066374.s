	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066374
sub_08066374: @ 0x08066374
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	lsls r0, r0, #6
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	adds r4, r0, r2
	ldr r6, _0806645C @ =gSinLut
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _080663A4
	movs r1, #2
_080663A4:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r2, #0
	ldrsh r6, [r6, r2]
	rsbs r0, r6, #0
	lsls r0, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _080663C0
	movs r1, #2
_080663C0:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r6, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _080663D4
	movs r1, #2
_080663D4:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _080663E4
	movs r1, #2
_080663E4:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r5, #0x1c]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl SetObjAffine
	movs r1, #0x28
	ldrsh r0, [r5, r1]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, _08066460 @ =0x000001FF
	ands r0, r1
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	add r1, sl
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08066464 @ =gUnknown_08580CFC
	ldrh r2, [r5, #0x1c]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl sub_0801BD00
	ldrh r0, [r5, #0x26]
	subs r0, #1
	strh r0, [r5, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0806644C
	movs r0, #3
	strh r0, [r5, #0x26]
	ldr r0, _08066468 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r0, _0806646C @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x70
	ldrh r5, [r5, #0x1c]
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
_0806644C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806645C: .4byte gSinLut
_08066460: .4byte 0x000001FF
_08066464: .4byte gUnknown_08580CFC
_08066468: .4byte gUnknown_03001FBC
_0806646C: .4byte gUnknown_08580934

