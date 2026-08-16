	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F064
sub_0806F064: @ 0x0806F064
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0806F09C @ =gUnknown_03004008
	ldrh r6, [r5]
	ldr r0, [r0]
	adds r1, r6, #0
	bl __umodsi3
	adds r1, r0, #1
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, r4
	bne _0806F096
	adds r1, #1
	adds r0, r1, #0
	adds r1, r6, #0
	bl __modsi3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
_0806F096:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806F09C: .4byte gUnknown_03004008

