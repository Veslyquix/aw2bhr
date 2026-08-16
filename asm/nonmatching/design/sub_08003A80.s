	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003A80
sub_08003A80: @ 0x08003A80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r7, r1, #0
	mov sb, r2
	str r3, [sp]
	bl sub_08012358
	ldr r2, _08003B40 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r6, #8
	orrs r0, r6
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #2
	orrs r0, r1
	movs r3, #4
	mov r8, r3
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	orrs r0, r5
	strb r0, [r2, #1]
	ldr r0, _08003B44 @ =gUnknown_03001FFC
	movs r4, #0
	strh r4, [r0]
	ldr r1, _08003B48 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _08003B4C @ =gUnknown_03002B28
	strh r4, [r0]
	ldr r1, _08003B50 @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r0, _08003B54 @ =gUnknown_03002B40
	mov r3, sl
	strb r3, [r0]
	ldr r0, _08003B58 @ =gUnknown_03002B4C
	strb r7, [r0]
	ldr r0, _08003B5C @ =gUnknown_03002EFC
	mov r7, sb
	strb r7, [r0]
	ldr r0, _08003B60 @ =gUnknown_03002B44
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r1, _08003B64 @ =gUnknown_030030A4
	ldrb r0, [r1]
	movs r3, #1
	orrs r0, r3
	movs r7, #2
	orrs r0, r7
	mov r7, r8
	orrs r0, r7
	orrs r0, r6
	orrs r0, r5
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _08003B68 @ =gUnknown_030030DC
	strh r4, [r2]
	ldrb r0, [r2]
	orrs r0, r3
	mov r1, r8
	orrs r0, r1
	movs r3, #2
	orrs r0, r3
	orrs r0, r6
	orrs r0, r5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B40: .4byte gUnknown_030030E0
_08003B44: .4byte gUnknown_03001FFC
_08003B48: .4byte gUnknown_03002020
_08003B4C: .4byte gUnknown_03002B28
_08003B50: .4byte gUnknown_030030CC
_08003B54: .4byte gUnknown_03002B40
_08003B58: .4byte gUnknown_03002B4C
_08003B5C: .4byte gUnknown_03002EFC
_08003B60: .4byte gUnknown_03002B44
_08003B64: .4byte gUnknown_030030A4
_08003B68: .4byte gUnknown_030030DC

