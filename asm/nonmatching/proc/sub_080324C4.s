	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080324C4
sub_080324C4: @ 0x080324C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	mov r8, r0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r0, #0
	bl sub_0801A5B0
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	bl sub_08034290
	bl sub_080733B8
	ldr r1, _08032550 @ =0x0000FFD0
	movs r0, #0
	movs r2, #8
	bl sub_08072C40
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	bl sub_0801237C
	ldr r0, _08032554 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803252A
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _08032564
_0803252A:
	ldr r0, _08032558 @ =gUnknown_081D8A14
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0803255C @ =gUnknown_081D3EE8
	ldr r4, _08032560 @ =gUnknown_08090D28
	ldr r1, [r4]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	b _08032586
	.align 2, 0
_08032550: .4byte 0x0000FFD0
_08032554: .4byte gUnknown_03004008
_08032558: .4byte gUnknown_081D8A14
_0803255C: .4byte gUnknown_081D3EE8
_08032560: .4byte gUnknown_08090D28
_08032564:
	ldr r0, _08032620 @ =gUnknown_081D8A34
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08032624 @ =gUnknown_081D6458
	ldr r4, _08032628 @ =gUnknown_08090D28
	ldr r1, [r4]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
_08032586:
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _0803262C @ =0x06003000
	adds r1, r1, r0
	ldr r2, _08032630 @ =0x01000008
	add r0, sp, #0xc
	bl CpuFastSet
	movs r2, #0
	ldr r5, _08032634 @ =gUnknown_08499584
	movs r4, #0x80
	lsls r4, r4, #3
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r3, r0, #0
_080325AE:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r1, r1, r0
	adds r0, r1, r4
	strh r3, [r0]
	strh r3, [r1]
	adds r2, #1
	cmp r2, #0x7f
	ble _080325AE
	movs r2, #0x80
	ldr r4, _08032638 @ =0x000001FF
	ldr r3, _08032634 @ =gUnknown_08499584
_080325C6:
	ldr r0, [r3]
	lsls r1, r2, #1
	adds r1, r1, r0
	adds r0, r2, #0
	subs r0, #0x80
	strh r0, [r1]
	adds r2, #1
	cmp r2, r4
	ble _080325C6
	ldr r0, _0803263C @ =gUnknown_0849B644
	ldr r1, _08032640 @ =gUnknown_02010C50
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	movs r2, #0xec
	movs r3, #0xf
	bl sub_08073304
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _08032654
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #0
	movs r1, #3
	bl sub_0802D5CC
	ldr r0, _08032644 @ =gUnknown_081D2660
	ldr r1, _08032648 @ =0x06006280
	bl Decompress
	ldr r0, _0803264C @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08032650 @ =0x00000442
	adds r0, r0, r1
	bl sub_08032484
	b _08032672
	.align 2, 0
_08032620: .4byte gUnknown_081D8A34
_08032624: .4byte gUnknown_081D6458
_08032628: .4byte gUnknown_08090D28
_0803262C: .4byte 0x06003000
_08032630: .4byte 0x01000008
_08032634: .4byte gUnknown_08499584
_08032638: .4byte 0x000001FF
_0803263C: .4byte gUnknown_0849B644
_08032640: .4byte gUnknown_02010C50
_08032644: .4byte gUnknown_081D2660
_08032648: .4byte 0x06006280
_0803264C: .4byte gUnknown_08499578
_08032650: .4byte 0x00000442
_08032654:
	ldr r0, _08032680 @ =gUnknown_081320AC
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08032684 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
_08032672:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032680: .4byte gUnknown_081320AC
_08032684: .4byte gUnknown_0849B060

