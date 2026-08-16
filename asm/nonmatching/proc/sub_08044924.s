	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044924
sub_08044924: @ 0x08044924
	push {lr}
	ldr r0, _08044938 @ =sub_080246B4
	bl sub_08011B5C
	ldr r0, _0804493C @ =sub_08024720
	bl sub_08011B5C
	pop {r0}
	bx r0
	.align 2, 0
_08044938: .4byte sub_080246B4
_0804493C: .4byte sub_08024720

