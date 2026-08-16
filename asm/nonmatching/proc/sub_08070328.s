	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070328
sub_08070328: @ 0x08070328
	mov ip, lr
	bl sub_0807031C
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _08070338
	bl sub_08070300
_08070338:
	bx ip
	.align 2, 0

