	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013928
sub_08013928: @ 0x08013928
	push {r4, r5, lr}
	movs r1, #0x1f
	lsls r5, r0, #0x18
_0801392E:
	lsls r4, r1, #0x18
	lsrs r0, r4, #0x18
	asrs r1, r5, #0x18
	bl sub_080138B0
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r4, r4, r0
	lsrs r1, r4, #0x18
	cmp r4, #0
	bge _0801392E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

