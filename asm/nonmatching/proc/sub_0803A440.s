	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A440
sub_0803A440: @ 0x0803A440
	push {lr}
	ldr r0, _0803A458 @ =sub_0803A07C
	movs r1, #1
	bl sub_0801F024
	ldr r0, _0803A45C @ =sub_08039F80
	movs r1, #1
	bl sub_0801F024
	pop {r0}
	bx r0
	.align 2, 0
_0803A458: .4byte sub_0803A07C
_0803A45C: .4byte sub_08039F80

