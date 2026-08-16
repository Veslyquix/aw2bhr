	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800449C
sub_0800449C: @ 0x0800449C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #7
	mov sl, r0
	movs r2, #0
	ldr r0, _08004710 @ =gUnknown_0808D79C
	ldr r3, [r0]
	ldr r1, [r3]
	ldrh r1, [r1, #2]
	cmp r2, r1
	bge _08004514
	mov sb, r3
_080044BC:
	movs r4, #0
	mov r1, sb
	ldr r0, [r1]
	adds r3, r2, #1
	str r3, [sp, #4]
	ldrh r0, [r0]
	cmp r4, r0
	bge _08004508
	ldr r5, _08004714 @ =gUnknown_08499590
	lsls r6, r2, #1
	ldr r7, _08004718 @ =0x0000417A
	mov r8, r7
	ldr r0, _0800471C @ =0x00000A22
	mov ip, r0
_080044D8:
	ldr r2, [r5]
	mov r1, r8
	adds r3, r2, r1
	adds r3, r3, r6
	ldrh r0, [r3]
	adds r0, r0, r4
	lsls r0, r0, #1
	mov r7, ip
	adds r1, r2, r7
	adds r1, r1, r0
	movs r0, #0x2a
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, r0, r4
	ldr r1, _08004720 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	mov r3, sl
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blt _080044D8
_08004508:
	ldr r2, [sp, #4]
	mov r7, sb
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _080044BC
_08004514:
	movs r0, #0x1e
	movs r1, #0x19
	bl sub_08003B6C
	adds r7, r0, #0
	cmp r7, #0
	ble _08004560
_08004522:
	movs r0, #0x1e
	movs r1, #0
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x1e
	movs r1, #0
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #0xa
	movs r1, #6
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #6
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _08004522
_08004560:
	movs r0, #0x1e
	movs r1, #0x19
	bl sub_08003B6C
	adds r7, r0, #0
	cmp r7, #0
	ble _080045AC
_0800456E:
	movs r0, #0x1e
	movs r1, #0
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x1e
	movs r1, #0
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #0xc
	movs r1, #4
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #4
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _0800456E
_080045AC:
	movs r0, #0x64
	movs r1, #0x5a
	bl sub_08003B6C
	mov r8, r0
	movs r4, #0
	movs r7, #0x64
_080045BA:
	movs r0, #0x1d
	movs r1, #0
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x13
	movs r1, #0
	bl sub_08003B6C
	adds r5, r0, #0
	ldr r0, _08004714 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _08004718 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _08004720 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _08004600
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #3
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x20
	bl sub_08007F14
	adds r4, #1
_08004600:
	cmp r4, r8
	bgt _0800460A
	subs r7, #1
	cmp r7, #0
	bgt _080045BA
_0800460A:
	movs r0, #0xa
	movs r1, #7
	bl sub_08003B6C
	adds r7, r0, #0
	mov r8, r7
	cmp r7, #0
	ble _08004658
_0800461A:
	movs r0, #0x1c
	movs r1, #2
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x12
	movs r1, #2
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #4
	movs r1, #2
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #6
	subs r0, r0, r4
	movs r1, #2
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _0800461A
_08004658:
	movs r0, #0xc
	mov r3, r8
	subs r7, r0, r3
	cmp r7, #0
	ble _080046A0
_08004662:
	movs r0, #0x1c
	movs r1, #2
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x12
	movs r1, #2
	bl sub_08003B6C
	adds r5, r0, #0
	movs r0, #4
	movs r1, #2
	bl sub_08003B6C
	adds r4, r0, #0
	movs r0, #6
	subs r0, r0, r4
	movs r1, #2
	bl sub_08003B6C
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0800401C
	subs r7, #1
	cmp r7, #0
	bgt _08004662
_080046A0:
	movs r0, #0x64
	movs r1, #0x50
	bl sub_08003B6C
	mov r8, r0
	movs r4, #0
	movs r7, #0x64
_080046AE:
	movs r0, #0x1a
	movs r1, #4
	bl sub_08003B6C
	adds r6, r0, #0
	movs r0, #0x10
	movs r1, #4
	bl sub_08003B6C
	adds r5, r0, #0
	ldr r0, _08004714 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _08004718 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _08004720 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _080046F4
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #4
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_08007F14
	adds r4, #1
_080046F4:
	cmp r4, r8
	bgt _080046FE
	subs r7, #1
	cmp r7, #0
	bgt _080046AE
_080046FE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004710: .4byte gUnknown_0808D79C
_08004714: .4byte gUnknown_08499590
_08004718: .4byte 0x0000417A
_0800471C: .4byte 0x00000A22
_08004720: .4byte 0x00001432

