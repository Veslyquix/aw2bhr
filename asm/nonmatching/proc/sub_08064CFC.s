	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064CFC
sub_08064CFC: @ 0x08064CFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	ldrh r0, [r4, #0x3a]
	adds r1, r1, r0
	strh r1, [r4, #0x3a]
	ldrh r0, [r4, #0x2a]
	adds r0, r0, r1
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_08064BF4
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0xa0
	ble _08064D34
	ldr r0, _08064D3C @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _08064D40 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08064D34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064D3C: .4byte gUnknown_08580934
_08064D40: .4byte gUnknown_03001FBC

