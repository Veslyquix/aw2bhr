	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E7FC
sub_0806E7FC: @ 0x0806E7FC
	push {lr}
	ldr r3, _0806E824 @ =gUnknown_081A47E4
	ldr r2, _0806E828 @ =gPal
	ldr r0, _0806E82C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x1f
	ands r0, r1
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xf6
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0
_0806E824: .4byte gUnknown_081A47E4
_0806E828: .4byte gPal
_0806E82C: .4byte gUnknown_03004008

