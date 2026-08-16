	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A174
sub_0803A174: @ 0x0803A174
	push {lr}
	ldr r0, _0803A188 @ =gUnknown_0200FD50
	ldr r1, _0803A18C @ =0x06015D00
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
	pop {r0}
	bx r0
	.align 2, 0
_0803A188: .4byte gUnknown_0200FD50
_0803A18C: .4byte 0x06015D00

