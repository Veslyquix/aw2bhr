	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028CF4
sub_08028CF4: @ 0x08028CF4
	push {lr}
	bl sub_08028BAC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028D0A
	bl sub_08028AEC
	bl sub_08028568
	b _08028D22
_08028D0A:
	bl sub_08028B70
	cmp r0, #0
	beq _08028D1E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x20
	bl sub_08019940
	b _08028D22
_08028D1E:
	bl sub_08028A68
_08028D22:
	pop {r0}
	bx r0
	.align 2, 0

