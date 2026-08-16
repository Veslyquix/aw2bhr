	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080750A4
sub_080750A4: @ 0x080750A4
	adds r2, r0, #0
	movs r3, #0
	movs r1, #9
	adds r0, #0x60
_080750AC:
	str r3, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _080750AC
	movs r0, #0
	str r0, [r2, #0x30]
	strh r0, [r2, #0x3a]
	bx lr
	.align 2, 0

