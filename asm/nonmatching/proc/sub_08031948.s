	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031948
sub_08031948: @ 0x08031948
	push {r4, r5, lr}
	ldr r1, _0803199C @ =gUnknown_03003F1C
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	ldr r5, _080319A0 @ =gUnknown_08090D08
_08031954:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08031970
	ldr r0, _080319A4 @ =gUnknown_0849B018
	ldr r0, [r0]
	adds r0, #0xa
	adds r0, r0, r4
	ldrb r1, [r0]
	strb r2, [r0]
_08031970:
	ldr r0, [r5]
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r1, #0
	strb r1, [r0]
	adds r4, #1
	cmp r4, #3
	ble _08031954
	bl sub_08031824
	ldr r4, _080319A8 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #3
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803199C: .4byte gUnknown_03003F1C
_080319A0: .4byte gUnknown_08090D08
_080319A4: .4byte gUnknown_0849B018
_080319A8: .4byte gUnknown_0849B060

