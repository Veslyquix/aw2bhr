	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071E80
sub_08071E80: @ 0x08071E80
	push {lr}
	bl sub_08071CF4
	ldr r2, _08071EA8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08071EAC @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08071EB0 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r0, _08071EB4 @ =gUnknown_03001FFC
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08071EA8: .4byte gUnknown_030030E0
_08071EAC: .4byte gUnknown_03002020
_08071EB0: .4byte gUnknown_03002B28
_08071EB4: .4byte gUnknown_03001FFC

