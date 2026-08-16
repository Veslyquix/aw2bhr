	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BCD8
sub_0802BCD8: @ 0x0802BCD8
	push {lr}
	ldr r0, _0802BCE8 @ =sub_0802BC5C
	movs r1, #0
	bl sub_0801F024
	pop {r0}
	bx r0
	.align 2, 0
_0802BCE8: .4byte sub_0802BC5C

