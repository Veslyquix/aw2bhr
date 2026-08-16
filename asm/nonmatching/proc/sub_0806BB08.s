	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BB08
sub_0806BB08: @ 0x0806BB08
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	bl sub_08012358
	ldr r0, _0806BC9C @ =gUnknown_0858175C
	bl Proc_EndEach
	ldr r0, _0806BCA0 @ =gUnknown_085819E4
	bl sub_080670F8
	ldr r2, _0806BCA4 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r3, _0806BCA8 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _0806BCAC @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _0806BCB0 @ =gUnknown_030030B4
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r5
	strb r1, [r2]
	ldr r2, _0806BCB4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r5, _0806BCB8 @ =gUnknown_08499578
	ldr r0, [r5]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	movs r2, #0
	bl sub_08072C28
	ldr r6, _0806BCBC @ =gUnknown_0849957C
	ldr r0, [r6]
	adds r1, r4, #0
	movs r2, #0
	bl sub_08072C28
	ldr r0, _0806BCC0 @ =gUnknown_08499580
	mov r8, r0
	ldr r0, [r0]
	adds r1, r4, #0
	movs r2, #0
	bl sub_08072C28
	ldr r0, _0806BCC4 @ =gUnknown_081951F4
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _0806BCC8 @ =gUnknown_08195214
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806BCCC @ =gUnknown_08194614
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r4, _0806BCD0 @ =gUnknown_08191ADC
	ldr r1, _0806BCD4 @ =0x06001400
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0806BCD8 @ =gUnknown_081B9A38
	ldr r1, _0806BCDC @ =0x06001C00
	bl Decompress
	ldr r0, _0806BCE0 @ =gUnknown_08194A9C
	ldr r1, _0806BCE4 @ =0x06008000
	bl Decompress
	ldr r0, _0806BCE8 @ =gUnknown_0819507C
	ldr r1, _0806BCEC @ =gUnknown_08499584
	ldr r1, [r1]
	bl Decompress
	ldr r1, _0806BCF0 @ =0x06011400
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r5]
	adds r0, #2
	ldr r1, _0806BCF4 @ =gUnknown_08195234
	movs r2, #0
	bl sub_080718F8
	ldr r0, [r6]
	ldr r4, _0806BCF8 @ =gUnknown_081952D4
	adds r1, r4, #0
	movs r2, #0
	bl sub_080718F8
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xe
	adds r1, r4, #0
	movs r2, #0
	bl sub_080718F8
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r2, _0806BCFC @ =0x0000FFFC
	movs r0, #0
	movs r1, #0
	bl sub_08072C40
	ldr r0, _0806BD00 @ =gUnknown_085819D4
	mov r1, sb
	bl Proc_Start
	ldr r2, _0806BD04 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0806BD08 @ =gUnknown_03002020
	movs r0, #9
	strh r0, [r1]
	ldr r1, _0806BD0C @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0806BD10 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0806BD14 @ =0x0000FFE0
	ands r0, r1
	movs r1, #7
	orrs r0, r1
	ldr r1, _0806BD18 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0x40
	movs r3, #0xa0
	bl sub_0806BA6C
	movs r0, #0xa
	bl sub_0803B3D4
	movs r0, #0xd0
	lsls r0, r0, #1
	bl sub_0803B524
	movs r0, #0
	mov r1, sb
	str r0, [r1, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806BC9C: .4byte gUnknown_0858175C
_0806BCA0: .4byte gUnknown_085819E4
_0806BCA4: .4byte gDispIo
_0806BCA8: .4byte gUnknown_03002B6C
_0806BCAC: .4byte gUnknown_03001FE8
_0806BCB0: .4byte gUnknown_030030B4
_0806BCB4: .4byte gUnknown_0300251C
_0806BCB8: .4byte gUnknown_08499578
_0806BCBC: .4byte gUnknown_0849957C
_0806BCC0: .4byte gUnknown_08499580
_0806BCC4: .4byte gUnknown_081951F4
_0806BCC8: .4byte gUnknown_08195214
_0806BCCC: .4byte gUnknown_08194614
_0806BCD0: .4byte gUnknown_08191ADC
_0806BCD4: .4byte 0x06001400
_0806BCD8: .4byte gUnknown_081B9A38
_0806BCDC: .4byte 0x06001C00
_0806BCE0: .4byte gUnknown_08194A9C
_0806BCE4: .4byte 0x06008000
_0806BCE8: .4byte gUnknown_0819507C
_0806BCEC: .4byte gUnknown_08499584
_0806BCF0: .4byte 0x06011400
_0806BCF4: .4byte gUnknown_08195234
_0806BCF8: .4byte gUnknown_081952D4
_0806BCFC: .4byte 0x0000FFFC
_0806BD00: .4byte gUnknown_085819D4
_0806BD04: .4byte gUnknown_030030E0
_0806BD08: .4byte gUnknown_03002020
_0806BD0C: .4byte gUnknown_03002B28
_0806BD10: .4byte gUnknown_03001FFC
_0806BD14: .4byte 0x0000FFE0
_0806BD18: .4byte 0x0000E0FF

