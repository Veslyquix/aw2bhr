	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052EE4
sub_08052EE4: @ 0x08052EE4
	push {lr}
	ldr r2, _08052F0C @ =gUnknown_030020B4
	ldrb r0, [r2]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08052F10 @ =gUnknown_03001FD0
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_08012420
	pop {r0}
	bx r0
	.align 2, 0
_08052F0C: .4byte gUnknown_030020B4
_08052F10: .4byte gUnknown_03001FD0

