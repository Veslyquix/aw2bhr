	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A444
sub_0801A444: @ 0x0801A444
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r4, _0801A470 @ =gUnknown_08499580
	ldr r4, [r4]
	str r4, [sp]
	movs r4, #8
	str r4, [sp, #4]
	bl sub_0801A368
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A470: .4byte gUnknown_08499580

