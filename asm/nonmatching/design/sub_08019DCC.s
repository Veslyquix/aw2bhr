	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019DCC
sub_08019DCC: @ 0x08019DCC
	push {lr}
	movs r1, #0x24
	ldrsh r2, [r0, r1]
	movs r3, #0x20
	ldrsh r1, [r0, r3]
	lsls r1, r1, #4
	ldrh r0, [r0, #0x26]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_08022AD0
	pop {r0}
	bx r0
	.align 2, 0

