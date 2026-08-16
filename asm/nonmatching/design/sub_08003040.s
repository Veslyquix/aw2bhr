	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003040
sub_08003040: @ 0x08003040
	ldr r2, _08003060 @ =gUnknown_0200B0B0
	ldr r0, [r2]
	adds r0, #0x72
	movs r1, #0
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
_08003060: .4byte gUnknown_0200B0B0

