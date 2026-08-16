	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AADC
sub_0806AADC: @ 0x0806AADC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0806AB1C @ =gUnknown_085816F0
	ldr r0, [r4, #0x4c]
	lsls r0, r0, #4
	adds r1, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	adds r1, #0x50
	ldrh r1, [r1]
	adds r1, #0x10
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl sub_08013618
	ldr r0, [r4, #0x4c]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldr r0, [r0]
	adds r4, #0x52
	ldrh r1, [r4]
	lsls r1, r1, #5
	ldr r2, _0806AB20 @ =0x06011200
	adds r1, r1, r2
	bl sub_08011CAC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB1C: .4byte gUnknown_085816F0
_0806AB20: .4byte 0x06011200

