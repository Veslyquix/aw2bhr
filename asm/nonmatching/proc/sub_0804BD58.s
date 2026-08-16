	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BD58
sub_0804BD58: @ 0x0804BD58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r1
	movs r1, #0
	mov ip, r1
	ldr r1, _0804BDD4 @ =gUnknown_08136048
	mov sl, r1
	movs r1, #0x1f
	mov r8, r1
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r4, r0, #0
	mov r0, sl
	ldr r5, [r0]
_0804BD7E:
	ldrh r0, [r4]
	mov r2, r8
	ands r2, r0
	adds r2, #0x1f
	asrs r2, r2, #1
	mov r1, r8
	ands r2, r1
	ldrh r0, [r4]
	adds r1, r7, #0
	ands r1, r0
	adds r1, r1, r7
	asrs r1, r1, #1
	ands r1, r7
	ldrh r3, [r4]
	adds r0, r6, #0
	ands r0, r3
	adds r0, r0, r6
	asrs r0, r0, #1
	ands r0, r6
	adds r2, r2, r1
	adds r2, r2, r0
	strh r2, [r5]
	adds r4, #2
	adds r5, #2
	movs r0, #1
	add ip, r0
	mov r1, ip
	cmp r1, #0x3f
	ble _0804BD7E
	mov r1, sl
	ldr r0, [r1]
	mov r1, sb
	movs r2, #0x10
	bl CpuFastSet
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDD4: .4byte gUnknown_08136048

