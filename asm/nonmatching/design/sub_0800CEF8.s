	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800CEF8
sub_0800CEF8: @ 0x0800CEF8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0800CF24 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800CF1C
	adds r4, #1
	adds r0, r4, #0
	bl GetTileWithShadow_unkMapA22
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_0800CF1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF24: .4byte gUnknown_08499590

