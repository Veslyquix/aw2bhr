	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076888
sub_08076888: @ 0x08076888
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r7, _08076980 @ =gUnknown_0202FE38
	ldr r0, _08076984 @ =sub_08036884
	bl sub_080366D0
	ldr r0, _08076988 @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _0807698C @ =gUnknown_08614548
	bl sub_08012C58
	ldr r2, _08076990 @ =gDispIo
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
	ldr r0, _08076994 @ =gUnknown_081CC588
	mov r8, r0
	ldr r3, [r0]
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r6, _08076998 @ =gUnknown_081CC58C
	ldr r3, [r6]
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _0807699C @ =gUnknown_03001FE8
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r5
	strb r1, [r2]
	ldr r2, _080769A0 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	movs r4, #0
	str r4, [sp]
	ldr r0, _080769A4 @ =gUnknown_08499578
	ldr r1, [r0]
	ldr r5, _080769A8 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080769AC @ =gUnknown_0849957C
	ldr r1, [r1]
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r1, _080769B0 @ =gUnknown_08499580
	ldr r1, [r1]
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	ldr r0, _080769B4 @ =gUnknown_081CC5F0
	ldr r1, _080769B8 @ =0x06008000
	bl Decompress
	ldr r0, _080769BC @ =gUnknown_081D1504
	movs r2, #0x90
	lsls r2, r2, #1
	movs r1, #0xc0
	bl ApplyPaletteExt
	ldr r0, _080769C0 @ =gUnknown_081D1644
	ldr r1, _080769C4 @ =0x06010900
	bl Decompress
	ldr r0, _080769C8 @ =gUnknown_081D17A4
	ldr r1, _080769CC @ =0x06010B00
	bl Decompress
	ldr r0, _080769D0 @ =gUnknown_081D2A54
	ldr r1, _080769D4 @ =0x06010000
	bl Decompress
	ldr r4, _080769D8 @ =gUnknown_081D208C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_0803866C
	mov r5, r8
	cmp r0, #0
	bne _080769DC
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080769E8
	.align 2, 0
_08076980: .4byte gUnknown_0202FE38
_08076984: .4byte sub_08036884
_08076988: .4byte sub_080368E8
_0807698C: .4byte gUnknown_08614548
_08076990: .4byte gDispIo
_08076994: .4byte gUnknown_081CC588
_08076998: .4byte gUnknown_081CC58C
_0807699C: .4byte gUnknown_03001FE8
_080769A0: .4byte gUnknown_0300251C
_080769A4: .4byte gUnknown_08499578
_080769A8: .4byte 0x01000200
_080769AC: .4byte gUnknown_0849957C
_080769B0: .4byte gUnknown_08499580
_080769B4: .4byte gUnknown_081CC5F0
_080769B8: .4byte 0x06008000
_080769BC: .4byte gUnknown_081D1504
_080769C0: .4byte gUnknown_081D1644
_080769C4: .4byte 0x06010900
_080769C8: .4byte gUnknown_081D17A4
_080769CC: .4byte 0x06010B00
_080769D0: .4byte gUnknown_081D2A54
_080769D4: .4byte 0x06010000
_080769D8: .4byte gUnknown_081D208C
_080769DC:
	ldr r0, _08076A50 @ =gUnknown_081D20CC
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
_080769E8:
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _08076A54 @ =0x06006C00
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0
	bl sub_0802D5A0
	movs r4, #0
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	ldr r1, [r5]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	ldr r2, _08076A58 @ =0x01000008
	bl CpuFastSet
	ldr r0, _08076A5C @ =gUnknown_0202FDFC
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl sub_08072C40
	ldr r0, _08076A60 @ =0x0000FFFF
	strh r0, [r7]
	ldr r0, _08076A64 @ =gUnknown_03000640
	str r4, [r0, #8]
	strh r4, [r0, #6]
	strh r4, [r0, #4]
	strh r4, [r0, #2]
	strh r4, [r0]
	movs r0, #4
	bl sub_08074714
	bl sub_0801237C
	bl sub_08012358
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A50: .4byte gUnknown_081D20CC
_08076A54: .4byte 0x06006C00
_08076A58: .4byte 0x01000008
_08076A5C: .4byte gUnknown_0202FDFC
_08076A60: .4byte 0x0000FFFF
_08076A64: .4byte gUnknown_03000640

