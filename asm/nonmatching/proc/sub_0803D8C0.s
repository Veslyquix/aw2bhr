	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D8C0
sub_0803D8C0: @ 0x0803D8C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803D8D8 @ =gUnknown_0849F3A8
	bl sub_080193B0
	adds r4, #0x64
	ldrh r1, [r4]
	strb r1, [r0, #0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D8D8: .4byte gUnknown_0849F3A8

