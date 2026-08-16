	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B4C4
sub_0804B4C4: @ 0x0804B4C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	movs r5, #0
	movs r6, #0
	ldr r0, _0804B548 @ =gUnknown_08499590
	ldr r3, [r0]
	ldr r1, _0804B54C @ =gUnknown_08551CDC
	ldr r0, _0804B550 @ =0x0000417A
	adds r0, r0, r3
	mov ip, r0
	ldr r2, _0804B554 @ =0x00001432
	adds r2, r3, r2
	str r2, [sp]
	ldr r7, _0804B558 @ =gUnknown_08551CBD
	mov sl, r7
	movs r4, #3
_0804B4F0:
	ldr r0, [r1]
	mov r7, sb
	adds r2, r7, r0
	ldr r0, [r1, #4]
	add r0, r8
	ldrh r7, [r3]
	cmp r2, r7
	bgt _0804B52E
	cmp r2, #0
	blt _0804B52E
	ldrh r7, [r3, #2]
	cmp r0, r7
	bgt _0804B52E
	cmp r0, #0
	blt _0804B52E
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	adds r0, r0, r2
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r2, #0x1f
	ands r2, r0
	mov r7, sl
	adds r0, r2, r7
	ldrb r7, [r0]
	cmp r5, r7
	bhs _0804B52E
	adds r6, r2, #0
	ldrb r5, [r0]
_0804B52E:
	adds r1, #8
	subs r4, #1
	cmp r4, #0
	bge _0804B4F0
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B548: .4byte gUnknown_08499590
_0804B54C: .4byte gUnknown_08551CDC
_0804B550: .4byte 0x0000417A
_0804B554: .4byte 0x00001432
_0804B558: .4byte gUnknown_08551CBD

