	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080288D8
sub_080288D8: @ 0x080288D8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080288FC
	ldr r0, _080288F8 @ =gUnknown_030030F8
	ldrb r0, [r0]
	cmp r0, r4
	beq _080288FC
	movs r0, #1
	b _080288FE
	.align 2, 0
_080288F8: .4byte gUnknown_030030F8
_080288FC:
	movs r0, #0
_080288FE:
	pop {r4}
	pop {r1}
	bx r1

