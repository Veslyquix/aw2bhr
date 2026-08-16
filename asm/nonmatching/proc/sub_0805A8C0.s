	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A8C0
sub_0805A8C0: @ 0x0805A8C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r4, #0
	ldr r0, _0805A940 @ =gUnknown_0816D9A0
	mov sb, r0
	ldr r6, _0805A944 @ =gUnknown_08499598
_0805A8DA:
	mov r1, sb
	ldr r0, [r1]
	ldrh r1, [r0]
	ldr r2, [r6]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	asrs r1, r4
	movs r0, #1
	ands r1, r0
	adds r5, r4, #1
	cmp r1, #0
	beq _0805A948
	adds r0, r5, #0
	bl sub_08026D44
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805A948
	ldr r1, [r6]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0x69
	ldrb r1, [r1]
	mov r2, r8
	subs r1, r2, r1
	adds r1, #2
	adds r0, #0x6a
	ldrb r0, [r0]
	subs r0, r7, r0
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #4
	bhi _0805A948
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0805A948
	cmp r0, #4
	bgt _0805A948
	movs r0, #1
	b _0805A950
	.align 2, 0
_0805A940: .4byte gUnknown_0816D9A0
_0805A944: .4byte gUnknown_08499598
_0805A948:
	adds r4, r5, #0
	cmp r4, #3
	ble _0805A8DA
	movs r0, #0
_0805A950:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

