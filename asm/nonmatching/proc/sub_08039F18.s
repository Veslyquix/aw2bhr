	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039F18
sub_08039F18: @ 0x08039F18
	push {r4, lr}
	ldr r4, _08039F4C @ =gUnknown_08610A38
	ldr r3, _08039F50 @ =gUnknown_085D3DD0
	ldr r1, _08039F54 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1e]
	lsls r2, r0, #4
	adds r2, r2, r0
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x38
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08039F4C: .4byte gUnknown_08610A38
_08039F50: .4byte gUnknown_085D3DD0
_08039F54: .4byte gUnknown_08499598

