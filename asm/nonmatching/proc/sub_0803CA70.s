	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CA70
sub_0803CA70: @ 0x0803CA70
	push {lr}
	adds r3, r0, #0
	bl sub_080206B0
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	ldr r0, _0803CA98 @ =gUnknown_02028030
	lsrs r2, r2, #0x13
	adds r0, #0x12
	adds r2, r2, r0
	movs r1, #7
	ands r1, r3
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	ands r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0803CA98: .4byte gUnknown_02028030

