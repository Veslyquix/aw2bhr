	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031B30
sub_08031B30: @ 0x08031B30
	ldr r0, _08031B48 @ =gUnknown_0849B01C
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r1, _08031B4C @ =0x00009ABC
	strh r1, [r0, #6]
	ldr r1, _08031B50 @ =0x00000212
	adds r2, r0, r1
	ldrh r0, [r2]
	cmp r0, #0
	bne _08031B54
	movs r0, #1
	b _08031B62
	.align 2, 0
_08031B48: .4byte gUnknown_0849B01C
_08031B4C: .4byte 0x00009ABC
_08031B50: .4byte 0x00000212
_08031B54:
	ldr r1, _08031B64 @ =gUnknown_0300410C
	ldr r0, _08031B68 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r2]
	movs r0, #0
	strh r0, [r2]
_08031B62:
	bx lr
	.align 2, 0
_08031B64: .4byte gUnknown_0300410C
_08031B68: .4byte gUnknown_030040CC

