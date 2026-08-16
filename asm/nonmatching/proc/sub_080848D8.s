	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080848D8
sub_080848D8: @ 0x080848D8
	movs r2, #0x6c
	ldr r1, _080848EC @ =gUnknown_0200C078
_080848DC:
	ldr r0, [r1]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	bne _080848F0
	movs r0, #0
	b _080848FA
	.align 2, 0
_080848EC: .4byte gUnknown_0200C078
_080848F0:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #0x89
	ble _080848DC
	movs r0, #1
_080848FA:
	bx lr

