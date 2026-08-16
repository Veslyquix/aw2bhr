	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087298
sub_08087298: @ 0x08087298
	ldr r0, _080872AC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _080872B8
	ldr r0, _080872B0 @ =gUnknown_030058F4
	ldr r0, [r0]
	lsls r0, r0, #0x11
	ldr r1, _080872B4 @ =0xFFA10000
	b _080872C0
	.align 2, 0
_080872AC: .4byte gUnknown_03003FC0
_080872B0: .4byte gUnknown_030058F4
_080872B4: .4byte 0xFFA10000
_080872B8:
	ldr r0, _080872C8 @ =gUnknown_030058F4
	ldr r0, [r0]
	lsls r0, r0, #0x11
	ldr r1, _080872CC @ =0xFFAC0000
_080872C0:
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080872C8: .4byte gUnknown_030058F4
_080872CC: .4byte 0xFFAC0000

