	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011AD8
sub_08011AD8: @ 0x08011AD8
	push {r4, r5, r6, lr}
	ldr r1, _08011B10 @ =gUnknown_030030E8
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	movs r4, #0
	cmp r0, #0
	ble _08011B04
	ldr r6, _08011B14 @ =gUnknown_03002FA0
	adds r5, r1, #0
_08011AEA:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, r0
	blt _08011AEA
_08011B04:
	bl sub_08011A84
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011B10: .4byte gUnknown_030030E8
_08011B14: .4byte gUnknown_03002FA0

