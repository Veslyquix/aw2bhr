	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038568
sub_08038568: @ 0x08038568
	push {lr}
	bl sub_080346FC
	ldr r1, _0803858C @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08038594
	ldrb r0, [r1, #1]
	bl sub_08016D04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08038590 @ =sub_0803B8B8
	bl sub_0803D73C
	b _080385A0
	.align 2, 0
_0803858C: .4byte gUnknown_03003FC0
_08038590: .4byte sub_0803B8B8
_08038594:
	bl sub_0803BCB8
	bl sub_0803B828
	bl sub_08030ED4
_080385A0:
	pop {r0}
	bx r0

