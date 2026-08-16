	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CE70
sub_0802CE70: @ 0x0802CE70
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802CE8C @ =gUnknown_030044A0
	str r1, [r0]
	bl sub_0801A168
	ldr r0, _0802CE90 @ =gUnknown_030033EC
	ldrb r0, [r0]
	movs r1, #8
	bl sub_08019940
	pop {r0}
	bx r0
	.align 2, 0
_0802CE8C: .4byte gUnknown_030044A0
_0802CE90: .4byte gUnknown_030033EC

