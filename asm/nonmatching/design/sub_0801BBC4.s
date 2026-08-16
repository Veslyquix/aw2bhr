	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BBC4
sub_0801BBC4: @ 0x0801BBC4
	push {r4, lr}
	ldr r4, _0801BBF4 @ =gUnknown_03000268
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl sub_080718E8
	ldr r1, _0801BBF8 @ =gUnknown_03002F2C
	ldr r0, [r4]
	str r0, [r1]
	ldr r1, _0801BBFC @ =gUnknown_030030D4
	ldr r0, _0801BC00 @ =gUnknown_03002520
	str r0, [r1]
	ldr r1, _0801BC04 @ =gUnknown_030024C0
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BBF4: .4byte gUnknown_03000268
_0801BBF8: .4byte gUnknown_03002F2C
_0801BBFC: .4byte gUnknown_030030D4
_0801BC00: .4byte gUnknown_03002520
_0801BC04: .4byte gUnknown_030024C0

