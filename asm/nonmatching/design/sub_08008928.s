	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008928
sub_08008928: @ 0x08008928
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sb, r0
	ldr r2, _0800897C @ =gUnknown_030033EC
	ldr r3, _08008980 @ =gUnknown_0808D804
	ldr r4, [r3]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2]
	ldr r2, _08008984 @ =gUnknown_03003F2C
	subs r0, #1
	lsls r0, r0, #6
	strh r0, [r2]
	movs r2, #8
	ldrsh r6, [r1, r2]
	movs r0, #0xa
	ldrsh r7, [r1, r0]
	ldrh r0, [r1, #0x24]
	mov r8, r3
	cmp r0, #0x19
	bne _08008988
	movs r0, #1
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_08008A8C
	cmp r0, #0
	bne _08008972
	b _08008A72
_08008972:
	bl sub_08024268
	movs r1, #2
	mov sb, r1
	b _08008A78
	.align 2, 0
_0800897C: .4byte gUnknown_030033EC
_08008980: .4byte gUnknown_0808D804
_08008984: .4byte gUnknown_03003F2C
_08008988:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08008B70
	adds r5, r0, #0
	ldr r0, [r4]
	ldrh r2, [r0, #0x24]
	cmp r5, r2
	beq _08008A72
	cmp r5, #0x19
	beq _080089C6
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08025308
	cmp r0, #0x31
	ble _080089CA
	asrs r0, r5, #6
	adds r0, #1
	ldr r1, [r4]
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	beq _080089CA
	movs r0, #1
	rsbs r0, r0, #0
	b _08008A7E
_080089C6:
	movs r5, #1
	rsbs r5, r5, #0
_080089CA:
	ldr r0, _08008A5C @ =gUnknown_085D3DD0
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _08008A60 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r4, _08008A64 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _08008A68 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0x1f
	ands r2, r0
	ldr r4, _08008A6C @ =gUnknown_085D5ABC
	mov r0, r8
	ldr r0, [r0]
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #0x24]
	movs r0, #0x3f
	mov sl, r0
	ands r0, r1
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r4
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r3, r3, r2
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08008A70
	cmp r5, #0
	ble _08008A2A
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_08008A8C
_08008A2A:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08025308
	cmp r0, #0x31
	bgt _08008A72
	adds r0, r6, #0
	adds r1, r7, #0
	mov r3, r8
	ldr r2, [r3]
	ldrh r3, [r2, #0x24]
	mov r2, sl
	ands r2, r3
	bl sub_08025CC8
	cmp r0, #0
	beq _08008A72
	movs r4, #1
	mov sb, r4
	b _08008A78
	.align 2, 0
_08008A5C: .4byte gUnknown_085D3DD0
_08008A60: .4byte gUnknown_08499590
_08008A64: .4byte 0x0000417A
_08008A68: .4byte 0x00001432
_08008A6C: .4byte gUnknown_085D5ABC
_08008A70:
	mov sb, r1
_08008A72:
	mov r0, sb
	cmp r0, #0
	ble _08008A7C
_08008A78:
	bl sub_080088F0
_08008A7C:
	mov r0, sb
_08008A7E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

