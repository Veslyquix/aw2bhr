	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C52C
sub_0806C52C: @ 0x0806C52C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0806C5D0 @ =gUnknown_085819D4
	bl Proc_EndEach
	bl sub_0801237C
	bl sub_08012358
	ldr r2, _0806C5D4 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r4, #1
	orrs r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, _0806C5D8 @ =gUnknown_03002B6C
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldr r3, _0806C5DC @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _0806C5E0 @ =gUnknown_030030B4
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2]
	ldr r2, _0806C5E4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_0803866C
	adds r5, r0, #0
	cmp r5, #0
	beq _0806C604
	ldr r0, _0806C5E8 @ =gUnknown_081A21B4
	movs r4, #0x80
	lsls r4, r4, #2
	movs r1, #0
	adds r2, r4, #0
	bl ApplyPaletteExt
	ldr r0, _0806C5EC @ =gUnknown_081A3D64
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806C5F0 @ =gUnknown_0819C454
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r0, _0806C5F4 @ =gUnknown_081A1C50
	ldr r1, _0806C5F8 @ =0x0600D800
	bl Decompress
	ldr r0, _0806C5FC @ =gUnknown_081A31C4
	ldr r1, _0806C600 @ =0x06010000
	bl Decompress
	movs r0, #1
	str r0, [r6, #0x38]
	b _0806C638
	.align 2, 0
_0806C5D0: .4byte gUnknown_085819D4
_0806C5D4: .4byte gDispIo
_0806C5D8: .4byte gUnknown_03002B6C
_0806C5DC: .4byte gUnknown_03001FE8
_0806C5E0: .4byte gUnknown_030030B4
_0806C5E4: .4byte gUnknown_0300251C
_0806C5E8: .4byte gUnknown_081A21B4
_0806C5EC: .4byte gUnknown_081A3D64
_0806C5F0: .4byte gUnknown_0819C454
_0806C5F4: .4byte gUnknown_081A1C50
_0806C5F8: .4byte 0x0600D800
_0806C5FC: .4byte gUnknown_081A31C4
_0806C600: .4byte 0x06010000
_0806C604:
	ldr r0, _0806C64C @ =gUnknown_0819C254
	movs r4, #0x80
	lsls r4, r4, #2
	movs r1, #0
	adds r2, r4, #0
	bl ApplyPaletteExt
	ldr r0, _0806C650 @ =gUnknown_081A3D44
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806C654 @ =gUnknown_08195318
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r0, _0806C658 @ =gUnknown_0819BCF0
	ldr r1, _0806C65C @ =0x0600D800
	bl Decompress
	ldr r0, _0806C660 @ =gUnknown_081A2A04
	ldr r1, _0806C664 @ =0x06010000
	bl Decompress
	str r5, [r6, #0x38]
_0806C638:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	bl sub_0803B3C8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C64C: .4byte gUnknown_0819C254
_0806C650: .4byte gUnknown_081A3D44
_0806C654: .4byte gUnknown_08195318
_0806C658: .4byte gUnknown_0819BCF0
_0806C65C: .4byte 0x0600D800
_0806C660: .4byte gUnknown_081A2A04
_0806C664: .4byte 0x06010000

