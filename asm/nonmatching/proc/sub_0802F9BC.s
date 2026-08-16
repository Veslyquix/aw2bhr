	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F9BC
sub_0802F9BC: @ 0x0802F9BC
	push {r4, r5, r6, lr}
	adds r3, r1, #0
	ldr r0, _0802F9DC @ =gUnknown_03000570
	ldr r0, [r0]
	cmp r0, #1
	bne _0802FA00
	ldr r1, _0802F9E0 @ =0x00007FFF
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	strh r0, [r3]
	adds r3, #2
	strh r0, [r3]
	strh r0, [r3, #2]
	b _0802FA4C
	.align 2, 0
_0802F9DC: .4byte gUnknown_03000570
_0802F9E0: .4byte 0x00007FFF
_0802F9E4:
	ldr r1, _0802F9FC @ =0x00007FFF
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, r6, #0
	strh r0, [r3]
	adds r3, #2
	strh r0, [r3]
	strh r0, [r3, #2]
	movs r0, #1
	rsbs r0, r0, #0
	b _0802FA4E
	.align 2, 0
_0802F9FC: .4byte 0x00007FFF
_0802FA00:
	movs r4, #0
	adds r6, r3, #2
	ldr r5, _0802FA54 @ =gUnknown_03003F48
	ldr r2, _0802FA58 @ =gUnknown_03003128
_0802FA08:
	ldrh r1, [r2]
	ldrh r0, [r5]
	cmp r1, r0
	beq _0802F9E4
	adds r5, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #3
	ble _0802FA08
	movs r4, #0
	ldr r6, _0802FA5C @ =gUnknown_02025C18
	ldr r5, _0802FA60 @ =0x000003FF
	ldr r2, _0802FA58 @ =gUnknown_03003128
_0802FA22:
	lsls r1, r4, #1
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r3]
	adds r3, #2
	ldrh r0, [r2]
	adds r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	ldrh r1, [r2]
	strh r0, [r2]
	adds r2, #2
	adds r4, #1
	cmp r4, #3
	ble _0802FA22
_0802FA4C:
	movs r0, #5
_0802FA4E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802FA54: .4byte gUnknown_03003F48
_0802FA58: .4byte gUnknown_03003128
_0802FA5C: .4byte gUnknown_02025C18
_0802FA60: .4byte 0x000003FF

