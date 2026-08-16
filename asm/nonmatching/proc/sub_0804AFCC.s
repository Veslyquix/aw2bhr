	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AFCC
sub_0804AFCC: @ 0x0804AFCC
	push {r4, r5, lr}
	sub sp, #8
	ldr r1, _0804AFF4 @ =gUnknown_03001FF8
	ldrh r0, [r1]
	subs r0, #0xa
	strh r0, [r1]
	ldr r2, _0804AFF8 @ =gUnknown_0812A2A8
	ldr r1, [r2]
	ldrh r0, [r1]
	subs r0, #0xa
	strh r0, [r1]
	ldr r0, _0804AFFC @ =gUnknown_030044E0
	ldr r1, [r0]
	ldrh r3, [r1, #0x2a]
	movs r4, #0x2a
	ldrsh r0, [r1, r4]
	cmp r0, #0xa0
	ble _0804B000
	subs r0, r3, #4
	b _0804B002
	.align 2, 0
_0804AFF4: .4byte gUnknown_03001FF8
_0804AFF8: .4byte gUnknown_0812A2A8
_0804AFFC: .4byte gUnknown_030044E0
_0804B000:
	movs r0, #0xa0
_0804B002:
	strh r0, [r1, #0x2a]
	ldr r0, [r2]
	ldrh r4, [r0]
	ldr r0, _0804B05C @ =0xFFFFFEC8
	adds r4, r4, r0
	asrs r4, r4, #3
	adds r4, #5
	movs r0, #0x1f
	ands r4, r0
	ldr r0, _0804B060 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r5, #0x14
	str r5, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #3
	bl sub_08012BC8
	ldr r0, _0804B064 @ =gUnknown_08499580
	ldr r0, [r0]
	str r5, [sp]
	movs r1, #0xd8
	lsls r1, r1, #2
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #3
	bl sub_08012BC8
	bl sub_08013AEC
	bl sub_08013B0C
	cmp r4, #0
	bne _0804B054
	ldr r0, _0804B068 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0804B054:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B05C: .4byte 0xFFFFFEC8
_0804B060: .4byte gUnknown_08499578
_0804B064: .4byte gUnknown_08499580
_0804B068: .4byte gUnknown_03001FBC

