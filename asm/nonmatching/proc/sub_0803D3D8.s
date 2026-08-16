	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D3D8
sub_0803D3D8: @ 0x0803D3D8
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0803D2F8
	adds r0, r4, #0
	bl sub_0803D238
	bl sub_0803D3F0
	pop {r4}
	pop {r0}
	bx r0

