	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A148
sub_0801A148: @ 0x0801A148
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r4, #0
	str r4, [sp]
	bl sub_08019F2C
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1

