	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800AF24
sub_0800AF24: @ 0x0800AF24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	ble _0800AF44
	subs r6, r4, #1
	adds r1, r6, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800AF44
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800B048
_0800AF44:
	ldr r0, _0800AF70 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r4, r0
	bge _0800AF68
	adds r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800AF68
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800B048
_0800AF68:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800AF70: .4byte gUnknown_08499590

