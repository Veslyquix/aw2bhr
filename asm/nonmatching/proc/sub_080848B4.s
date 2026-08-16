	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080848B4
sub_080848B4: @ 0x080848B4
	movs r2, #0x8a
	ldr r1, _080848C8 @ =gUnknown_0200C2D0
_080848B8:
	ldr r0, [r1]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	bne _080848CC
	movs r0, #0
	b _080848D6
	.align 2, 0
_080848C8: .4byte gUnknown_0200C2D0
_080848CC:
	adds r1, #8
	adds r2, #1
	cmp r2, #0xab
	ble _080848B8
	movs r0, #1
_080848D6:
	bx lr

