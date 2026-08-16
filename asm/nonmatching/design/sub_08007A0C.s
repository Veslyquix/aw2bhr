	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007A0C
sub_08007A0C: @ 0x08007A0C
	ldr r0, _08007A2C @ =gUnknown_0200B0B0
	ldr r3, [r0]
	adds r1, r3, #0
	adds r1, #0x6e
	movs r2, #0
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x97
	lsls r0, r0, #4
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6c
	strb r2, [r0]
	bx lr
	.align 2, 0
_08007A2C: .4byte gUnknown_0200B0B0

