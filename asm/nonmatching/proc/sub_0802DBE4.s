	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DBE4
sub_0802DBE4: @ 0x0802DBE4
	push {lr}
	ldr r0, _0802DBF4 @ =0x00000C9E
	movs r1, #0
	movs r2, #0
	bl sub_08019818
	pop {r0}
	bx r0
	.align 2, 0
_0802DBF4: .4byte 0x00000C9E

