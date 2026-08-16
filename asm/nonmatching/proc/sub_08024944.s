	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024944
sub_08024944: @ 0x08024944
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _08024968 @ =0xFF4C0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xb
	bls _08024974
	ldr r2, _0802496C @ =gUnknown_08610A38
	ldr r1, _08024970 @ =gUnknown_085C77A0
	movs r0, #0x5c
	muls r0, r3, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x14]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	b _08024980
	.align 2, 0
_08024968: .4byte 0xFF4C0000
_0802496C: .4byte gUnknown_08610A38
_08024970: .4byte gUnknown_085C77A0
_08024974:
	adds r0, r3, #0
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CCEC
_08024980:
	pop {r1}
	bx r1

