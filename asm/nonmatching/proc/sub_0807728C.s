	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807728C
sub_0807728C: @ 0x0807728C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	b _08077296
_08077294:
	subs r5, #2
_08077296:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x32
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _08077294
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

