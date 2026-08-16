	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080397F4
sub_080397F4: @ 0x080397F4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08039818 @ =gUnknown_030033EC
	ldrh r2, [r1]
	ldr r1, _0803981C @ =gUnknown_08499598
	ldr r3, [r1]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r1, [r1, #0x1d]
	movs r2, #0
	bl sub_08019818
	pop {r0}
	bx r0
	.align 2, 0
_08039818: .4byte gUnknown_030033EC
_0803981C: .4byte gUnknown_08499598

