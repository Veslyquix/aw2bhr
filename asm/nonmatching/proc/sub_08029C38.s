	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029C38
sub_08029C38: @ 0x08029C38
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x24]
	ldr r4, [r3, #0x2c]
	subs r0, r0, r4
	str r0, [r3, #0x24]
	cmp r0, #0
	ble _08029C74
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bne _08029CA6
	ldr r0, _08029C6C @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08029C70 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	subs r1, r1, r4
	str r1, [r0]
	b _08029CA6
	.align 2, 0
_08029C6C: .4byte gUnknown_030033EC
_08029C70: .4byte gUnknown_08499598
_08029C74:
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bne _08029C92
	ldr r0, _08029CAC @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08029CB0 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r3, #0x28]
	str r1, [r0]
_08029C92:
	bl sub_080272B4
	ldr r0, _08029CB4 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_08015328
	movs r0, #0x6c
	bl sub_0803B4DC
_08029CA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029CAC: .4byte gUnknown_030033EC
_08029CB0: .4byte gUnknown_08499598
_08029CB4: .4byte gUnknown_03001FBC

