	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080357E0
sub_080357E0: @ 0x080357E0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl sub_080355CC
	adds r4, r0, #0
	cmp r4, #0
	beq _08035806
	ldr r1, [sp, #8]
	bl sub_08035760
	adds r0, r4, #0
	b _08035808
_08035806:
	movs r0, #0
_08035808:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

