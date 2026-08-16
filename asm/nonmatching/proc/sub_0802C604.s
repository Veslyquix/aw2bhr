	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C604
sub_0802C604: @ 0x0802C604
	push {lr}
	ldr r0, _0802C620 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0802C624
	bl sub_08078E14
	cmp r0, #3
	bgt _0802C624
	cmp r0, #1
	blt _0802C624
	movs r0, #1
	b _0802C626
	.align 2, 0
_0802C620: .4byte gUnknown_03003FC0
_0802C624:
	movs r0, #0
_0802C626:
	pop {r1}
	bx r1

