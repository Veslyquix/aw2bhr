	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045BF0
sub_08045BF0: @ 0x08045BF0
	ldr r0, _08045C0C @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _08045C10 @ =0x0000417E
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	beq _08045C08
	asrs r0, r0, #6
	cmp r0, #0
	beq _08045C14
_08045C08:
	movs r0, #0
	b _08045C16
	.align 2, 0
_08045C0C: .4byte gUnknown_08499590
_08045C10: .4byte 0x0000417E
_08045C14:
	movs r0, #1
_08045C16:
	bx lr

