	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026900
sub_08026900: @ 0x08026900
	ldr r2, _08026920 @ =gUnknown_03003FC0
	adds r1, r2, #0
	adds r1, #0x43
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #3
	strb r0, [r1]
	bx lr
	.align 2, 0
_08026920: .4byte gUnknown_03003FC0

