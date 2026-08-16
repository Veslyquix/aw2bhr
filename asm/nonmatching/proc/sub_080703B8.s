	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080703B8
sub_080703B8: @ 0x080703B8
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	ldr r0, _080703CC @ =0x68736D53
	cmp r3, r0
	bne _080703CA
	ldr r0, [r2, #4]
	ldr r1, _080703D0 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_080703CA:
	bx lr
	.align 2, 0
_080703CC: .4byte 0x68736D53
_080703D0: .4byte 0x7FFFFFFF

