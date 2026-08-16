	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A260
sub_0804A260: @ 0x0804A260
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	bl sub_0801B768
	ldr r0, _0804A348 @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _0804A34C @ =sub_08036884
	bl sub_080366D0
	ldr r0, _0804A350 @ =gUnknown_084C3D1C
	bl sub_08012C58
	ldr r5, _0804A354 @ =gUnknown_0812A274
	ldr r6, [r5]
	ldr r0, [r6]
	movs r4, #0
	movs r3, #0
	strh r3, [r0, #0x1e]
	strh r3, [r0, #0x20]
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	strh r3, [r0, #0x26]
	strh r3, [r0, #0x28]
	adds r0, #0x63
	strb r4, [r0]
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	lsrs r0, r0, #1
	movs r1, #0xe
	subs r1, r1, r0
	adds r2, #0x61
	strb r1, [r2]
	ldr r0, [r6]
	adds r0, #0x62
	strb r4, [r0]
	ldr r0, [r6]
	strh r3, [r0, #0x2a]
	adds r0, #0x64
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, #0x66
	strb r4, [r0]
	movs r0, #0
	bl sub_0801A5B0
	movs r0, #0
	movs r1, #8
	bl sub_0802D5CC
	bl sub_08022A34
	ldr r0, _0804A358 @ =gUnknown_0809165C
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _0804A35C @ =gUnknown_03002B6C
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, _0804A360 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r4, _0804A364 @ =gUnknown_0812A278
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0x14
	str r1, [sp]
	movs r1, #0xd8
	lsls r1, r1, #2
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0x1e
	bl sub_08012BC8
	ldr r1, _0804A368 @ =gUnknown_0812A27C
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r7, r5, #0
	mov sl, r4
	mov sb, r1
	cmp r0, #0
	bne _0804A332
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A374
_0804A332:
	ldr r0, _0804A36C @ =gUnknown_03001FF8
	movs r2, #0xec
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0804A370 @ =gUnknown_030030A0
	strh r1, [r0]
	ldr r1, [r6]
	movs r0, #0xf0
	strh r0, [r1, #0x2a]
	b _0804A386
	.align 2, 0
_0804A348: .4byte sub_080368E8
_0804A34C: .4byte sub_08036884
_0804A350: .4byte gUnknown_084C3D1C
_0804A354: .4byte gUnknown_0812A274
_0804A358: .4byte gUnknown_0809165C
_0804A35C: .4byte gUnknown_03002B6C
_0804A360: .4byte gDispIo
_0804A364: .4byte gUnknown_0812A278
_0804A368: .4byte gUnknown_0812A27C
_0804A36C: .4byte gUnknown_03001FF8
_0804A370: .4byte gUnknown_030030A0
_0804A374:
	ldr r0, _0804A468 @ =gUnknown_03001FF8
	movs r3, #0x9c
	lsls r3, r3, #1
	adds r1, r3, #0
	strh r1, [r0]
	ldr r0, _0804A46C @ =gUnknown_030030A0
	strh r1, [r0]
	movs r0, #0xa0
	strh r0, [r2, #0x2a]
_0804A386:
	bl sub_08013C00
	ldr r0, _0804A470 @ =gUnknown_08499578
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _0804A474 @ =0x06007800
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
	bl sub_08013CA8
	bl sub_080616F0
	mov r1, r8
	ldr r2, [r1]
	ldr r6, _0804A478 @ =gUnknown_084C3B3C
	ldr r3, [r6]
	movs r5, #0x80
	lsls r5, r5, #8
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #6
	movs r1, #6
	bl sub_080149C0
	mov r3, r8
	ldr r2, [r3]
	ldr r3, [r6, #4]
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #6
	movs r1, #8
	bl sub_080149C0
	mov r0, r8
	ldr r2, [r0]
	ldr r3, [r6, #8]
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #6
	movs r1, #0xa
	bl sub_080149C0
	mov r1, r8
	ldr r2, [r1]
	ldr r3, [r6, #0xc]
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #6
	movs r1, #0xc
	bl sub_080149C0
	mov r3, r8
	ldr r2, [r3]
	ldr r3, [r6, #0x10]
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #6
	movs r1, #0xe
	bl sub_080149C0
	ldr r2, [r7]
	ldr r0, [r2]
	ldr r5, [r0, #0x58]
	movs r3, #0
	adds r0, #0x5f
	ldrb r0, [r0]
	cmp r3, r0
	bge _0804A438
	adds r4, r2, #0
_0804A416:
	ldr r2, [r4]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r2, #0x41
	adds r2, r2, r1
	adds r0, r5, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r4]
	adds r0, #0x5f
	ldrb r0, [r0]
	cmp r1, r0
	blt _0804A416
_0804A438:
	ldr r4, [r7]
	ldr r1, [r4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, #0x41
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x41
	bl sub_08013034
	bl sub_0804A6A4
	movs r3, #0
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x5f
	ldrb r1, [r1]
	cmp r3, r1
	bge _0804A4AE
	adds r0, #0x41
	b _0804A4A8
	.align 2, 0
_0804A468: .4byte gUnknown_03001FF8
_0804A46C: .4byte gUnknown_030030A0
_0804A470: .4byte gUnknown_08499578
_0804A474: .4byte 0x06007800
_0804A478: .4byte gUnknown_084C3B3C
_0804A47C:
	ldr r1, [r4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r2, r1, #0
	adds r2, #0x2c
	adds r2, r2, r0
	adds r1, #0x41
	adds r1, r1, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0x5f
	ldrb r2, [r2]
	cmp r1, r2
	bge _0804A4AE
	adds r0, #0x41
	adds r0, r0, r1
_0804A4A8:
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A47C
_0804A4AE:
	ldr r5, [r7]
	ldr r0, [r5]
	adds r0, #0x5d
	strb r3, [r0]
	movs r0, #0
	bl sub_0804A1E4
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_080741C4
	ldr r0, _0804A558 @ =gUnknown_0849D55C
	movs r1, #0
	bl sub_080152C0
	ldr r1, _0804A55C @ =gUnknown_084C3B2C
	ldr r0, _0804A560 @ =gUnknown_02028E40
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0804A564 @ =0x06010000
	bl Decompress
	ldr r0, _0804A568 @ =gUnknown_081358A0
	ldr r1, _0804A56C @ =0x060103E0
	bl Decompress
	ldr r4, _0804A570 @ =gUnknown_0813204C
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _0804A574 @ =gUnknown_0812B21C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	mov r1, sb
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A554
	ldr r0, [r5]
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A57C
_0804A554:
	ldr r0, _0804A578 @ =gUnknown_08499580
	b _0804A580
	.align 2, 0
_0804A558: .4byte gUnknown_0849D55C
_0804A55C: .4byte gUnknown_084C3B2C
_0804A560: .4byte gUnknown_02028E40
_0804A564: .4byte 0x06010000
_0804A568: .4byte gUnknown_081358A0
_0804A56C: .4byte 0x060103E0
_0804A570: .4byte gUnknown_0813204C
_0804A574: .4byte gUnknown_0812B21C
_0804A578: .4byte gUnknown_08499580
_0804A57C:
	mov r2, sl
	ldr r0, [r2]
_0804A580:
	ldr r5, [r0]
	ldr r4, [r7]
	ldr r0, [r4]
	adds r0, #0x61
	ldrb r1, [r0]
	subs r1, #1
	ldr r3, _0804A634 @ =gUnknown_0812AD2C
	ldr r0, _0804A638 @ =0x00008360
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	bl sub_08071948
	movs r3, #0
	ldr r0, [r4]
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r3, r0
	bge _0804A5D4
	adds r6, r4, #0
_0804A5A8:
	ldr r0, [r6]
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r4, r3, #0x10
	asrs r4, r4, #0x10
	adds r1, r1, r4
	ldr r0, _0804A638 @ =0x00008360
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	ldr r3, _0804A63C @ =gUnknown_0812AD38
	bl sub_08071948
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [r6]
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r4, r0
	blt _0804A5A8
_0804A5D4:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x61
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	ldrb r0, [r0]
	adds r1, r1, r0
	ldr r3, _0804A640 @ =gUnknown_0812AD44
	ldr r4, _0804A638 @ =0x00008360
	str r4, [sp]
	adds r0, r5, #0
	movs r2, #1
	bl sub_08071948
	ldr r3, _0804A644 @ =gUnknown_0812AD50
	str r4, [sp]
	adds r0, r5, #0
	movs r1, #5
	movs r2, #5
	bl sub_08071948
	bl sub_08013AEC
	bl sub_08013B0C
	bl sub_08013B1C
	movs r0, #0
	movs r1, #0x27
	movs r2, #6
	bl sub_08043BA4
	ldr r0, _0804A648 @ =gUnknown_084C3D8C
	movs r1, #0
	bl sub_080152C0
	movs r0, #0xc8
	lsls r0, r0, #1
	bl sub_0803B524
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A634: .4byte gUnknown_0812AD2C
_0804A638: .4byte 0x00008360
_0804A63C: .4byte gUnknown_0812AD38
_0804A640: .4byte gUnknown_0812AD44
_0804A644: .4byte gUnknown_0812AD50
_0804A648: .4byte gUnknown_084C3D8C

