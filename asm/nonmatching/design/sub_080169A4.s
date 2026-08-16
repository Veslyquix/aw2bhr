	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080169A4
sub_080169A4: @ 0x080169A4
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080169D8
	ldr r2, _080169E0 @ =gUnknown_0200E438
	ldr r1, _080169E4 @ =gUnknown_03001470
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	movs r0, #0x4c
	muls r0, r1, r0
	adds r2, #0x44
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r2, #0
	beq _080169D8
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
_080169D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080169E0: .4byte gUnknown_0200E438
_080169E4: .4byte gUnknown_03001470

