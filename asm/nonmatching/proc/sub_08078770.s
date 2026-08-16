	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078770
sub_08078770: @ 0x08078770
	movs r0, #0
	ldr r2, _08078780 @ =gUnknown_030059C0
	movs r3, #1
	adds r1, r2, #0
_08078778:
	cmp r0, #0
	bne _08078784
	str r0, [r2]
	b _08078786
	.align 2, 0
_08078780: .4byte gUnknown_030059C0
_08078784:
	str r3, [r1]
_08078786:
	adds r1, #4
	adds r0, #1
	cmp r0, #4
	ble _08078778
	bx lr

