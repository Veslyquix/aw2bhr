	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062FB8
sub_08062FB8: @ 0x08062FB8
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _08062FE4 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08062FE8 @ =0x04000128
	ldr r3, _08062FEC @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08062FF0 @ =0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
_08062FE4: .4byte 0x04000134
_08062FE8: .4byte 0x04000128
_08062FEC: .4byte 0x00002003
_08062FF0: .4byte 0x0400012A

