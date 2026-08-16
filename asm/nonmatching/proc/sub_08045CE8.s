	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045CE8
sub_08045CE8: @ 0x08045CE8
	ldr r0, _08045D04 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _08045D08 @ =0x0000417C
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	beq _08045D00
	asrs r0, r0, #6
	cmp r0, #1
	beq _08045D0C
_08045D00:
	movs r0, #0
	b _08045D0E
	.align 2, 0
_08045D04: .4byte gUnknown_08499590
_08045D08: .4byte 0x0000417C
_08045D0C:
	movs r0, #1
_08045D0E:
	bx lr

