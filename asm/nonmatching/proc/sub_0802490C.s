	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802490C
sub_0802490C: @ 0x0802490C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08024928 @ =0xFF4C0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xb
	bls _08024930
	ldr r1, _0802492C @ =gUnknown_085C77A0
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x18]
	b _08024940
	.align 2, 0
_08024928: .4byte 0xFF4C0000
_0802492C: .4byte gUnknown_085C77A0
_08024930:
	adds r0, r2, #0
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08024940:
	pop {r1}
	bx r1

