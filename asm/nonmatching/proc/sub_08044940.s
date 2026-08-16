	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044940
sub_08044940: @ 0x08044940
	push {lr}
	ldr r0, _08044954 @ =sub_080246B4
	bl sub_08011B34
	ldr r0, _08044958 @ =sub_08024720
	bl sub_08011B34
	pop {r0}
	bx r0
	.align 2, 0
_08044954: .4byte sub_080246B4
_08044958: .4byte sub_08024720

