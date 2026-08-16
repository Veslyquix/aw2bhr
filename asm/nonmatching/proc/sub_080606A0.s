	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080606A0
sub_080606A0: @ 0x080606A0
	push {lr}
	bl sub_0802C0D8
	ldr r0, _080606B8 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080606B8: .4byte gUnknown_030040D8

