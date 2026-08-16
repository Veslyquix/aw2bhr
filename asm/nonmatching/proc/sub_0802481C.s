	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802481C
sub_0802481C: @ 0x0802481C
	push {lr}
	ldr r0, _0802482C @ =gUnknown_03003F68
	ldr r0, [r0]
	bl sub_08014ED4
	pop {r0}
	bx r0
	.align 2, 0
_0802482C: .4byte gUnknown_03003F68

