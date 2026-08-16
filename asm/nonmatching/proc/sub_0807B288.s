	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B288
sub_0807B288: @ 0x0807B288
	adds r2, r0, #0
	ldr r0, _0807B2A0 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _0807B2A4
	movs r0, #9
	str r0, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #4
	b _0807B2AE
	.align 2, 0
_0807B2A0: .4byte gUnknown_03003FC0
_0807B2A4:
	movs r0, #7
	str r0, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #9
_0807B2AE:
	strh r0, [r1]
	movs r0, #3
	str r0, [r2, #0x54]
	bx lr
	.align 2, 0

