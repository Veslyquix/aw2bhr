	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E0D0
sub_0803E0D0: @ 0x0803E0D0
	push {r4, lr}
	adds r3, r0, #0
	ldrh r2, [r3, #2]
	movs r4, #0xf0
	lsls r4, r4, #2
	b _0803E0E4
_0803E0DC:
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	stm r3!, {r1, r2}
	ldrh r2, [r3, #2]
_0803E0E4:
	adds r1, r4, #0
	ands r1, r2
	cmp r1, #0
	bne _0803E0DC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

