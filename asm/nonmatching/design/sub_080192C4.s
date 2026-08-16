	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080192C4
sub_080192C4: @ 0x080192C4
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1]
	cmp r0, #0
	beq _080192E6
	movs r0, #0
	str r0, [r1]
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080192E8
	bl sub_08017E80
	bl sub_08019380
	b _080192E8
_080192E6:
	str r0, [r1]
_080192E8:
	pop {r0}
	bx r0

