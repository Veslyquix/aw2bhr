	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010FA0
sub_08010FA0: @ 0x08010FA0
	ldr r2, _08010FD0 @ =gUnknown_030030E0
	movs r3, #0
	strh r3, [r2]
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08010FD4 @ =gUnknown_03002020
	strh r3, [r0]
	ldr r0, _08010FD8 @ =gUnknown_03002B28
	strh r3, [r0]
	ldr r0, _08010FDC @ =gUnknown_03001FFC
	strh r3, [r0]
	bx lr
	.align 2, 0
_08010FD0: .4byte gUnknown_030030E0
_08010FD4: .4byte gUnknown_03002020
_08010FD8: .4byte gUnknown_03002B28
_08010FDC: .4byte gUnknown_03001FFC

