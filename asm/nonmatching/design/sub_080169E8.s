	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080169E8
sub_080169E8: @ 0x080169E8
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08016A10 @ =gUnknown_0200E440
_080169EE:
	movs r0, #0x4c
	muls r0, r4, r0
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08016A00
	adds r0, r4, #0
	bl sub_0801D81C
_08016A00:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1d
	bls _080169EE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016A10: .4byte gUnknown_0200E440

