	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078468
sub_08078468: @ 0x08078468
	push {lr}
	movs r0, #0
	movs r1, #0
	bl sub_0802D5CC
	ldr r1, _0807847C @ =gUnknown_03002F08
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807847C: .4byte gUnknown_03002F08

