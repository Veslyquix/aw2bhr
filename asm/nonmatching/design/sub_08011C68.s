	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011C68
sub_08011C68: @ 0x08011C68
	push {lr}
	adds r3, r0, #0
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08011C82
	lsrs r2, r2, #0x11
	adds r0, r3, #0
	bl CpuSet
	b _08011C8A
_08011C82:
	lsrs r2, r2, #0x12
	adds r0, r3, #0
	bl CpuFastSet
_08011C8A:
	pop {r0}
	bx r0
	.align 2, 0

