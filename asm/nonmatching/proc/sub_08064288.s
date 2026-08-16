	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064288
sub_08064288: @ 0x08064288
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
_0806429C:
	ldr r0, _08064400 @ =gUnknown_0202F110
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #3
	adds r7, r1, r0
	ldrb r0, [r7, #2]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08064404 @ =gUnknown_0202F140
	adds r4, r4, r0
	str r4, [sp, #4]
	ldrb r0, [r7, #3]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #3
	ldr r1, _08064404 @ =gUnknown_0202F140
	adds r3, r3, r1
	str r3, [sp, #8]
	ldrb r0, [r7, #4]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r1
	str r2, [sp, #0xc]
	ldrb r0, [r7, #5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08064404 @ =gUnknown_0202F140
	adds r1, r1, r0
	str r1, [sp, #0x10]
	ldr r6, [r4, #0xc]
	ldr r0, [r3, #0xc]
	adds r6, r6, r0
	ldr r0, [r2, #0xc]
	adds r6, r6, r0
	ldr r0, [r1, #0xc]
	adds r6, r6, r0
	asrs r6, r6, #9
	ldr r5, [r4, #0x10]
	ldr r0, [r3, #0x10]
	adds r5, r5, r0
	ldr r0, [r2, #0x10]
	adds r5, r5, r0
	ldr r0, [r1, #0x10]
	adds r5, r5, r0
	asrs r5, r5, #9
	ldr r1, [sp, #0x14]
	adds r0, r1, r6
	ldr r2, [sp, #0x18]
	adds r1, r2, r5
	ldr r2, _08064408 @ =gUnknown_0858092C
	movs r3, #0
	bl sub_0801BD00
	ldr r4, [sp, #8]
	ldr r2, [sp, #4]
	ldr r1, [r4, #0xc]
	ldr r0, [r2, #0xc]
	mov sl, r0
	subs r1, r1, r0
	asrs r1, r1, #5
	movs r0, #0x80
	lsls r0, r0, #9
	str r2, [sp, #0x20]
	bl __divsi3
	mov r8, r0
	ldr r1, [r4, #0x10]
	ldr r2, [sp, #0x20]
	ldr r2, [r2, #0x10]
	mov sb, r2
	subs r1, r1, r2
	asrs r1, r1, #5
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	adds r3, r0, #0
	ldr r2, [sp, #0xc]
	ldr r1, [r2, #0xc]
	mov r0, sl
	subs r1, r1, r0
	asrs r1, r1, #5
	movs r0, #0x80
	lsls r0, r0, #9
	str r2, [sp, #0x20]
	str r3, [sp, #0x24]
	bl __divsi3
	adds r4, r0, #0
	ldr r2, [sp, #0x20]
	ldr r1, [r2, #0x10]
	mov r2, sb
	subs r1, r1, r2
	asrs r1, r1, #5
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	ldr r1, [sp, #0x1c]
	adds r1, #0x10
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, [sp, #0x24]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
	adds r2, r4, #0
	bl sub_0801E108
	subs r6, #0x20
	ldr r0, [sp, #0x14]
	adds r6, r0, r6
	subs r5, #0x20
	ldr r1, [sp, #0x18]
	adds r5, r1, r5
	ldr r1, _0806440C @ =gUnknown_08580914
	ldr r2, [sp, #0x1c]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrh r3, [r7]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0801BD00
	ldr r0, [sp, #0x1c]
	adds r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #0
	bgt _080643B6
	b _0806429C
_080643B6:
	ldr r4, _08064404 @ =gUnknown_0202F140
	adds r6, r4, #0
	adds r6, #0x10
	movs r5, #0
	movs r1, #7
	str r1, [sp, #0x1c]
_080643C2:
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
	asrs r0, r0, #7
	ldr r1, [r6]
	asrs r1, r1, #7
	ldr r2, [sp, #0x14]
	adds r0, r2, r0
	ldr r2, [sp, #0x18]
	adds r1, r2, r1
	ldr r2, _08064408 @ =gUnknown_0858092C
	movs r3, #0
	bl sub_0801BD00
	adds r6, #0x18
	adds r5, #0x18
	ldr r0, [sp, #0x1c]
	subs r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #0
	bge _080643C2
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064400: .4byte gUnknown_0202F110
_08064404: .4byte gUnknown_0202F140
_08064408: .4byte gUnknown_0858092C
_0806440C: .4byte gUnknown_08580914

