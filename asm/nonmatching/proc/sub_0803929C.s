	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803929C
sub_0803929C: @ 0x0803929C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0xe5
	lsls r1, r1, #1
	movs r2, #4
	bl sub_08043BA4
	movs r0, #0x98
	lsls r0, r0, #1
	str r0, [r4, #0x2c]
	movs r0, #0xa0
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0

