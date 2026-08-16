	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011018
sub_08011018: @ 0x08011018
	push {lr}
	bl sub_08010FA0
	ldr r2, _08011044 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08011048 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0801104C @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _08011050 @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	bl sub_080128D0
	pop {r0}
	bx r0
	.align 2, 0
_08011044: .4byte gUnknown_030030E0
_08011048: .4byte gUnknown_03002020
_0801104C: .4byte gUnknown_03002B28
_08011050: .4byte gUnknown_03001FFC

