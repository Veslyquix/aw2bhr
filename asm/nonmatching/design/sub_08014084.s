	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014084
sub_08014084: @ 0x08014084
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
_0801408C:
	ldr r0, [r5, #0x20]
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0x83
	bgt _080140A6
	cmp r1, #0x80
	blt _080140A6
	adds r0, r1, #0
	subs r0, #0x80
	strh r0, [r5, #0x2e]
	adds r0, r6, #1
	str r0, [r5, #0x20]
	b _0801408C
_080140A6:
	ldrb r0, [r6]
	cmp r0, #0x17
	bls _080140AE
	b _080143E0
_080140AE:
	lsls r0, r0, #2
	ldr r1, _080140B8 @ =_080140BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080140B8: .4byte _080140BC
_080140BC: @ jump table
	.4byte _0801411C @ case 0
	.4byte _080143E0 @ case 1
	.4byte _080143E0 @ case 2
	.4byte _080143E0 @ case 3
	.4byte _080143E0 @ case 4
	.4byte _080143E0 @ case 5
	.4byte _080143E0 @ case 6
	.4byte _080143E0 @ case 7
	.4byte _080143E0 @ case 8
	.4byte _08014390 @ case 9
	.4byte _080142A0 @ case 10
	.4byte _0801426C @ case 11
	.4byte _08014208 @ case 12
	.4byte _08014182 @ case 13
	.4byte _08014242 @ case 14
	.4byte _080141AA @ case 15
	.4byte _080143E0 @ case 16
	.4byte _080143E0 @ case 17
	.4byte _080143E0 @ case 18
	.4byte _080143E0 @ case 19
	.4byte _0801413A @ case 20
	.4byte _080143E0 @ case 21
	.4byte _0801413A @ case 22
	.4byte _0801413A @ case 23
_0801411C:
	ldr r0, [r5, #0x24]
	cmp r0, #0
	bne _08014126
	movs r0, #0
	b _080143E2
_08014126:
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r5, #0x24]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08014084
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _080143E2
_0801413A:
	ldr r0, _08014168 @ =gUnknown_0848A3C4
	movs r1, #0
	bl sub_080152EC
	adds r6, r0, #0
	adds r0, r7, #2
	str r0, [r6, #0x18]
	adds r0, r5, #0
	bl sub_08013D64
	str r0, [r6, #0x28]
	ldr r0, [r5, #0x3c]
	str r0, [r6, #0x2c]
	ldrh r0, [r5, #0x2c]
	movs r1, #0
	strh r0, [r6, #0x30]
	ldr r0, [r5, #0x20]
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0801416C
	movs r0, #1
	strh r0, [r6, #0x1e]
	b _0801416E
	.align 2, 0
_08014168: .4byte gUnknown_0848A3C4
_0801416C:
	strh r1, [r6, #0x1e]
_0801416E:
	ldr r0, [r5, #0x20]
	adds r0, #1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #8
	strb r0, [r1]
	movs r0, #2
	b _080143E2
_08014182:
	adds r1, r5, #0
	adds r1, #0x33
	ldrb r0, [r1]
	adds r0, #2
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	subs r1, #1
	strb r0, [r1]
	ldrh r0, [r5, #0x34]
	adds r0, #2
	movs r1, #0
	strh r0, [r5, #0x34]
	adds r0, r5, #0
	adds r0, #0x40
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	adds r0, #1
	b _080143CC
_080141AA:
	adds r4, r7, #2
	movs r3, #0
	strh r3, [r7, #2]
	adds r2, r7, #0
	adds r2, #0x42
	ldrh r0, [r5, #0x2c]
	movs r7, #0x82
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r6, #1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	ldrh r0, [r5, #0x36]
	strh r0, [r5, #0x34]
	adds r0, r5, #0
	adds r0, #0x40
	strb r3, [r0]
	ldr r0, _08014204 @ =gUnknown_0848A398
	movs r1, #0
	bl sub_080152EC
	adds r6, r0, #0
	str r4, [r6, #0x18]
	adds r0, r5, #0
	bl sub_08013D64
	str r0, [r6, #0x28]
	ldr r0, [r5, #0x3c]
	str r0, [r6, #0x2c]
	bl sub_0803670C
	movs r0, #2
	b _080143E2
	.align 2, 0
_08014204: .4byte gUnknown_0848A398
_08014208:
	adds r0, r6, #1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	ldrh r0, [r5, #0x36]
	movs r1, #0
	strh r0, [r5, #0x34]
	adds r0, r5, #0
	adds r0, #0x40
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_08013D64
	bl sub_080179D0
	ldr r0, [r5, #0x3c]
	bl _call_via_r0
	movs r0, #2
	b _080143E2
_08014242:
	adds r0, r6, #1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08014256
	b _080143CE
_08014256:
	ldr r0, _08014268 @ =gUnknown_08489518
	movs r1, #0
	bl sub_080152EC
	movs r1, #0xa
	strh r1, [r0, #0x1e]
	movs r0, #2
	b _080143E2
	.align 2, 0
_08014268: .4byte gUnknown_08489518
_0801426C:
	adds r0, r6, #1
	str r0, [r5, #0x20]
	ldrb r0, [r6, #1]
	cmp r0, #0x80
	bne _0801427E
	adds r0, r5, #0
	bl sub_08014074
	b _0801429A
_0801427E:
	cmp r0, #0x80
	bge _08014284
	b _080143CE
_08014284:
	cmp r0, #0x89
	ble _0801428A
	b _080143CE
_0801428A:
	adds r0, #0x80
	adds r2, r5, #0
	adds r2, #0x3a
	movs r1, #0
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x39
	strb r1, [r0]
_0801429A:
	ldr r0, [r5, #0x20]
	adds r0, #1
	b _080143CC
_080142A0:
	ldrb r0, [r6, #1]
	cmp r0, #0x80
	bne _0801431C
	ldr r2, _080142D8 @ =gUnknown_08499594
	ldr r0, _080142DC @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080142E0
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _080142E2
	.align 2, 0
_080142D8: .4byte gUnknown_08499594
_080142DC: .4byte gUnknown_030040D8
_080142E0:
	movs r7, #0
_080142E2:
	adds r6, r5, #0
	adds r6, #0x32
	ldrb r1, [r6]
	lsls r1, r1, #1
	ldr r0, [r5, #0x28]
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x33
	ldrb r1, [r1]
	lsls r1, r1, #6
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r2, _08014318 @ =gUnknown_03003F2C
	ldrh r2, [r2]
	ldrb r3, [r4, #7]
	movs r4, #0
	str r4, [sp]
	str r7, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl sub_0802216C
	ldrb r0, [r6]
	adds r0, #2
	strb r0, [r6]
	b _080143C8
	.align 2, 0
_08014318: .4byte gUnknown_03003F2C
_0801431C:
	ldr r2, _0801434C @ =gUnknown_08499594
	ldr r0, _08014350 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08014354
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _08014356
	.align 2, 0
_0801434C: .4byte gUnknown_08499594
_08014350: .4byte gUnknown_030040D8
_08014354:
	movs r7, #0
_08014356:
	adds r6, r5, #0
	adds r6, #0x32
	ldrb r1, [r6]
	lsls r1, r1, #1
	ldr r0, [r5, #0x28]
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x33
	ldrb r1, [r1]
	lsls r1, r1, #6
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r2, _0801438C @ =gUnknown_03003F2C
	ldrh r2, [r2]
	ldrb r3, [r4, #7]
	movs r4, #0
	str r4, [sp]
	str r7, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl sub_0802216C
	ldrb r0, [r6]
	adds r0, #2
	strb r0, [r6]
	b _080143C8
	.align 2, 0
_0801438C: .4byte gUnknown_03003F2C
_08014390:
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	ldr r1, _080143D4 @ =0xFFFF9FB4
	adds r0, r0, r1
	strh r0, [r7]
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	ldr r2, _080143D8 @ =0xFFFF9FB5
	adds r0, r0, r2
	strh r0, [r7, #2]
	adds r1, r7, #0
	adds r1, #0x40
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	adds r2, #1
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #2
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	ldr r7, _080143DC @ =0xFFFF9FB7
	adds r0, r0, r7
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #2
	strb r0, [r1]
_080143C8:
	ldr r0, [r5, #0x20]
	adds r0, #2
_080143CC:
	str r0, [r5, #0x20]
_080143CE:
	movs r0, #3
	b _080143E2
	.align 2, 0
_080143D4: .4byte 0xFFFF9FB4
_080143D8: .4byte 0xFFFF9FB5
_080143DC: .4byte 0xFFFF9FB7
_080143E0:
	movs r0, #1
_080143E2:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

