	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070300
sub_08070300: @ 0x08070300
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _08070310
	movs r2, #0xc
	b _08070312
_08070310:
	movs r2, #3
_08070312:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.align 2, 0

