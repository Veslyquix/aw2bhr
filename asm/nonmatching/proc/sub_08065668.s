	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065668
sub_08065668: @ 0x08065668
	adds r1, r0, #0
	ldr r0, _08065680 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08065684
	str r0, [r1, #0x34]
	movs r0, #2
	rsbs r0, r0, #0
	b _0806568A
	.align 2, 0
_08065680: .4byte gUnknown_08580934
_08065684:
	movs r0, #0
	str r0, [r1, #0x34]
	movs r0, #2
_0806568A:
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0

