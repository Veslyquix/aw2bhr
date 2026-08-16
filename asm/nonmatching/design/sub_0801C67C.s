	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C67C
sub_0801C67C: @ 0x0801C67C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	ldrh r5, [r4, #0x1a]
	strh r0, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	adds r0, r4, #0
	bl sub_0801C2DC
	strh r5, [r4, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

