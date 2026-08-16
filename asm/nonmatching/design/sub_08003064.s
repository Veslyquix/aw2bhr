	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003064
sub_08003064: @ 0x08003064
	ldr r2, _08003084 @ =gUnknown_0200B0B0
	ldr r0, [r2]
	adds r0, #0x72
	movs r1, #0x32
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x73
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x74
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x75
	strb r1, [r0]
	bx lr
	.align 2, 0
_08003084: .4byte gUnknown_0200B0B0

