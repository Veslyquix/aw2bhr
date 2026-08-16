	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CF04
sub_0803CF04: @ 0x0803CF04
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0803CF34 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	ldr r4, _0803CF38 @ =gUnknown_08091140
	cmp r0, #0
	bne _0803CF24
	adds r0, r1, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	bl sub_0801AC58
_0803CF24:
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_0803D2F8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CF34: .4byte gUnknown_03003FC0
_0803CF38: .4byte gUnknown_08091140

