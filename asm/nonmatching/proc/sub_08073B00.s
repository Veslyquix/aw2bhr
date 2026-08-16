	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073B00
sub_08073B00: @ 0x08073B00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r2, #0xb4
	lsls r2, r2, #1
	ldr r3, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl sub_08074234
	mov r8, r0
	ldr r3, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xf0
	bl sub_08074234
	str r0, [sp, #4]
	ldr r3, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0xa0
	bl sub_08074234
	mov sb, r0
	ldr r1, _08073C68 @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	ldr r1, _08073C68 @ =gUnknown_030030CC
	strb r0, [r1, #1]
	ldr r3, _08073C6C @ =gUnknown_030030A4
	ldrb r0, [r3]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	mov sl, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	ldrb r2, [r3, #1]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	movs r6, #5
	rsbs r6, r6, #0
	ands r0, r6
	movs r5, #9
	rsbs r5, r5, #0
	ands r0, r5
	movs r4, #0x11
	rsbs r4, r4, #0
	ands r0, r4
	strb r0, [r3, #1]
	ldr r2, _08073C70 @ =gUnknown_030030DC
	ldrb r0, [r2]
	ands r1, r0
	mov r0, sl
	ands r1, r0
	ands r1, r6
	ands r1, r5
	ands r1, r4
	strb r1, [r2]
	ldr r1, [sp, #4]
	lsls r4, r1, #1
	subs r4, #0xf0
	mov r5, sb
	subs r5, #0xa0
	movs r6, #0
	str r6, [sp]
	adds r0, r4, #0
	mov r1, sb
	mov r2, r8
	adds r3, r5, #0
	bl sub_08073998
	str r6, [sp]
	adds r0, r4, #0
	mov r1, sb
	ldr r2, [sp, #4]
	movs r3, #0xa0
	bl sub_08073998
	movs r0, #0xa0
	add r8, r0
	mov r1, r8
	mov r0, sb
	subs r1, r1, r0
	mov r8, r1
	movs r4, #1
	str r4, [sp]
	mov r0, r8
	adds r1, r5, #0
	ldr r2, [sp, #4]
	movs r3, #0xa0
	bl sub_08073998
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	bl sub_08073AE8
	ldr r5, _08073C74 @ =0x040000BA
	strh r6, [r5]
	ldr r1, _08073C78 @ =0x040000B0
	mov sl, r1
	ldr r0, _08073C7C @ =gUnknown_0202FDE0
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08073C80 @ =0x040000B4
	mov sb, r0
	subs r0, #0x74
	mov r1, sb
	str r0, [r1]
	adds r0, #0x78
	mov r8, r0
	strh r4, [r0]
	ldr r1, _08073C84 @ =0x0000A640
	adds r0, r1, #0
	strh r0, [r5]
	ldr r1, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	cmp r1, r0
	blt _08073C58
	movs r0, #0
	bl sub_08063928
	strh r6, [r5]
	mov r0, sl
	str r6, [r0]
	mov r1, sb
	str r6, [r1]
	mov r0, r8
	strh r6, [r0]
	ldr r1, _08073C68 @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x7f
	ands r1, r0
	ldr r0, _08073C68 @ =gUnknown_030030CC
	strb r1, [r0, #1]
	adds r0, r7, #0
	bl Proc_Break
_08073C58:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073C68: .4byte gUnknown_030030CC
_08073C6C: .4byte gUnknown_030030A4
_08073C70: .4byte gUnknown_030030DC
_08073C74: .4byte 0x040000BA
_08073C78: .4byte 0x040000B0
_08073C7C: .4byte gUnknown_0202FDE0
_08073C80: .4byte 0x040000B4
_08073C84: .4byte 0x0000A640

