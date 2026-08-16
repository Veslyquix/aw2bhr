	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D0B4
sub_0802D0B4: @ 0x0802D0B4
	push {lr}
	bl sub_08034F48
	bl sub_0801A168
	bl sub_0802C57C
	bl sub_08042864
	bl sub_080424FC
	bl sub_0802C594
	ldr r0, _0802D0EC @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802D0E6
	ldr r0, _0802D0F0 @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802D0E6:
	pop {r0}
	bx r0
	.align 2, 0
_0802D0EC: .4byte gUnknown_03003FC0
_0802D0F0: .4byte gUnknown_03003F38

