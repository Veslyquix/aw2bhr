	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002298
sub_08002298: @ 0x08002298
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r1, #0
	movs r0, #0xff
	ands r7, r0
	ldr r0, _080022C0 @ =gUnknown_0808D710
	ldr r6, [r0]
	ldr r2, [r6]
	adds r5, r2, #0
	adds r5, #0x64
	ldrb r1, [r5]
	adds r4, r0, #0
	cmp r1, #0xa
	beq _0800230E
	cmp r1, #0xa
	bgt _080022C4
	cmp r1, #0
	beq _080022CE
	b _080023A0
	.align 2, 0
_080022C0: .4byte gUnknown_0808D710
_080022C4:
	cmp r1, #0x14
	beq _08002336
	cmp r1, #0x1e
	beq _0800236E
	b _080023A0
_080022CE:
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080022E4
	ldrh r0, [r2, #0x2a]
	bl sub_0800C7E8
	cmp r0, #0
	bne _080022E2
	b _08002506
_080022E2:
	b _080022EC
_080022E4:
	ldrh r0, [r2, #0x24]
	cmp r0, #0x19
	bne _080022EC
	b _08002506
_080022EC:
	ldr r3, [r4]
	ldr r1, [r3]
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	movs r2, #0x32
	cmp r0, #0
	beq _080022FC
	movs r2, #0xa
_080022FC:
	adds r0, r1, #0
	adds r0, #0x64
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, #0x60
	movs r1, #0x8c
	lsls r1, r1, #5
	strh r1, [r0]
	b _080023A0
_0800230E:
	adds r2, #0x60
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0xbe
	lsls r0, r0, #4
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xcc
	lsls r1, r1, #4
	cmp r0, r1
	bgt _080023A0
	strh r1, [r2]
	movs r0, #0x14
	strb r0, [r5]
	b _080023A0
_08002336:
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0800235A
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08002350
	ldrh r0, [r2, #0x2a]
	bl sub_0800C7E8
	cmp r0, #0
	bne _080023A0
_08002350:
	ldr r0, [r6]
	adds r0, #0x64
	movs r1, #0x1e
	strb r1, [r0]
	b _080023A0
_0800235A:
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08002368
	ldrh r0, [r2, #0x24]
	cmp r0, #0x19
	bne _080023A0
_08002368:
	movs r0, #0x1e
	strb r0, [r5]
	b _080023A0
_0800236E:
	adds r3, r2, #0
	adds r3, #0x60
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r1, #0x8c
	lsls r1, r1, #5
	subs r1, r1, r0
	asrs r1, r1, #3
	ldrh r0, [r3]
	adds r1, r1, r0
	strh r1, [r3]
	lsls r1, r1, #0x10
	ldr r0, _080023BC @ =0x10DF0000
	cmp r1, r0
	ble _080023A0
	movs r0, #0x87
	lsls r0, r0, #5
	strh r0, [r3]
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	movs r1, #0
	cmp r0, #0
	bne _0800239E
	movs r1, #0x32
_0800239E:
	strb r1, [r5]
_080023A0:
	ldr r6, [r4]
	ldr r2, [r6]
	adds r5, r2, #0
	adds r5, #0x64
	ldrb r0, [r5]
	cmp r0, #0x46
	beq _0800242E
	cmp r0, #0x46
	bgt _080023C0
	cmp r0, #0x32
	beq _080023C6
	cmp r0, #0x3c
	beq _08002408
	b _08002494
	.align 2, 0
_080023BC: .4byte 0x10DF0000
_080023C0:
	cmp r0, #0x50
	beq _08002466
	b _08002494
_080023C6:
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080023DC
	ldrh r0, [r2, #0x2a]
	bl sub_0800C7E8
	cmp r0, #0
	bne _080023DA
	b _08002506
_080023DA:
	b _080023E4
_080023DC:
	ldrh r0, [r2, #0x24]
	cmp r0, #0x19
	bne _080023E4
	b _08002506
_080023E4:
	ldr r3, [r4]
	ldr r1, [r3]
	movs r2, #0x3e
	ldrsh r0, [r1, r2]
	movs r2, #0
	cmp r0, #0
	bne _080023F4
	movs r2, #0x3c
_080023F4:
	adds r0, r1, #0
	adds r0, #0x64
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, #0x60
	ldr r1, _08002404 @ =0x0000FD80
	strh r1, [r0]
	b _08002494
	.align 2, 0
_08002404: .4byte 0x0000FD80
_08002408:
	adds r2, #0x60
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0xc8
	lsls r0, r0, #2
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xbf
	ble _08002494
	movs r0, #0xc0
	strh r0, [r2]
	movs r0, #0x46
	strb r0, [r5]
	b _08002494
_0800242E:
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08002452
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08002448
	ldrh r0, [r2, #0x2a]
	bl sub_0800C7E8
	cmp r0, #0
	bne _08002494
_08002448:
	ldr r0, [r6]
	adds r0, #0x64
	movs r1, #0x50
	strb r1, [r0]
	b _08002494
_08002452:
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08002460
	ldrh r0, [r2, #0x24]
	cmp r0, #0x19
	bne _08002494
_08002460:
	movs r0, #0x50
	strb r0, [r5]
	b _08002494
_08002466:
	adds r3, r2, #0
	adds r3, #0x60
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, _080024D8 @ =0xFFFFFCE0
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080024DC @ =0xFFFFFD80
	cmp r0, r1
	bgt _08002494
	strh r1, [r3]
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	movs r1, #0
	cmp r0, #0
	bne _08002492
	movs r1, #0x32
_08002492:
	strb r1, [r5]
_08002494:
	ldr r4, [r4]
	ldr r0, [r4]
	adds r0, #0x60
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x14
	adds r1, r5, #0
	subs r1, #0xc
	ldr r6, _080024E0 @ =0x000001FF
	ands r1, r6
	adds r2, r7, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x54
	movs r3, #0
	bl sub_0801F34C
	ldr r4, [r4]
	movs r0, #7
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080024E4
	adds r0, r5, #0
	adds r0, #0x1a
	ands r0, r6
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x12
	ldrsb r3, [r4, r3]
	movs r2, #0x3c
	subs r2, r2, r3
	bl sub_0802BD54
	b _08002506
	.align 2, 0
_080024D8: .4byte 0xFFFFFCE0
_080024DC: .4byte 0xFFFFFD80
_080024E0: .4byte 0x000001FF
_080024E4:
	adds r0, r5, #0
	adds r0, #0x1a
	ands r0, r6
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r2, r4, r2
	movs r3, #0x12
	ldrsb r3, [r2, r3]
	movs r2, #0x32
	subs r2, r2, r3
	bl sub_0802BD54
_08002506:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

