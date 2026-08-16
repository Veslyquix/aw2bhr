	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057A80
sub_08057A80: @ 0x08057A80
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08057AD0 @ =gUnknown_03004580
	ldrh r0, [r4, #8]
	ldr r1, _08057AD4 @ =0x060059C0
	ldr r2, _08057AD8 @ =0x050000E0
	bl sub_08043E8C
	ldrh r0, [r4, #0x18]
	ldr r1, _08057ADC @ =0x06005DC0
	ldr r2, _08057AE0 @ =0x05000100
	bl sub_08043E8C
	movs r5, #0
	ldr r7, _08057AE4 @ =gUnknown_085D6A48
	adds r4, #2
_08057AA2:
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #2]
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r5, #0x13
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sp
	bl sub_08057A24
	adds r4, #0x10
	adds r5, #1
	cmp r5, #1
	ble _08057AA2
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057AD0: .4byte gUnknown_03004580
_08057AD4: .4byte 0x060059C0
_08057AD8: .4byte 0x050000E0
_08057ADC: .4byte 0x06005DC0
_08057AE0: .4byte 0x05000100
_08057AE4: .4byte gUnknown_085D6A48

