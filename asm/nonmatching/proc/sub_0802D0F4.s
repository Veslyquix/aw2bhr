	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D0F4
sub_0802D0F4: @ 0x0802D0F4
	push {r4, r5, r6, lr}
	bl sub_08034F48
	bl sub_0801A168
	ldr r1, _0802D148 @ =gUnknown_03003FC0
	adds r6, r1, #0
	adds r6, #0x32
	ldrb r0, [r6]
	cmp r0, #0
	beq _0802D132
	ldrb r5, [r1, #0xd]
	cmp r5, #0
	bne _0802D11E
	ldr r0, _0802D14C @ =gUnknown_030040D8
	ldr r0, [r0]
	ldr r4, _0802D150 @ =gUnknown_03004074
	ldrb r1, [r4]
	bl sub_08025B80
	strb r5, [r4]
_0802D11E:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0802D132
	ldr r0, _0802D154 @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #0xa
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802D132:
	bl sub_0802C57C
	bl sub_08042998
	bl sub_080424FC
	bl sub_0802C594
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D148: .4byte gUnknown_03003FC0
_0802D14C: .4byte gUnknown_030040D8
_0802D150: .4byte gUnknown_03004074
_0802D154: .4byte gUnknown_03003F38

