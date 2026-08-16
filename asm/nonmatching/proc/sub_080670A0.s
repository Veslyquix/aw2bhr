	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080670A0
sub_080670A0: @ 0x080670A0
	push {lr}
	ldr r0, _080670B4 @ =gUnknown_0202F200
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080670B8 @ =gUnknown_08580DD8
	movs r1, #2
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_080670B4: .4byte gUnknown_0202F200
_080670B8: .4byte gUnknown_08580DD8

