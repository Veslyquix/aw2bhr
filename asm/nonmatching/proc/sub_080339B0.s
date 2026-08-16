	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080339B0
sub_080339B0: @ 0x080339B0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _08033ADC @ =gUnknown_0849D16C
	bl sub_08012C58
	movs r0, #0x70
	bl sub_0801B780
	bl sub_08033930
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r0, _08033AE0 @ =gUnknown_081D3E88
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_08013618
	ldr r0, _08033AE4 @ =gUnknown_081D8A54
	ldr r1, _08033AE8 @ =0x06015780
	bl sub_08011CAC
	ldr r0, _08033AEC @ =gUnknown_0812B49C
	ldr r1, _08033AF0 @ =0x06010200
	movs r2, #0xc0
	lsls r2, r2, #1
	bl sub_08011C68
	ldr r0, _08033AF4 @ =gUnknown_0812B61C
	ldr r1, _08033AF8 @ =0x06010380
	movs r2, #0xe0
	bl sub_08011C68
	ldr r0, _08033AFC @ =gUnknown_0812B6FC
	ldr r1, _08033B00 @ =0x06010460
	movs r2, #0x90
	lsls r2, r2, #1
	bl sub_08011C68
	ldr r0, _08033B04 @ =gUnknown_0809165C
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	bl sub_0801F114
	ldr r1, _08033B08 @ =0x06010000
	movs r0, #2
	movs r2, #0
	movs r3, #0x16
	bl sub_0801F150
	movs r0, #0x50
	bl sub_0801F234
	ldr r0, _08033B0C @ =gUnknown_081320AC
	movs r1, #0x60
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08033B10 @ =gUnknown_081D92B8
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08033B14 @ =gUnknown_0823A3D4
	ldr r1, _08033B18 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _08033B1C @ =gUnknown_08239FA4
	ldr r1, _08033B20 @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	bl sub_08013B1C
	ldr r0, _08033B24 @ =gUnknown_085802F0
	ldr r1, _08033B28 @ =gUnknown_02010C50
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r2, #0xec
	movs r3, #0xf
	bl sub_08073304
	ldr r0, _08033B2C @ =gUnknown_0849BB80
	adds r1, r5, #0
	bl Proc_Start
	ldr r0, _08033B30 @ =gUnknown_08616EFC
	adds r1, r5, #0
	bl Proc_Start
	ldr r0, _08033B34 @ =gUnknown_0849BC50
	adds r1, r5, #0
	bl Proc_Start
	str r4, [r0, #0x4c]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x48]
	str r1, [r0, #0x44]
	str r1, [r0, #0x40]
	adds r3, r0, #0
	adds r3, #0x36
	movs r1, #1
	strb r1, [r3]
	adds r2, r0, #0
	adds r2, #0x37
	strb r1, [r2]
	str r0, [r5, #0x2c]
	ldr r1, _08033B38 @ =gUnknown_0849BC3E
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0
	movs r2, #0x40
	bl sub_080315E8
	bl sub_08085AF4
	bl sub_0803D48C
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033ADC: .4byte gUnknown_0849D16C
_08033AE0: .4byte gUnknown_081D3E88
_08033AE4: .4byte gUnknown_081D8A54
_08033AE8: .4byte 0x06015780
_08033AEC: .4byte gUnknown_0812B49C
_08033AF0: .4byte 0x06010200
_08033AF4: .4byte gUnknown_0812B61C
_08033AF8: .4byte 0x06010380
_08033AFC: .4byte gUnknown_0812B6FC
_08033B00: .4byte 0x06010460
_08033B04: .4byte gUnknown_0809165C
_08033B08: .4byte 0x06010000
_08033B0C: .4byte gUnknown_081320AC
_08033B10: .4byte gUnknown_081D92B8
_08033B14: .4byte gUnknown_0823A3D4
_08033B18: .4byte gUnknown_0300251C
_08033B1C: .4byte gUnknown_08239FA4
_08033B20: .4byte gUnknown_08499584
_08033B24: .4byte gUnknown_085802F0
_08033B28: .4byte gUnknown_02010C50
_08033B2C: .4byte gUnknown_0849BB80
_08033B30: .4byte gUnknown_08616EFC
_08033B34: .4byte gUnknown_0849BC50
_08033B38: .4byte gUnknown_0849BC3E

