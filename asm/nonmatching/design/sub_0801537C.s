	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801537C
sub_0801537C: @ 0x0801537C
	push {r4, lr}
	adds r1, r0, #0
	movs r4, #0
	ldr r2, _080153A0 @ =gUnknown_03001470
_08015384:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r1
	bne _080153A4
	adds r0, r4, #0
	bl sub_08015328
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b _080153B2
	.align 2, 0
_080153A0: .4byte gUnknown_03001470
_080153A4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1d
	bls _08015384
	movs r0, #1
	rsbs r0, r0, #0
_080153B2:
	pop {r4}
	pop {r1}
	bx r1

