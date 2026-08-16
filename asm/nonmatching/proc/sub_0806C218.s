	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C218
sub_0806C218: @ 0x0806C218
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08038474
	movs r1, #5
	subs r0, r1, r0
	str r0, [r5, #0x58]
	movs r1, #0x10
	cmp r0, #3
	beq _0806C22E
	movs r1, #0x20
_0806C22E:
	str r1, [r5, #0x60]
	ldr r4, _0806C274 @ =gUnknown_085816F0
	lsls r0, r0, #4
	adds r1, r4, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806C278 @ =gUnknown_081A3D24
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r5, #0x58]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0806C27C @ =0x06011200
	bl Decompress
	ldr r0, _0806C280 @ =gUnknown_081A3BD4
	ldr r1, _0806C284 @ =0x06011A00
	bl Decompress
	ldr r1, _0806C288 @ =gUnknown_0202F2C0
	movs r0, #0
	str r0, [r1]
	str r0, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C274: .4byte gUnknown_085816F0
_0806C278: .4byte gUnknown_081A3D24
_0806C27C: .4byte 0x06011200
_0806C280: .4byte gUnknown_081A3BD4
_0806C284: .4byte 0x06011A00
_0806C288: .4byte gUnknown_0202F2C0

