	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019DEC
sub_08019DEC: @ 0x08019DEC
	push {r4, lr}
	ldrh r1, [r0, #0x26]
	adds r2, r1, #0
	adds r2, #0x10
	movs r4, #0x20
	ldrsh r3, [r0, r4]
	lsls r3, r3, #5
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r4, #0x1e
	ldrsh r3, [r0, r4]
	adds r2, r2, r3
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsrs r2, r2, #1
	strh r2, [r0, #0x1e]
	movs r3, #0x24
	ldrsh r2, [r0, r3]
	movs r4, #0x20
	ldrsh r0, [r0, r4]
	lsls r0, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	movs r2, #3
	bl sub_0802323C
	pop {r4}
	pop {r0}
	bx r0

