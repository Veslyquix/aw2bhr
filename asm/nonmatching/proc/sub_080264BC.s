	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080264BC
sub_080264BC: @ 0x080264BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026516
	ldr r0, _08026508 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	movs r6, #0xa
	cmp r0, #1
	bne _080264DA
	movs r6, #0x14
_080264DA:
	adds r0, r5, #0
	bl sub_08025CF0
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08025D08
	adds r1, r0, #0
	cmp r4, #0
	beq _08026516
	cmp r4, r1
	blt _08026516
	movs r0, #0x64
	muls r0, r1, r0
	adds r1, r4, #0
	bl __divsi3
	subs r0, #0x64
	subs r4, r6, r0
	cmp r4, #0x63
	ble _0802650C
	movs r0, #0x64
	b _08026518
	.align 2, 0
_08026508: .4byte gUnknown_03003FC0
_0802650C:
	cmp r4, #0
	blt _08026516
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	b _08026518
_08026516:
	movs r0, #0
_08026518:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

