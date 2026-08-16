	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B0B4
sub_0804B0B4: @ 0x0804B0B4
	push {r4, lr}
	ldr r4, _0804B0C8 @ =gUnknown_030044E0
	movs r0, #0x6c
	bl sub_08014E44
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B0C8: .4byte gUnknown_030044E0

