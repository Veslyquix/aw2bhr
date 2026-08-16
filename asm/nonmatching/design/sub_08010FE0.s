	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010FE0
sub_08010FE0: @ 0x08010FE0
	push {lr}
	bl sub_08010FA0
	ldr r2, _08011008 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801100C @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08011010 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _08011014 @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	bl sub_080128D0
	pop {r0}
	bx r0
	.align 2, 0
_08011008: .4byte gUnknown_030030E0
_0801100C: .4byte gUnknown_03002020
_08011010: .4byte gUnknown_03002B28
_08011014: .4byte gUnknown_03001FFC

