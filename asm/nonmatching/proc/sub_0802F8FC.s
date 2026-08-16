	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F8FC
sub_0802F8FC: @ 0x0802F8FC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0802F914 @ =gUnknown_08090C98
	ldr r1, [r0]
	ldr r1, [r1]
	adds r3, r0, #0
	cmp r1, #3
	ble _0802F918
	movs r0, #4
	rsbs r0, r0, #0
	b _0802F9AE
	.align 2, 0
_0802F914: .4byte gUnknown_08090C98
_0802F918:
	ldr r5, _0802F94C @ =gUnknown_08090C9C
	ldr r1, _0802F950 @ =0x0400012A
_0802F91C:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r1]
	ldrh r6, [r2]
	cmp r0, r6
	bne _0802F91C
	ldr r0, [r3]
	ldr r0, [r0]
	cmp r0, #0
	bne _0802F9A6
	movs r1, #0
	ldr r0, _0802F954 @ =gUnknown_03003F6C
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	cmp r0, #0
	beq _0802F958
	ldr r0, [r5]
	ldr r0, [r0]
	cmp r0, #0
	beq _0802F95E
	cmp r4, #0
	bge _0802F95A
	b _0802F95E
	.align 2, 0
_0802F94C: .4byte gUnknown_08090C9C
_0802F950: .4byte 0x0400012A
_0802F954: .4byte gUnknown_03003F6C
_0802F958:
	movs r1, #1
_0802F95A:
	cmp r1, #0
	beq _0802F9A6
_0802F95E:
	ldr r0, _0802F97C @ =gUnknown_03000564
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802F988
	ldr r1, _0802F980 @ =gUnknown_08090C44
	ldr r0, _0802F984 @ =gUnknown_03000578
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	b _0802F98A
	.align 2, 0
_0802F97C: .4byte gUnknown_03000564
_0802F980: .4byte gUnknown_08090C44
_0802F984: .4byte gUnknown_03000578
_0802F988:
	movs r1, #0
_0802F98A:
	cmp r1, #0
	beq _0802F996
	adds r0, r1, #0
	bl sub_0802ECEC
	b _0802F9A6
_0802F996:
	ldr r2, _0802F9B4 @ =0x04000128
	ldr r0, _0802F9B8 @ =gUnknown_03000560
	ldr r0, [r0]
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0802F9A6:
	ldr r1, [r5]
	movs r0, #1
	str r0, [r1]
	movs r0, #5
_0802F9AE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F9B4: .4byte 0x04000128
_0802F9B8: .4byte gUnknown_03000560

