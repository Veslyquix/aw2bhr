	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008A8C
sub_08008A8C: @ 0x08008A8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _08008B30 @ =gUnknown_08499590
	ldr r3, [r0]
	lsls r2, r2, #1
	ldr r6, _08008B34 @ =0x0000417A
	adds r0, r3, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r1
	adds r3, #0x12
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08008B60
	ldr r2, _08008B38 @ =gUnknown_08499594
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r7, r1, r0
	cmp r5, #0
	beq _08008B58
	ldr r2, _08008B3C @ =gDispIo
	ldrb r0, [r2, #1]
	movs r3, #0x20
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _08008B40 @ =gUnknown_03002B40
	strb r4, [r0]
	ldr r0, _08008B44 @ =gUnknown_03002EFC
	strb r4, [r0]
	ldr r0, _08008B48 @ =gUnknown_03002B4C
	strb r4, [r0]
	ldr r0, _08008B4C @ =gUnknown_03002B44
	strb r4, [r0]
	ldr r0, _08008B50 @ =gUnknown_030030A4
	mov sb, r0
	ldrb r0, [r0]
	subs r1, #0xa0
	ands r1, r0
	ldr r2, _08008B54 @ =gUnknown_030030DC
	ldrb r0, [r2, #1]
	orrs r0, r3
	strb r0, [r2, #1]
	movs r6, #1
	mov r8, r6
	mov r0, r8
	orrs r1, r0
	movs r6, #2
	orrs r1, r6
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r0, sb
	strb r1, [r0]
	ldrb r0, [r2]
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	adds r0, r7, #0
	bl sub_0804018C
	b _08008B5A
	.align 2, 0
_08008B30: .4byte gUnknown_08499590
_08008B34: .4byte 0x0000417A
_08008B38: .4byte gUnknown_08499594
_08008B3C: .4byte gDispIo
_08008B40: .4byte gUnknown_03002B40
_08008B44: .4byte gUnknown_03002EFC
_08008B48: .4byte gUnknown_03002B4C
_08008B4C: .4byte gUnknown_03002B44
_08008B50: .4byte gUnknown_030030A4
_08008B54: .4byte gUnknown_030030DC
_08008B58:
	strb r4, [r7]
_08008B5A:
	bl sub_080088F0
	movs r4, #1
_08008B60:
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

