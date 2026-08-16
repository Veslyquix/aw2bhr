	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080458A0
sub_080458A0: @ 0x080458A0
	ldr r0, _080458BC @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _080458C0 @ =0x0000418A
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _080458C4 @ =0x00001435
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r0, r0, #5
	cmp r0, #1
	beq _080458C8
	movs r0, #0
	b _080458CA
	.align 2, 0
_080458BC: .4byte gUnknown_08499590
_080458C0: .4byte 0x0000418A
_080458C4: .4byte 0x00001435
_080458C8:
	movs r0, #1
_080458CA:
	bx lr

