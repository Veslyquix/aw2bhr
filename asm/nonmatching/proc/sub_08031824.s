	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031824
sub_08031824: @ 0x08031824
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r0, _080318D0 @ =gUnknown_02025764
	mov r8, r0
	movs r3, #0
	ldr r4, _080318D4 @ =gUnknown_02028040
_08031838:
	mov r1, r8
	adds r2, r1, r3
	adds r0, r3, r4
	ldrb r0, [r0]
	ldrb r1, [r2]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #1
	ble _08031838
	movs r3, #0
	mov r6, r8
	adds r6, #5
	movs r2, #0x22
	add r2, r8
	mov sb, r2
	mov r0, r8
	adds r0, #0x34
	str r0, [sp, #0x34]
	mov r4, r8
	adds r4, #2
	ldr r5, _080318D8 @ =gUnknown_0202805A
_08031862:
	adds r2, r4, r3
	adds r0, r3, r5
	ldrb r0, [r0]
	ldrb r1, [r2]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #2
	ble _08031862
	movs r3, #0
	adds r4, r6, #0
	ldr r5, _080318DC @ =gUnknown_02028042
_08031878:
	adds r2, r4, r3
	adds r0, r3, r5
	ldrb r0, [r0]
	ldrb r1, [r2]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #0x17
	ble _08031878
	movs r7, #0
	ldr r1, _080318E0 @ =gUnknown_020280C0
	mov sl, r1
_0803188E:
	lsls r4, r7, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_0803CD14
	lsls r5, r7, #3
	subs r1, r5, r7
	lsls r6, r1, #2
	mov r2, r8
	adds r1, r2, r6
	adds r1, #0x33
	strb r0, [r1]
	adds r0, r4, #0
	mov r1, sp
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080318E4
	movs r3, #0
	adds r4, r7, #1
	mov r0, sb
	adds r1, r6, r0
_080318BE:
	mov r2, sp
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	cmp r3, #0x10
	ble _080318BE
	b _080318FA
	.align 2, 0
_080318D0: .4byte gUnknown_02025764
_080318D4: .4byte gUnknown_02028040
_080318D8: .4byte gUnknown_0202805A
_080318DC: .4byte gUnknown_02028042
_080318E0: .4byte gUnknown_020280C0
_080318E4:
	adds r4, r7, #1
	movs r1, #0
	movs r3, #0x10
	mov r2, sb
	adds r0, r6, r2
	adds r0, #0x10
_080318F0:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _080318F0
_080318FA:
	subs r0, r5, r7
	lsls r0, r0, #2
	ldr r3, _08031944 @ =gUnknown_020280D4
	adds r2, r0, r3
	ldr r3, [sp, #0x34]
	adds r1, r0, r3
	movs r3, #4
_08031908:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _08031908
	subs r0, r5, r7
	lsls r0, r0, #2
	mov r2, r8
	adds r1, r2, r0
	add r0, sl
	ldrb r2, [r0, #0x19]
	adds r3, r1, #0
	adds r3, #0x39
	strb r2, [r3]
	ldrb r0, [r0, #0x1a]
	adds r1, #0x3a
	strb r0, [r1]
	adds r7, r4, #0
	cmp r7, #2
	ble _0803188E
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031944: .4byte gUnknown_020280D4

