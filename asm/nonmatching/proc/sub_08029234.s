	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029234
sub_08029234: @ 0x08029234
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	bl sub_08041398
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_08028ED0
	movs r0, #0x77
	bl sub_0803B4DC
	pop {r4}
	pop {r0}
	bx r0

