	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080638A8
sub_080638A8: @ 0x080638A8
	sub sp, #4
	mov r2, sp
	movs r1, #0
	strh r1, [r2]
	ldr r1, _080638C8 @ =0x040000D4
	str r2, [r1]
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _080638CC @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	bx lr
	.align 2, 0
_080638C8: .4byte 0x040000D4
_080638CC: .4byte 0x81000010

