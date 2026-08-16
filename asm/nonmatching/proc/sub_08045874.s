	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045874
sub_08045874: @ 0x08045874
	ldr r0, _08045890 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _08045894 @ =0x0000417E
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _08045898 @ =0x00001441
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r0, r0, #5
	cmp r0, #1
	beq _0804589C
	movs r0, #0
	b _0804589E
	.align 2, 0
_08045890: .4byte gUnknown_08499590
_08045894: .4byte 0x0000417E
_08045898: .4byte 0x00001441
_0804589C:
	movs r0, #1
_0804589E:
	bx lr

