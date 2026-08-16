	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806EB28
sub_0806EB28: @ 0x0806EB28
	push {lr}
	adds r2, r0, #0
	ldr r0, _0806EB54 @ =gUnknown_03004008
	ldr r1, [r0]
	movs r0, #3
	ands r1, r0
	ldrh r0, [r2, #0x36]
	cmp r0, r1
	bne _0806EB3C
	adds r1, #1
_0806EB3C:
	strh r1, [r2, #0x36]
	ldr r0, _0806EB58 @ =gUnknown_08582754
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0806EB54: .4byte gUnknown_03004008
_0806EB58: .4byte gUnknown_08582754

