	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804668C
sub_0804668C: @ 0x0804668C
	ldr r2, _080466A0 @ =gUnknown_084C1430
	ldr r0, [r2]
	adds r0, #0x58
	movs r1, #0x1c
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x59
	movs r1, #0x10
	strb r1, [r0]
	bx lr
	.align 2, 0
_080466A0: .4byte gUnknown_084C1430

