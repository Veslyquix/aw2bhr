	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039650
sub_08039650: @ 0x08039650
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x54]
	ldr r0, _08039670 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0x1d]
	ldr r1, [r2, #0x58]
	bl sub_08080E74
	pop {r0}
	bx r0
	.align 2, 0
_08039670: .4byte gUnknown_08499598

