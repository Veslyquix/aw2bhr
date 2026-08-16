	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005B24
sub_08005B24: @ 0x08005B24
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _08005B84 @ =gUnknown_0808D7C8
	ldr r4, [r1]
	ldr r2, [r4]
	movs r0, #6
	ldrsb r0, [r2, r0]
	adds r6, r1, #0
	cmp r0, #0
	beq _08005B5A
	movs r1, #0
	strb r1, [r2, #6]
	ldr r0, [r4]
	strh r1, [r0, #2]
	ldr r0, _08005B88 @ =gUnknown_03001418
	strh r1, [r0]
	ldr r0, _08005B8C @ =gUnknown_03001FF8
	strh r1, [r0]
	movs r0, #2
	movs r1, #2
	movs r2, #0x1a
	movs r3, #0xf
	bl sub_0801A444
	movs r0, #0
	bl sub_0801B780
_08005B5A:
	ldr r2, _08005B90 @ =gUnknown_0808D7CC
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #7
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08005B72
	ldr r1, [r4]
	movs r0, #0x5a
	strh r0, [r1, #2]
_08005B72:
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08005BB6
	cmp r0, #1
	bgt _08005B94
	cmp r0, #0
	beq _08005B9E
	b _08005C8A
	.align 2, 0
_08005B84: .4byte gUnknown_0808D7C8
_08005B88: .4byte gUnknown_03001418
_08005B8C: .4byte gUnknown_03001FF8
_08005B90: .4byte gUnknown_0808D7CC
_08005B94:
	cmp r0, #0xa
	beq _08005BF4
	cmp r0, #0xb
	beq _08005C0C
	b _08005C8A
_08005B9E:
	movs r0, #0
	bl sub_0801B780
	ldr r1, [r4]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	bl sub_080059FC
	movs r0, #1
	bl sub_08005EF0
_08005BB6:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08005C8A
	ldr r0, [r6]
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xa
	strh r0, [r1, #2]
	ldr r0, _08005BF0 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #0x14
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0
	movs r3, #0x1e
	bl sub_08012BC8
	bl sub_08013AEC
	bl sub_08005F1C
	movs r0, #0x67
	bl sub_0803B4DC
	b _08005C8A
	.align 2, 0
_08005BF0: .4byte gUnknown_08499578
_08005BF4:
	movs r0, #0
	bl sub_0801B780
	ldr r1, [r4]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	bl sub_08005AA0
	movs r0, #0
	bl sub_08005EF0
_08005C0C:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08005C42
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #0
	strh r2, [r0, #2]
	ldr r0, _08005CF0 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #0x14
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0
	movs r3, #0x1e
	bl sub_08012BC8
	bl sub_08013AEC
	bl sub_08005F1C
	movs r0, #0x67
	bl sub_0803B4DC
_08005C42:
	ldr r2, _08005CF4 @ =0x00000421
	movs r4, #0
	str r4, [sp]
	movs r0, #0x35
	movs r1, #0x28
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _08005CF8 @ =0x00000431
	str r4, [sp]
	movs r0, #0x36
	movs r1, #0x28
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _08005CFC @ =0x00000441
	str r4, [sp]
	movs r0, #0x37
	movs r1, #0x28
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _08005D00 @ =0x00000451
	str r4, [sp]
	movs r0, #0x38
	movs r1, #0x28
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _08005D04 @ =0x00000461
	str r4, [sp]
	movs r0, #0x3c
	movs r1, #0x20
	movs r3, #0
	bl sub_0801F34C
_08005C8A:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r0, #0x5a
	bne _08005CE6
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08005CA8
	ldr r1, _08005D08 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
_08005CA8:
	bl sub_08005F1C
	ldr r0, _08005CF0 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r4, #0x14
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	movs r3, #0x1e
	bl sub_08012BC8
	ldr r0, _08005D0C @ =gUnknown_08499580
	ldr r0, [r0]
	str r4, [sp]
	movs r1, #0xd8
	lsls r1, r1, #2
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0x1e
	bl sub_08012BC8
	bl sub_08013AEC
	bl sub_08013B0C
	ldr r0, _08005D10 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08005CE6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005CF0: .4byte gUnknown_08499578
_08005CF4: .4byte 0x00000421
_08005CF8: .4byte 0x00000431
_08005CFC: .4byte 0x00000441
_08005D00: .4byte 0x00000451
_08005D04: .4byte 0x00000461
_08005D08: .4byte gUnknown_03002F1C
_08005D0C: .4byte gUnknown_08499580
_08005D10: .4byte gUnknown_03001FBC

