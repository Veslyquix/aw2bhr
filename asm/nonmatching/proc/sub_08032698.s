	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032698
sub_08032698: @ 0x08032698
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080326CC @ =gUnknown_03003F1C
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080326D0 @ =gUnknown_08090D2C
	ldr r0, [r1]
	ldr r3, [r0]
	ldrb r2, [r3, #9]
	ldr r0, _080326D4 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r1, #0
	cmp r2, r0
	bne _080326E0
	ldrb r0, [r3, #8]
	adds r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080326D8 @ =gUnknown_02000000
	bl sub_0801AC58
	ldr r0, _080326DC @ =gUnknown_0849B868
	b _080326E2
	.align 2, 0
_080326CC: .4byte gUnknown_03003F1C
_080326D0: .4byte gUnknown_08090D2C
_080326D4: .4byte gUnknown_0849B018
_080326D8: .4byte gUnknown_02000000
_080326DC: .4byte gUnknown_0849B868
_080326E0:
	ldr r0, _080326F8 @ =gUnknown_0849B7D8
_080326E2:
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	str r0, [r1, #0x58]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080326F8: .4byte gUnknown_0849B7D8

