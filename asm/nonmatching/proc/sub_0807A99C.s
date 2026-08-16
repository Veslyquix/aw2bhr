	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A99C
sub_0807A99C: @ 0x0807A99C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	cmp r5, #0
	beq _0807A9B2
	subs r5, #1
	b _0807A9BE
_0807A9B2:
	ldr r0, _0807AA38 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x12
	bl DivRem
	adds r5, r0, #0
_0807A9BE:
	ldr r7, _0807AA3C @ =gUnknown_08615E4C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r6, r0, #2
	adds r0, r6, r7
	ldr r0, [r0]
	ldr r4, _0807AA40 @ =gUnknown_0300251C
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0807AA44 @ =0x06001B00
	adds r1, r1, r2
	bl Decompress
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0807AA48 @ =0x06003600
	adds r1, r1, r2
	bl Decompress
	adds r0, r7, #0
	adds r0, #0xc
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r1, _0807AA4C @ =gUnknown_08499584
	ldr r1, [r1]
	bl Decompress
	bl sub_08013B1C
	cmp r5, #7
	bne _0807AA50
	adds r0, r7, #0
	adds r0, #0x9c
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, #5
	movs r2, #0xe0
	bl ApplyPaletteExt
	b _0807AA62
	.align 2, 0
_0807AA38: .4byte gUnknown_03004008
_0807AA3C: .4byte gUnknown_08615E4C
_0807AA40: .4byte gUnknown_0300251C
_0807AA44: .4byte 0x06001B00
_0807AA48: .4byte 0x06003600
_0807AA4C: .4byte gUnknown_08499584
_0807AA50:
	adds r0, r7, #0
	adds r0, #0x10
	adds r0, r6, r0
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, #5
	movs r2, #0xc0
	bl ApplyPaletteExt
_0807AA62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

