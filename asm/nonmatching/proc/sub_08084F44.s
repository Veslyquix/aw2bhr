	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084F44
sub_08084F44: @ 0x08084F44
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4e
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0808501C
	ldr r0, _08084F7C @ =gUnknown_03005940
	ldr r0, [r0]
	cmp r0, #3
	bgt _08084FF0
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	cmp r1, #3
	bgt _08084F80
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x90
	b _08084F8E
	.align 2, 0
_08084F7C: .4byte gUnknown_03005940
_08084F80:
	movs r1, #0
	ldrsh r3, [r5, r1]
	subs r3, #4
	movs r0, #4
	str r0, [sp]
	movs r1, #0x90
	movs r2, #0
_08084F8E:
	bl Interpolate
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x2c]
	adds r0, #0xb0
	ldr r2, _08084FE8 @ =0x0000516C
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #4
	bl sub_08043C28
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #5
	bne _08084FCE
	adds r0, r4, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08084FEC @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	movs r1, #0xb6
	lsls r1, r1, #1
	movs r2, #5
	bl sub_08043BA4
_08084FCE:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08085034
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	b _08085034
	.align 2, 0
_08084FE8: .4byte 0x0000516C
_08084FEC: .4byte gUnknown_08499598
_08084FF0:
	adds r0, r4, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08085018 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	movs r1, #0xb6
	lsls r1, r1, #1
	movs r2, #5
	bl sub_08043BA4
	movs r0, #0
	strh r0, [r5]
	b _08085034
	.align 2, 0
_08085018: .4byte gUnknown_08499598
_0808501C:
	ldr r0, _0808503C @ =gUnknown_03005940
	ldr r0, [r0]
	cmp r0, #3
	bgt _08085034
	ldr r2, _08085040 @ =0x0000516C
	movs r0, #1
	str r0, [sp]
	movs r0, #0xb0
	movs r1, #0xa0
	movs r3, #4
	bl sub_08043C28
_08085034:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808503C: .4byte gUnknown_03005940
_08085040: .4byte 0x0000516C

