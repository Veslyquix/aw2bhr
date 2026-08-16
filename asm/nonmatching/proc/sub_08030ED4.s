	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030ED4
sub_08030ED4: @ 0x08030ED4
	push {r4, lr}
	bl sub_0802F348
	ldr r0, _08030F14 @ =0x04000134
	movs r4, #0
	strh r4, [r0]
	subs r0, #0xc
	strh r4, [r0]
	movs r0, #7
	movs r1, #0
	bl sub_0801BB00
	movs r0, #6
	movs r1, #0
	bl sub_0801BB00
	movs r1, #0xc1
	rsbs r1, r1, #0
	movs r0, #1
	bl sub_0801BB10
	ldr r0, _08030F18 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, _08030F1C @ =gUnknown_03003FC0
	adds r0, #0x32
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030F14: .4byte 0x04000134
_08030F18: .4byte gUnknown_0849B018
_08030F1C: .4byte gUnknown_03003FC0

