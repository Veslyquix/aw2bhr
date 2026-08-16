	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014400
sub_08014400: @ 0x08014400
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08014478 @ =gUnknown_08489518
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	beq _08014418
	b _080145B0
_08014418:
	ldr r0, _0801447C @ =gUnknown_0848A398
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, r6
	beq _08014428
	b _080145B0
_08014428:
	ldr r0, _08014480 @ =gUnknown_0848A3C4
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	beq _08014438
	b _080145B0
_08014438:
	bl sub_08014BE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08014490
	ldr r0, _08014484 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08014490
	ldr r1, _08014488 @ =gUnknown_03002514
	ldrb r0, [r1]
	cmp r0, #0
	bne _08014490
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08013D64
	bl sub_080179D0
	ldr r0, [r4, #0x3c]
	bl _call_via_r0
	ldr r0, _0801448C @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_08015328
	b _080145B0
	.align 2, 0
_08014478: .4byte gUnknown_08489518
_0801447C: .4byte gUnknown_0848A398
_08014480: .4byte gUnknown_0848A3C4
_08014484: .4byte gpKeySt
_08014488: .4byte gUnknown_03002514
_0801448C: .4byte gUnknown_03001FBC
_08014490:
	adds r0, r4, #0
	adds r0, #0x3a
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #1
	ble _080144B2
	ldr r0, _080144FC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080144B2
	adds r0, r4, #0
	bl sub_08014074
_080144B2:
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	adds r7, r1, #0
	cmp r2, #0
	blt _080144D6
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r2, r0
	blt _080145B0
	cmp r2, #0
	blt _080144D6
	movs r0, #0
	strb r0, [r7]
_080144D6:
	ldr r0, [r4, #0x3c]
	bl _call_via_r0
_080144DC:
	adds r0, r4, #0
	bl sub_08013D4C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08014084
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _0801451C
	cmp r0, #1
	bgt _08014500
	cmp r0, #0
	beq _0801450A
	b _0801451C
	.align 2, 0
_080144FC: .4byte gpKeySt
_08014500:
	cmp r0, #2
	beq _080145B0
	cmp r0, #3
	beq _080145A8
	b _0801451C
_0801450A:
	ldr r0, _08014518 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl sub_08015328
	b _080145B0
	.align 2, 0
_08014518: .4byte gUnknown_03001FBC
_0801451C:
	adds r0, r4, #0
	adds r0, #0x32
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x40
	ldrb r1, [r1]
	cmp r0, r1
	bne _08014536
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801453E
_08014536:
	adds r0, r4, #0
	movs r1, #1
	bl sub_08014CA4
_0801453E:
	ldr r0, [r4, #0x20]
	ldrb r0, [r0]
	ldr r1, _080145B8 @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldrh r2, [r4, #0x34]
	lsls r2, r2, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r2, r2, r3
	adds r1, r1, r2
	ldrb r2, [r5]
	ldrh r3, [r4, #0x2e]
	bl sub_0801B738
	adds r6, r0, #0
	ldrb r0, [r5]
	cmp r0, #1
	bhi _08014576
	adds r0, r4, #0
	bl sub_08013D4C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080143EC
_08014576:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08014CA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08014592
	adds r0, r4, #0
	bl sub_08013D4C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080143EC
_08014592:
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _080145A2
	movs r0, #0x70
	bl sub_0803B4DC
_080145A2:
	ldr r0, [r4, #0x20]
	adds r0, #1
	str r0, [r4, #0x20]
_080145A8:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _080144DC
_080145B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080145B8: .4byte gUnknown_03002B6C

