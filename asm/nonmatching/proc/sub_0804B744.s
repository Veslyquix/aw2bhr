	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B744
sub_0804B744: @ 0x0804B744
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _0804B7F8 @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0804B776
	ldr r4, _0804B7FC @ =gUnknown_03004528
	ldr r1, [r4]
	adds r0, r6, #0
	movs r2, #0
	bl sub_0804B55C
	adds r6, r0, #0
	ldr r1, [r4, #4]
	adds r0, r5, #0
	movs r2, #0
	bl sub_0804B55C
	adds r5, r0, #0
_0804B776:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0804B644
	adds r5, r0, #0
	ldr r4, _0804B800 @ =gUnknown_085D6A48
	ldr r3, _0804B804 @ =gUnknown_03004580
	ldrh r1, [r3, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r0, [r2, #8]
	cmp r0, #3
	bne _0804B796
	movs r6, #0x33
_0804B796:
	ldrh r0, [r3, #0x12]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #8]
	cmp r0, #3
	bne _0804B7A8
	movs r5, #0x33
_0804B7A8:
	ldrh r0, [r2, #2]
	cmp r0, #2
	bne _0804B7B0
	movs r6, #7
_0804B7B0:
	ldrh r0, [r1, #2]
	cmp r0, #2
	bne _0804B7B8
	movs r5, #7
_0804B7B8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0804B8BC
	ldr r2, _0804B808 @ =0x06008000
	ldr r3, _0804B80C @ =0x06003000
	ldr r0, _0804B810 @ =0x05000020
	str r0, [sp]
	ldr r0, _0804B814 @ =0x06017C00
	str r0, [sp, #4]
	ldr r0, _0804B818 @ =0x05000380
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r6, #0
	bl sub_0804B850
	ldr r2, _0804B81C @ =0x0600C000
	ldr r3, _0804B820 @ =0x06003800
	ldr r0, _0804B824 @ =0x05000080
	str r0, [sp]
	ldr r0, _0804B828 @ =0x06017E00
	str r0, [sp, #4]
	ldr r0, _0804B82C @ =0x050003A0
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r5, #0
	bl sub_0804B850
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B7F8: .4byte gUnknown_03004504
_0804B7FC: .4byte gUnknown_03004528
_0804B800: .4byte gUnknown_085D6A48
_0804B804: .4byte gUnknown_03004580
_0804B808: .4byte 0x06008000
_0804B80C: .4byte 0x06003000
_0804B810: .4byte 0x05000020
_0804B814: .4byte 0x06017C00
_0804B818: .4byte 0x05000380
_0804B81C: .4byte 0x0600C000
_0804B820: .4byte 0x06003800
_0804B824: .4byte 0x05000080
_0804B828: .4byte 0x06017E00
_0804B82C: .4byte 0x050003A0

