	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D1C0
sub_0802D1C0: @ 0x0802D1C0
	push {lr}
	bl sub_08034F48
	bl sub_0801A168
	bl sub_08060684
	bl sub_080424FC
	ldr r0, _0802D1F0 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802D1EA
	ldr r0, _0802D1F4 @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #0xb
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802D1EA:
	pop {r0}
	bx r0
	.align 2, 0
_0802D1F0: .4byte gUnknown_03003FC0
_0802D1F4: .4byte gUnknown_03003F38

