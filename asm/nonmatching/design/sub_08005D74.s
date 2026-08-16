	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005D74
sub_08005D74: @ 0x08005D74
	push {r4, r5, r6, lr}
	ldr r0, _08005D94 @ =gUnknown_0808D7D0
	ldr r5, [r0]
	ldr r2, [r5]
	adds r3, r2, #0
	adds r3, #0x6c
	ldrb r1, [r3]
	adds r6, r0, #0
	cmp r1, #0xa
	beq _08005DBA
	cmp r1, #0xa
	bgt _08005D98
	cmp r1, #0
	beq _08005D9E
	b _08005E00
	.align 2, 0
_08005D94: .4byte gUnknown_0808D7D0
_08005D98:
	cmp r1, #0x14
	beq _08005DE8
	b _08005E00
_08005D9E:
	adds r0, r2, #0
	adds r0, #0x6e
	movs r1, #0
	ldrsh r4, [r0, r1]
	movs r0, #0xb0
	subs r0, r0, r4
	asrs r0, r0, #3
	adds r4, r4, r0
	cmp r4, #0xd0
	bgt _08005DE0
	movs r4, #0xd0
	movs r0, #0xa
	strb r0, [r3]
	b _08005DE0
_08005DBA:
	adds r0, r2, #0
	adds r0, #0x6e
	movs r1, #0
	ldrsh r4, [r0, r1]
	movs r0, #0x90
	lsls r0, r0, #1
	subs r0, r0, r4
	asrs r0, r0, #3
	adds r4, r4, r0
	cmp r4, #0xff
	ble _08005DE0
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #0x14
	strb r0, [r3]
	ldr r0, [r5]
	adds r0, #0x6d
	movs r1, #0x1e
	strb r1, [r0]
_08005DE0:
	ldr r0, [r5]
	adds r0, #0x6e
	strh r4, [r0]
	b _08005E00
_08005DE8:
	adds r0, r2, #0
	adds r0, #0x6d
	ldrb r1, [r0]
	subs r2, r1, #1
	strb r2, [r0]
	lsls r1, r1, #0x18
	cmp r1, #0
	bgt _08005E00
	ldr r0, [r5]
	adds r0, #0x6c
	movs r1, #0
	strb r1, [r0]
_08005E00:
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x6e
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x14
	ldr r0, _08005E28 @ =0x00002078
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r4, r1
	ldr r2, _08005E2C @ =gUnknown_08488664
	movs r3, #0xd0
	lsls r3, r3, #8
	adds r1, r4, #0
	bl sub_0801BD00
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005E28: .4byte 0x00002078
_08005E2C: .4byte gUnknown_08488664

