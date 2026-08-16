	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016A54
sub_08016A54: @ 0x08016A54
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r3, _08016B1C @ =gUnknown_0808E53C
	ldr r0, [r3]
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	movs r2, #1
	strb r2, [r0, #0xe]
	strb r1, [r0, #0x14]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	strb r1, [r0, #0xf]
	movs r4, #0
	mov sb, r3
_08016A7C:
	adds r0, r4, #0
	movs r1, #0
	bl SetLoadedCoPalette
	adds r4, #1
	cmp r4, #0x12
	ble _08016A7C
	bl sub_0803BA1C
	mov r0, sb
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x10]
	strh r0, [r1, #0x12]
	movs r4, #0
	ldr r1, _08016B20 @ =gUnknown_0200C078
	mov r8, r1
	movs r5, #0
	mov ip, r5
	ldr r6, _08016B24 @ =0xFFF000FF
	movs r7, #0xf
_08016AA6:
	mov r0, r8
	adds r2, r5, r0
	movs r3, #4
_08016AAC:
	mov r1, ip
	strb r1, [r2]
	ldr r0, [r2]
	ands r0, r6
	str r0, [r2]
	ldrh r1, [r2, #2]
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r2, #2]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08016AAC
	adds r5, #0x14
	adds r4, #1
	cmp r4, #0x1d
	ble _08016AA6
	movs r4, #0
	ldr r0, _08016B28 @ =gUnknown_0200C2D0
	mov r8, r0
	mov ip, r4
	ldr r6, _08016B24 @ =0xFFF000FF
	movs r7, #0xf
_08016ADA:
	adds r5, r4, #1
	lsls r0, r4, #3
	mov r1, r8
	adds r2, r0, r1
	movs r3, #1
_08016AE4:
	mov r0, ip
	strb r0, [r2]
	ldr r0, [r2]
	ands r0, r6
	str r0, [r2]
	ldrh r1, [r2, #2]
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r2, #2]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08016AE4
	adds r4, r5, #0
	cmp r4, #0x29
	ble _08016ADA
	movs r4, #0
	bl sub_0803C670
	mov r1, sb
	ldr r0, [r1]
	strb r4, [r0, #8]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016B1C: .4byte gUnknown_0808E53C
_08016B20: .4byte gUnknown_0200C078
_08016B24: .4byte 0xFFF000FF
_08016B28: .4byte gUnknown_0200C2D0

