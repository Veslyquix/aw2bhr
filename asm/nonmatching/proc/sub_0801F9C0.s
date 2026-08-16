	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F9C0
sub_0801F9C0: @ 0x0801F9C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	mov r5, ip
	mov r4, r8
	adds r0, r4, r5
	cmp r4, r0
	bgt _0801FA48
	ldr r6, _0801FABC @ =gUnknown_08499590
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r4, r0
	bge _0801FA48
	mov sl, r6
_0801F9FA:
	ldr r0, [sp]
	subs r1, r0, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801FA0A
	adds r0, r0, r1
	movs r1, #0
_0801FA0A:
	adds r2, r1, r0
	mov r3, sl
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r2, r0
	ble _0801FA18
	adds r2, r0, #0
_0801FA18:
	subs r5, #1
	adds r7, r4, #1
	mov r6, r8
	add r6, ip
	cmp r1, r2
	bge _0801FA38
	lsls r0, r4, #2
	ldr r4, _0801FAC0 @ =gUnknown_03003340
	adds r3, r0, r4
_0801FA2A:
	ldr r0, [r3]
	adds r0, r0, r1
	mov r4, sb
	strb r4, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801FA2A
_0801FA38:
	adds r4, r7, #0
	cmp r4, r6
	bgt _0801FA48
	mov r7, sl
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r4, r0
	blt _0801F9FA
_0801FA48:
	mov r5, ip
	subs r5, #1
	mov r4, r8
	subs r4, #1
	mov r0, r8
	mov r1, ip
	subs r6, r0, r1
	cmp r4, r6
	blt _0801FAAA
	cmp r4, #0
	blt _0801FAAA
	ldr r3, _0801FABC @ =gUnknown_08499590
	mov r8, r3
	ldr r7, _0801FAC0 @ =gUnknown_03003340
	mov sl, r7
_0801FA66:
	ldr r0, [sp]
	subs r1, r0, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801FA76
	adds r0, r0, r1
	movs r1, #0
_0801FA76:
	adds r2, r1, r0
	mov r3, r8
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r2, r0
	ble _0801FA84
	adds r2, r0, #0
_0801FA84:
	subs r5, #1
	subs r3, r4, #1
	cmp r1, r2
	bge _0801FAA0
	lsls r0, r4, #2
	mov r7, sl
	adds r4, r0, r7
_0801FA92:
	ldr r0, [r4]
	adds r0, r0, r1
	mov r7, sb
	strb r7, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801FA92
_0801FAA0:
	adds r4, r3, #0
	cmp r3, r6
	blt _0801FAAA
	cmp r3, #0
	bge _0801FA66
_0801FAAA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FABC: .4byte gUnknown_08499590
_0801FAC0: .4byte gUnknown_03003340

