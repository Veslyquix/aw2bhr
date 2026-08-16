	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807033C
sub_0807033C: @ 0x0807033C
	mov ip, lr
	bl sub_0807031C
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _0807034C
	bl sub_08070300
_0807034C:
	bx ip
	.align 2, 0

