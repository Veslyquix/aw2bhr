	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019F2C
sub_08019F2C: @ 0x08019F2C
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	bl sub_08019F90
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1

