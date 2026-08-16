	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015578
sub_08015578: @ 0x08015578
	push {lr}
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	beq _0801558C
	bl sub_0801D778
	b _08015596
_0801558C:
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	bl sub_0801D804
_08015596:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

