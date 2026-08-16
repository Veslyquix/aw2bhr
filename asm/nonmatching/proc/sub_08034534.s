	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034534
sub_08034534: @ 0x08034534
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r5, _08034584 @ =gUnknown_08499594
	lsls r4, r1, #1
	adds r4, r4, r1
	lsls r4, r4, #2
	ldr r6, [r5]
	adds r6, r6, r4
	ldr r4, _08034588 @ =gUnknown_030044B0
	strb r0, [r4]
	ldr r5, _0803458C @ =gUnknown_03003100
	ldrh r0, [r5]
	strb r0, [r4, #2]
	ldrh r0, [r5, #2]
	strb r0, [r4, #3]
	ldr r5, _08034590 @ =gUnknown_03003F24
	ldrh r0, [r5]
	strb r0, [r4, #4]
	ldrh r0, [r5, #2]
	strb r0, [r4, #5]
	strb r1, [r4, #1]
	strb r2, [r4, #6]
	strb r3, [r4, #7]
	ldrb r0, [r6, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strb r0, [r4, #0x12]
	ldr r0, _08034594 @ =gUnknown_03003110
	adds r1, r4, #0
	adds r1, #0xc
	bl sub_08034400
	adds r0, r4, #0
	bl sub_080308B4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034584: .4byte gUnknown_08499594
_08034588: .4byte gUnknown_030044B0
_0803458C: .4byte gUnknown_03003100
_08034590: .4byte gUnknown_03003F24
_08034594: .4byte gUnknown_03003110

