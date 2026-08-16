	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AEC4
sub_0806AEC4: @ 0x0806AEC4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0806AF1C @ =gUnknown_0858178C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r5, r0, #2
	adds r0, r5, r6
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	adds r0, r6, #4
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _0806AF20 @ =0x06001B00
	bl Decompress
	adds r0, r6, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _0806AF24 @ =0x06003600
	bl Decompress
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _0806AF28 @ =gUnknown_08499578
	ldr r1, [r1]
	bl Decompress
	cmp r4, #7
	bne _0806AF2C
	adds r0, r6, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0xe0
	bl ApplyPaletteExt
	b _0806AF3C
	.align 2, 0
_0806AF1C: .4byte gUnknown_0858178C
_0806AF20: .4byte 0x06001B00
_0806AF24: .4byte 0x06003600
_0806AF28: .4byte gUnknown_08499578
_0806AF2C:
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0xc0
	bl ApplyPaletteExt
_0806AF3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

