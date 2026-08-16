	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071EB8
sub_08071EB8: @ 0x08071EB8
	push {lr}
	bl sub_08071DB4
	ldr r2, _08071EE0 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08071EE4 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08071EE8 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _08071EEC @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08071EE0: .4byte gUnknown_030030E0
_08071EE4: .4byte gUnknown_03002020
_08071EE8: .4byte gUnknown_03002B28
_08071EEC: .4byte gUnknown_03001FFC

