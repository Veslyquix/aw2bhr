	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080215D0
sub_080215D0: @ 0x080215D0
	push {r4, r5, lr}
	ldr r5, _080215F0 @ =gUnknown_080C1BC4
	ldr r0, _080215F4 @ =gUnknown_0849959C
	ldr r3, [r0]
	movs r2, #0
	ldr r4, _080215F8 @ =0x000003FF
_080215DC:
	adds r0, r3, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r4
	ble _080215DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080215F0: .4byte gUnknown_080C1BC4
_080215F4: .4byte gUnknown_0849959C
_080215F8: .4byte 0x000003FF

