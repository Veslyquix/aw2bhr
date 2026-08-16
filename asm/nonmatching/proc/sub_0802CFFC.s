	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CFFC
sub_0802CFFC: @ 0x0802CFFC
	push {lr}
	bl sub_08034F48
	bl sub_0801A168
	bl sub_0802C57C
	bl sub_080424FC
	bl sub_0802C594
	ldr r0, _0802D040 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802D05A
	ldr r0, _0802D044 @ =gUnknown_08090C04
	ldr r3, [r0]
	ldrb r1, [r3]
	adds r2, r0, #0
	cmp r1, #0
	bne _0802D04C
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _0802D04C
	ldr r0, _0802D048 @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_08034534
	b _0802D05A
	.align 2, 0
_0802D040: .4byte gUnknown_03003FC0
_0802D044: .4byte gUnknown_08090C04
_0802D048: .4byte gUnknown_03003F38
_0802D04C:
	ldr r0, _0802D060 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldr r2, [r2]
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	bl sub_080344B4
_0802D05A:
	pop {r0}
	bx r0
	.align 2, 0
_0802D060: .4byte gUnknown_03003F38

