	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045358
sub_08045358: @ 0x08045358
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804539C @ =gUnknown_08112704
	ldr r1, _080453A0 @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _080453A4 @ =0x06005600
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r5, #0x4c]
	ldr r4, _080453A8 @ =gUnknown_08499578
	ldr r1, [r4]
	bl Decompress
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	ldr r2, _080453AC @ =0x000082B0
	bl sub_08012B00
	ldr r0, [r5, #0x50]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08013AEC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804539C: .4byte gUnknown_08112704
_080453A0: .4byte gUnknown_03002B6C
_080453A4: .4byte 0x06005600
_080453A8: .4byte gUnknown_08499578
_080453AC: .4byte 0x000082B0

