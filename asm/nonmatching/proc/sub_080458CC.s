	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080458CC
sub_080458CC: @ 0x080458CC
	ldr r0, _080458E8 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _080458EC @ =0x0000418A
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _080458F0 @ =0x00001438
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r0, r0, #5
	cmp r0, #1
	beq _080458F4
	movs r0, #0
	b _080458F6
	.align 2, 0
_080458E8: .4byte gUnknown_08499590
_080458EC: .4byte 0x0000418A
_080458F0: .4byte 0x00001438
_080458F4:
	movs r0, #1
_080458F6:
	bx lr

