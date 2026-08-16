	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046D30
sub_08046D30: @ 0x08046D30
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #2
	bl sub_08023274
	ldr r5, _08046D4C @ =gUnknown_02028DD4
	ldrb r0, [r5]
	cmp r0, #1
	beq _08046D54
	cmp r0, #2
	beq _08046DC0
	ldr r6, _08046D50 @ =gUnknown_0812A118
	b _08046E06
	.align 2, 0
_08046D4C: .4byte gUnknown_02028DD4
_08046D50: .4byte gUnknown_0812A118
_08046D54:
	ldr r2, _08046DAC @ =gUnknown_0812A118
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _08046E06
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r4, _08046DB0 @ =gUnknown_02028DD5
	ldrb r0, [r4]
	bl sub_080468D4
	movs r0, #2
	strb r0, [r5]
	bl sub_08014878
	ldrb r0, [r4]
	lsrs r0, r0, #3
	adds r0, #1
	ldr r1, _08046DB4 @ =gUnknown_08499578
	ldr r2, [r1]
	ldr r4, _08046DB8 @ =gUnknown_085D583C
	ldr r1, _08046DBC @ =gUnknown_02028DD6
	ldrb r3, [r1]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r3, [r1, #0xe]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp, #4]
	movs r1, #0xb
	bl sub_08014668
	b _08046E06
	.align 2, 0
_08046DAC: .4byte gUnknown_0812A118
_08046DB0: .4byte gUnknown_02028DD5
_08046DB4: .4byte gUnknown_08499578
_08046DB8: .4byte gUnknown_085D583C
_08046DBC: .4byte gUnknown_02028DD6
_08046DC0:
	ldr r2, _08046E34 @ =gUnknown_0812A118
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _08046E06
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r0, _08046E38 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r4, _08046E3C @ =gUnknown_02028DD5
	ldrb r1, [r4]
	lsrs r1, r1, #3
	adds r1, #1
	movs r2, #8
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #0xb
	movs r3, #0xc
	bl sub_08012BC8
	ldrb r0, [r4]
	ldr r1, _08046E40 @ =gUnknown_02028DD6
	ldrb r1, [r1]
	bl sub_08046778
	movs r0, #1
	strb r0, [r5]
	bl sub_08014878
_08046E06:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08046E2C
	bl sub_08014878
	bl sub_080470E8
	ldr r0, _08046E44 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	movs r0, #0x66
	bl sub_0803B4DC
_08046E2C:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046E34: .4byte gUnknown_0812A118
_08046E38: .4byte gUnknown_08499578
_08046E3C: .4byte gUnknown_02028DD5
_08046E40: .4byte gUnknown_02028DD6
_08046E44: .4byte gUnknown_03001FBC

