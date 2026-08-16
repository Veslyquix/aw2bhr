	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080228B8
sub_080228B8: @ 0x080228B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080228D0 @ =gUnknown_0809181C
	ldr r1, _080228D4 @ =0x06003600
	movs r2, #0x80
	bl sub_08011E54
	movs r0, #2
	strh r0, [r4, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080228D0: .4byte gUnknown_0809181C
_080228D4: .4byte 0x06003600

