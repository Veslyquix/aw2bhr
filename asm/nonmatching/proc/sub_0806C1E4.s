	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C1E4
sub_0806C1E4: @ 0x0806C1E4
	push {lr}
	ldr r2, _0806C20C @ =gUnknown_081A3D84
	ldr r0, _0806C210 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x1f
	ands r0, r1
	lsrs r0, r0, #1
	ldr r1, _0806C214 @ =gUnknown_030020C0
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0
_0806C20C: .4byte gUnknown_081A3D84
_0806C210: .4byte gUnknown_03004008
_0806C214: .4byte gUnknown_030020C0

