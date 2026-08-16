	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080458F8
sub_080458F8: @ 0x080458F8
	ldr r0, _08045914 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _08045918 @ =0x0000418C
	adds r1, r0, r2
	ldr r2, _0804591C @ =0x00001432
	adds r0, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r0, r0, #5
	cmp r0, #1
	beq _08045920
	movs r0, #0
	b _08045922
	.align 2, 0
_08045914: .4byte gUnknown_08499590
_08045918: .4byte 0x0000418C
_0804591C: .4byte 0x00001432
_08045920:
	movs r0, #1
_08045922:
	bx lr

