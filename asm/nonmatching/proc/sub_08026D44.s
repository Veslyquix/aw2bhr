	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026D44
sub_08026D44: @ 0x08026D44
	ldr r1, _08026D60 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x2d
	ldrb r1, [r1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08026D64
	movs r0, #1
	b _08026D66
	.align 2, 0
_08026D60: .4byte gUnknown_08499598
_08026D64:
	movs r0, #0
_08026D66:
	bx lr

