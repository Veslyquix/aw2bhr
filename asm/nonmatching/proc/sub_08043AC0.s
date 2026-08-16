	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043AC0
sub_08043AC0: @ 0x08043AC0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r2, #0
	movs r1, #0x18
	bl __modsi3
	ldr r4, _08043AF8 @ =gUnknown_084A0090
	movs r1, #0x18
	bl __modsi3
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, #8
	adds r1, r1, r4
	lsls r6, r6, #5
	ldr r0, [r1]
	adds r0, r0, r6
	lsls r5, r5, #0x15
	lsrs r5, r5, #0x10
	adds r1, r5, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043AF8: .4byte gUnknown_084A0090

