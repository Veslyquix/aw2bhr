	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007D70
sub_08007D70: @ 0x08007D70
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetTileWithShadow_unkMapA22
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	ldr r0, _08007DAC @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #2
	cmp r4, r0
	bge _08007DA4
	adds r4, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTileWithShadow_unkMapA22
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_08007DA4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007DAC: .4byte gUnknown_08499590

