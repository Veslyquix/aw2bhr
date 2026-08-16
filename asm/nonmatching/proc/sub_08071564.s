	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071564
sub_08071564: @ 0x08071564
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _08071578
	movs r0, #0xc
	b _0807157A
_08071578:
	movs r0, #3
_0807157A:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0

