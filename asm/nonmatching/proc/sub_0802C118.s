	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C118
sub_0802C118: @ 0x0802C118
	push {lr}
	bl sub_080366A4
	ldr r0, _0802C12C @ =gUnknown_030033EC
	ldrb r0, [r0]
	bl sub_0802C0E8
	pop {r0}
	bx r0
	.align 2, 0
_0802C12C: .4byte gUnknown_030033EC

