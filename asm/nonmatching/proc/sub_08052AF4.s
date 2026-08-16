	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052AF4
sub_08052AF4: @ 0x08052AF4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08052BA0 @ =gUnknown_03001470
	mov ip, r0
	ldr r3, _08052BA4 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	mov r2, ip
	adds r2, #0x28
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #5
	adds r2, r1, r2
	ldr r0, [r2]
	cmp r0, #8
	bne _08052B9A
	mov r0, ip
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r4, [r0]
	adds r5, r4, #0
	mov r0, ip
	adds r0, #0x34
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r6, r3, #0
	ldr r1, _08052BA8 @ =gUnknown_08553B10
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r7, [r0]
	ldr r2, _08052BAC @ =gUnknown_02029A10
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r4, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #0x1c]
	cmp r0, #1
	bne _08052B60
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0
	bl sub_08052E04
_08052B60:
	ldr r1, _08052BB0 @ =gUnknown_02028E5C
	lsls r2, r5, #2
	adds r1, r2, r1
	movs r3, #0
	movs r0, #1
	strh r0, [r1]
	ldr r0, _08052BB4 @ =gUnknown_084C3F78
	adds r2, r2, r0
	ldr r0, [r2]
	strh r3, [r0]
	ldr r1, _08052BB8 @ =gUnknown_02029808
	lsls r4, r6, #1
	movs r0, #0x6c
	muls r0, r5, r0
	adds r4, r4, r0
	adds r1, #0x24
	adds r4, r4, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xc0
	lsls r1, r1, #1
	bl sub_080157F4
_08052B9A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052BA0: .4byte gUnknown_03001470
_08052BA4: .4byte gUnknown_03001FBC
_08052BA8: .4byte gUnknown_08553B10
_08052BAC: .4byte gUnknown_02029A10
_08052BB0: .4byte gUnknown_02028E5C
_08052BB4: .4byte gUnknown_084C3F78
_08052BB8: .4byte gUnknown_02029808

