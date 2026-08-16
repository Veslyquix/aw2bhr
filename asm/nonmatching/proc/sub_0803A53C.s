	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A53C
sub_0803A53C: @ 0x0803A53C
	push {lr}
	ldr r0, _0803A54C @ =sub_0803A07C
	movs r1, #1
	bl sub_0801F024
	pop {r0}
	bx r0
	.align 2, 0
_0803A54C: .4byte sub_0803A07C

