	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064D44
sub_08064D44: @ 0x08064D44
	push {r4, lr}
	movs r4, #0xb
	strh r4, [r0, #0x26]
	strh r2, [r0, #0x1c]
	strh r1, [r0, #0x28]
	movs r1, #0x4e
	strh r1, [r0, #0x38]
	strh r3, [r0, #0x24]
	ldr r1, _08064D70 @ =gUnknown_08580934
	ldr r3, [r1]
	lsls r2, r2, #2
	adds r1, r3, #0
	adds r1, #0x44
	adds r1, r1, r2
	str r0, [r1]
	adds r3, #0x2d
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064D70: .4byte gUnknown_08580934

