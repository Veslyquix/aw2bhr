	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080717F8
sub_080717F8: @ 0x080717F8
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _08071830 @ =0xFFFFFF00
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _08071834 @ =0xFFFF00FF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _08071838 @ =0xFF00FFFF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _0807183C @ =0x00FFFFFF
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071830: .4byte 0xFFFFFF00
_08071834: .4byte 0xFFFF00FF
_08071838: .4byte 0xFF00FFFF
_0807183C: .4byte 0x00FFFFFF

