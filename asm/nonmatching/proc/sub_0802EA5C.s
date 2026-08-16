	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802EA5C
sub_0802EA5C: @ 0x0802EA5C
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _0802EAC8 @ =gUnknown_02023894
	movs r3, #0
	str r3, [r0]
	ldr r0, _0802EACC @ =gUnknown_03003F6C
	str r2, [r0]
	ldr r0, _0802EAD0 @ =gUnknown_03000578
	str r3, [r0]
	ldr r0, _0802EAD4 @ =gUnknown_03000570
	str r3, [r0]
	ldr r4, _0802EAD8 @ =gUnknown_03000560
	ldrh r1, [r2, #8]
	movs r0, #3
	ands r0, r1
	str r0, [r4]
	ldr r1, _0802EADC @ =gUnknown_03000564
	ldr r0, [r2]
	str r0, [r1]
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _0802EA8C
	movs r0, #0xa
	strh r0, [r2, #6]
_0802EA8C:
	ldr r0, _0802EAE0 @ =0x04000134
	strh r3, [r0]
	ldr r2, _0802EAE4 @ =0x04000128
	ldr r0, [r4]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0802EAE8 @ =0x0400010E
	strh r3, [r0]
	ldr r1, _0802EAEC @ =sub_0802ED40
	movs r0, #7
	bl sub_0801BB00
	ldr r1, _0802EAF0 @ =sub_0802ED00
	movs r0, #6
	bl sub_0801BB00
	ldr r1, _0802EAF4 @ =0x000100C0
	movs r0, #2
	bl sub_0801BB10
	ldr r1, _0802EAF8 @ =gUnknown_0300055C
	movs r0, #0xf0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EAC8: .4byte gUnknown_02023894
_0802EACC: .4byte gUnknown_03003F6C
_0802EAD0: .4byte gUnknown_03000578
_0802EAD4: .4byte gUnknown_03000570
_0802EAD8: .4byte gUnknown_03000560
_0802EADC: .4byte gUnknown_03000564
_0802EAE0: .4byte 0x04000134
_0802EAE4: .4byte 0x04000128
_0802EAE8: .4byte 0x0400010E
_0802EAEC: .4byte sub_0802ED40
_0802EAF0: .4byte sub_0802ED00
_0802EAF4: .4byte 0x000100C0
_0802EAF8: .4byte gUnknown_0300055C

