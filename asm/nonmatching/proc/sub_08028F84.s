	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028F84
sub_08028F84: @ 0x08028F84
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08028F92
	rsbs r1, r1, #0
_08028F92:
	movs r2, #0x28
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bge _08028F9C
	rsbs r0, r0, #0
_08028F9C:
	cmp r1, r0
	ble _08028FEE
	ldr r0, _08028FC4 @ =gUnknown_020237B0
	ldrh r1, [r4, #0x2a]
	adds r1, r1, r0
	ldrh r0, [r4, #0x2c]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2c]
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bgt _08028FC8
	movs r5, #0
	cmp r0, #0
	bge _08028FCA
	rsbs r5, r1, #0
	b _08028FCA
	.align 2, 0
_08028FC4: .4byte gUnknown_020237B0
_08028FC8:
	adds r5, r1, #0
_08028FCA:
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x10
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r1, r0, #0
	movs r3, #0x1e
	ldrsh r0, [r4, r3]
	adds r0, r0, r5
	lsls r2, r0, #0x10
	movs r3, #0x20
	ldrsh r0, [r4, r3]
	lsls r0, r0, #0x10
	muls r1, r5, r1
	adds r1, r0, r1
	b _08029038
_08028FEE:
	ldr r0, _08029010 @ =gUnknown_020237B0
	ldrh r1, [r4, #0x2a]
	adds r1, r1, r0
	ldrh r0, [r4, #0x2c]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2c]
	movs r2, #0x28
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _08029014
	movs r5, #0
	cmp r0, #0
	bge _08029016
	rsbs r5, r1, #0
	b _08029016
	.align 2, 0
_08029010: .4byte gUnknown_020237B0
_08029014:
	adds r5, r1, #0
_08029016:
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	lsls r0, r0, #0x10
	movs r2, #0x28
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r1, r0, #0
	movs r3, #0x1e
	ldrsh r0, [r4, r3]
	lsls r0, r0, #0x10
	muls r1, r5, r1
	adds r2, r0, r1
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	lsls r1, r0, #0x10
_08029038:
	ldr r3, _08029070 @ =gUnknown_0201E450
	adds r0, r2, #0
	cmp r0, #0
	bge _08029044
	ldr r2, _08029074 @ =0x0000FFFF
	adds r0, r0, r2
_08029044:
	asrs r0, r0, #0x10
	strh r0, [r3, #4]
	adds r0, r1, #0
	cmp r0, #0
	bge _08029052
	ldr r1, _08029074 @ =0x0000FFFF
	adds r0, r0, r1
_08029052:
	asrs r0, r0, #0x10
	strh r0, [r3, #6]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0
	bne _08029078
	ldrh r0, [r4, #0x22]
	strh r0, [r3, #4]
	ldrh r0, [r4, #0x24]
	strh r0, [r3, #6]
	adds r0, r4, #0
	bl sub_080153B8
	bl sub_08034F8C
	b _0802907C
	.align 2, 0
_08029070: .4byte gUnknown_0201E450
_08029074: .4byte 0x0000FFFF
_08029078:
	subs r0, #1
	strh r0, [r4, #0x2a]
_0802907C:
	bl sub_08023860
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

