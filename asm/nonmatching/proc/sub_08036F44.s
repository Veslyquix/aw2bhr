	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036F44
sub_08036F44: @ 0x08036F44
	push {lr}
	ldr r2, _08036F64 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_08022A34
	movs r0, #0
	bl sub_0801A5B0
	pop {r0}
	bx r0
	.align 2, 0
_08036F64: .4byte gDispIo

