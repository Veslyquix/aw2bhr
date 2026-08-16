	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050C8C
sub_08050C8C: @ 0x08050C8C
	push {r4, r5, r6, lr}
	ldr r3, _08050D10 @ =gUnknown_03001470
	ldr r0, _08050D14 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r1, r2, r1
	ldrh r4, [r1]
	adds r5, r4, #0
	adds r3, #0x34
	adds r2, r2, r3
	ldrh r6, [r2]
	bl sub_080156C4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, r2, #0
	cmp r2, #2
	bne _08050CC4
	ldr r0, _08050D18 @ =gUnknown_02028E5C
	lsls r1, r4, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1]
_08050CC4:
	cmp r2, #3
	bne _08050CD8
	ldr r0, _08050D1C @ =gUnknown_020296B0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #0x1b]
	adds r0, #1
	strb r0, [r1, #0x1b]
_08050CD8:
	ldr r1, _08050D20 @ =gUnknown_02029710
	movs r0, #0x58
	muls r0, r5, r0
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _08050D3A
	cmp r3, #1
	bne _08050D3A
	ldr r2, _08050D24 @ =gUnknown_02029A10
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	bne _08050D3A
	ldr r0, _08050D28 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r5, r0
	bne _08050D30
	ldr r0, _08050D2C @ =gUnknown_02029664
	ldrb r1, [r0]
	movs r2, #1
	b _08050D36
	.align 2, 0
_08050D10: .4byte gUnknown_03001470
_08050D14: .4byte gUnknown_03001FBC
_08050D18: .4byte gUnknown_02028E5C
_08050D1C: .4byte gUnknown_020296B0
_08050D20: .4byte gUnknown_02029710
_08050D24: .4byte gUnknown_02029A10
_08050D28: .4byte gUnknown_0300450C
_08050D2C: .4byte gUnknown_02029664
_08050D30:
	ldr r0, _08050D40 @ =gUnknown_02029664
	ldrb r1, [r0]
	movs r2, #8
_08050D36:
	orrs r1, r2
	strb r1, [r0]
_08050D3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D40: .4byte gUnknown_02029664

