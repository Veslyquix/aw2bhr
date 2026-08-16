	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BECC
sub_0804BECC: @ 0x0804BECC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r0, r2, #0x10
	mov sl, r0
	asrs r2, r2, #0x10
	adds r0, r2, #0
	mov r1, sp
	bl sub_0801566C
	ldr r2, _0804BFB4 @ =gUnknown_08136050
	ldr r7, [r2]
	mov r0, r8
	lsls r1, r0, #1
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r3, r1, r0
	adds r0, r7, #0
	adds r0, #0x30
	adds r6, r3, r0
	subs r0, #0xa
	adds r4, r3, r0
	ldrh r0, [r4]
	ldrh r1, [r6]
	adds r0, r0, r1
	movs r1, #0
	mov ip, r1
	strh r0, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r2
	cmp r0, #4
	bne _0804BF52
	adds r1, r7, #0
	adds r1, #0x3a
	adds r1, r3, r1
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0804BF38
	mov r0, ip
	strh r0, [r4]
_0804BF38:
	ldr r2, _0804BFB8 @ =gUnknown_02029BE8
	movs r1, #1
	adds r0, r5, #0
	eors r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	bne _0804BF4E
	mov r1, ip
	strh r1, [r4]
_0804BF4E:
	mov r0, ip
	strh r0, [r6]
_0804BF52:
	mov r1, sb
	ldr r2, [r1]
	mov r0, r8
	lsls r1, r0, #1
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x26
	adds r0, r1, r0
	adds r2, #0x30
	adds r1, r1, r2
	ldrh r4, [r1]
	ldrh r0, [r0]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r2, _0804BFBC @ =gUnknown_08553B40
	lsls r1, r4, #1
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r1, [r1]
	mov r3, sp
	lsls r1, r1, #4
	ldrb r2, [r3, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804BFB4: .4byte gUnknown_08136050
_0804BFB8: .4byte gUnknown_02029BE8
_0804BFBC: .4byte gUnknown_08553B40

