	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080488E0
sub_080488E0: @ 0x080488E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08048914 @ =gUnknown_0812A148
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r3, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _080489B2
	movs r0, #0
	mov r8, r0
	ldrb r0, [r2]
	cmp r0, #2
	beq _0804892A
	cmp r0, #2
	bgt _08048918
	cmp r0, #1
	beq _0804891E
	b _0804893E
	.align 2, 0
_08048914: .4byte gUnknown_0812A148
_08048918:
	cmp r0, #3
	beq _08048924
	b _0804893E
_0804891E:
	mov r1, r8
	strb r1, [r2]
	b _0804893E
_08048924:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0804892A:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
_0804893E:
	mov r0, r8
	adds r1, r3, #0
	bl sub_08048850
	movs r1, #2
	ldr r2, _080489C4 @ =gUnknown_08499578
	mov sl, r2
	ldr r0, _080489C8 @ =gUnknown_084C30F8
	mov sb, r0
	mov r2, r8
	adds r2, #1
	str r2, [sp]
_08048956:
	movs r4, #0
	lsls r7, r1, #5
	mov r2, r8
	adds r0, r1, r2
	adds r2, r1, #2
	mov ip, r2
	lsls r6, r0, #5
	ldr r2, [sp]
	adds r0, r1, r2
	lsls r5, r0, #5
_0804896A:
	mov r0, sl
	ldr r1, [r0]
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r3, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r2, r3, r1
	mov r0, sb
	ldr r1, [r0]
	adds r0, r6, r4
	lsls r0, r0, #1
	adds r1, #0x32
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r2, r3, r0
	adds r0, r5, r4
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _0804896A
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bls _08048956
	bl sub_08013AEC
_080489B2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080489C4: .4byte gUnknown_08499578
_080489C8: .4byte gUnknown_084C30F8

