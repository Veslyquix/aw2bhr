	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078404
sub_08078404: @ 0x08078404
	push {lr}
	sub sp, #4
	ldr r3, _0807841C @ =gUnknown_084B9F00
	str r0, [sp]
	movs r0, #0x98
	movs r1, #0xa0
	movs r2, #1
	bl sub_080785CC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807841C: .4byte gUnknown_084B9F00

