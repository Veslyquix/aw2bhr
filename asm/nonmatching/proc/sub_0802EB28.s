	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802EB28
sub_0802EB28: @ 0x0802EB28
	push {r4, r5, lr}
	ldr r5, _0802EB3C @ =gUnknown_03000574
	ldr r3, [r5]
	cmp r3, #0
	beq _0802EB44
	cmp r3, #1
	beq _0802EBA8
	ldr r0, _0802EB40 @ =gUnknown_0300055C
	ldr r0, [r0]
	b _0802EC54
	.align 2, 0
_0802EB3C: .4byte gUnknown_03000574
_0802EB40: .4byte gUnknown_0300055C
_0802EB44:
	ldr r0, _0802EB8C @ =0x04000134
	strh r3, [r0]
	ldr r1, _0802EB90 @ =0x0400012A
	ldr r0, _0802EB94 @ =gUnknown_03003F6C
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	mvns r0, r0
	strh r0, [r1]
	ldr r2, _0802EB98 @ =0x04000128
	ldr r0, _0802EB9C @ =gUnknown_03000560
	ldr r0, [r0]
	movs r4, #0xc0
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	adds r1, r0, #0
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802EC50
	ldr r2, _0802EBA0 @ =gUnknown_0300055C
	movs r0, #4
	ands r1, r0
	str r1, [r2]
	ldr r0, [r2]
	cmp r0, #0
	beq _0802EB82
	movs r0, #0xf0
	str r0, [r2]
_0802EB82:
	ldr r0, _0802EBA4 @ =gUnknown_02023894
	str r3, [r0]
	movs r0, #1
	str r0, [r5]
	b _0802EC50
	.align 2, 0
_0802EB8C: .4byte 0x04000134
_0802EB90: .4byte 0x0400012A
_0802EB94: .4byte gUnknown_03003F6C
_0802EB98: .4byte 0x04000128
_0802EB9C: .4byte gUnknown_03000560
_0802EBA0: .4byte gUnknown_0300055C
_0802EBA4: .4byte gUnknown_02023894
_0802EBA8:
	ldr r0, _0802EBF4 @ =0x04000128
	ldrh r0, [r0]
	adds r1, r0, #0
	ldr r0, _0802EBF8 @ =gUnknown_02023894
	ldr r0, [r0]
	cmp r0, #0
	beq _0802EC08
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802EC08
	ldr r4, _0802EBFC @ =gUnknown_0300055C
	movs r0, #0x30
	ands r0, r1
	asrs r0, r0, #4
	str r0, [r4]
	ldr r2, _0802EC00 @ =gUnknown_03000564
	ldr r0, [r2]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, [r2]
	movs r3, #2
	orrs r0, r3
	str r0, [r2]
	ldr r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, r1
	bne _0802EBEC
	ldr r0, _0802EC04 @ =gUnknown_03000570
	str r3, [r0]
_0802EBEC:
	str r3, [r5]
	ldr r0, [r4]
	b _0802EC54
	.align 2, 0
_0802EBF4: .4byte 0x04000128
_0802EBF8: .4byte gUnknown_02023894
_0802EBFC: .4byte gUnknown_0300055C
_0802EC00: .4byte gUnknown_03000564
_0802EC04: .4byte gUnknown_03000570
_0802EC08:
	ldr r1, _0802EC2C @ =0x0400012A
	ldr r0, _0802EC30 @ =gUnknown_03003F6C
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	mvns r0, r0
	strh r0, [r1]
	ldr r0, _0802EC34 @ =gUnknown_0300055C
	ldr r0, [r0]
	cmp r0, #0
	beq _0802EC40
	ldr r2, _0802EC38 @ =0x04000128
	ldr r0, _0802EC3C @ =gUnknown_03000560
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r1, r3, #0
	b _0802EC4C
	.align 2, 0
_0802EC2C: .4byte 0x0400012A
_0802EC30: .4byte gUnknown_03003F6C
_0802EC34: .4byte gUnknown_0300055C
_0802EC38: .4byte 0x04000128
_0802EC3C: .4byte gUnknown_03000560
_0802EC40:
	ldr r2, _0802EC5C @ =0x04000128
	ldr r0, _0802EC60 @ =gUnknown_03000560
	ldr r0, [r0]
	movs r4, #0xc1
	lsls r4, r4, #7
	adds r1, r4, #0
_0802EC4C:
	orrs r0, r1
	strh r0, [r2]
_0802EC50:
	movs r0, #1
	rsbs r0, r0, #0
_0802EC54:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802EC5C: .4byte 0x04000128
_0802EC60: .4byte gUnknown_03000560

