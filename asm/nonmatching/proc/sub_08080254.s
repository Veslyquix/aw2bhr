	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080254
sub_08080254: @ 0x08080254
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	mov r7, sl
	adds r7, #0x4c
	movs r1, #0
	ldrsh r3, [r7, r1]
	movs r5, #0x30
	str r5, [sp]
	movs r0, #1
	mov r1, sb
	movs r2, #0
	bl sub_08074234
	adds r4, r0, #0
	ldr r6, _080802F4 @ =0xFFFFFF00
	movs r2, #0
	ldrsh r3, [r7, r2]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_08074234
	adds r4, r4, r0
	ldr r0, _080802F8 @ =gUnknown_03001FF8
	strh r4, [r0]
	ldr r1, _080802FC @ =gUnknown_030030A0
	mov r8, r1
	movs r2, #0
	ldrsh r3, [r7, r2]
	str r5, [sp]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0
	bl sub_08074234
	adds r4, r0, #0
	movs r0, #0
	ldrsh r3, [r7, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	mov r2, sb
	bl sub_08074234
	adds r4, r4, r0
	mov r1, r8
	strh r4, [r1]
	ldr r2, _080802F8 @ =gUnknown_03001FF8
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080802E2
	ldr r3, _08080300 @ =gUnknown_03002B6C
	ldrb r2, [r3, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #1]
	ldr r2, _08080304 @ =gUnknown_030030B4
	ldrb r0, [r2, #1]
	ands r1, r0
	strb r1, [r2, #1]
_080802E2:
	ldrh r1, [r7]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0x2f
	bgt _08080308
	adds r0, r1, #1
	strh r0, [r7]
	b _08080312
	.align 2, 0
_080802F4: .4byte 0xFFFFFF00
_080802F8: .4byte gUnknown_03001FF8
_080802FC: .4byte gUnknown_030030A0
_08080300: .4byte gUnknown_03002B6C
_08080304: .4byte gUnknown_030030B4
_08080308:
	movs r0, #0
	strh r0, [r7]
	mov r0, sl
	bl Proc_Break
_08080312:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

