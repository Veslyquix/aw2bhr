	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005E30
sub_08005E30: @ 0x08005E30
	push {r4, r5, lr}
	ldr r0, _08005E50 @ =gUnknown_0808D7D4
	ldr r4, [r0]
	ldr r2, [r4]
	adds r3, r2, #0
	adds r3, #0x6c
	ldrb r1, [r3]
	adds r5, r0, #0
	cmp r1, #0xa
	beq _08005E80
	cmp r1, #0xa
	bgt _08005E54
	cmp r1, #0
	beq _08005E5A
	b _08005EC8
	.align 2, 0
_08005E50: .4byte gUnknown_0808D7D4
_08005E54:
	cmp r1, #0x14
	beq _08005EB0
	b _08005EC8
_08005E5A:
	adds r0, r2, #0
	adds r0, #0x70
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x85
	lsls r0, r0, #4
	subs r0, r0, r2
	asrs r0, r0, #3
	adds r2, r2, r0
	ldr r0, _08005E7C @ =0x0000082F
	cmp r2, r0
	ble _08005EA8
	movs r2, #0x83
	lsls r2, r2, #4
	movs r0, #0xa
	strb r0, [r3]
	b _08005EA8
	.align 2, 0
_08005E7C: .4byte 0x0000082F
_08005E80:
	adds r0, r2, #0
	adds r0, #0x70
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0xfc
	lsls r0, r0, #3
	subs r0, r0, r2
	asrs r0, r0, #3
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r2, r0
	bgt _08005EA8
	adds r2, r0, #0
	movs r0, #0x14
	strb r0, [r3]
	ldr r0, [r4]
	adds r0, #0x6d
	movs r1, #0x1e
	strb r1, [r0]
_08005EA8:
	ldr r0, [r4]
	adds r0, #0x70
	strh r2, [r0]
	b _08005EC8
_08005EB0:
	adds r0, r2, #0
	adds r0, #0x6d
	ldrb r1, [r0]
	subs r2, r1, #1
	strb r2, [r0]
	lsls r1, r1, #0x18
	cmp r1, #0
	bgt _08005EC8
	ldr r0, [r4]
	adds r0, #0x6c
	movs r1, #0
	strb r1, [r0]
_08005EC8:
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, #0x70
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x14
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r2
	ldr r2, _08005EEC @ =gUnknown_08488664
	movs r3, #0xd0
	lsls r3, r3, #8
	movs r0, #0x78
	bl sub_0801BD00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08005EEC: .4byte gUnknown_08488664

