	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080344B4
sub_080344B4: @ 0x080344B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080344E8 @ =gUnknown_08499594
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	ldr r5, [r4]
	adds r5, r5, r3
	ldr r4, _080344EC @ =gUnknown_030044B0
	movs r3, #8
	strb r3, [r4]
	strb r0, [r4, #1]
	strb r1, [r4, #6]
	strb r2, [r4, #7]
	ldrb r0, [r5, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strb r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_080308B4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080344E8: .4byte gUnknown_08499594
_080344EC: .4byte gUnknown_030044B0

