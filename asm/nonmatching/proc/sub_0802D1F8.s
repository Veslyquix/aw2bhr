	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D1F8
sub_0802D1F8: @ 0x0802D1F8
	push {lr}
	bl sub_08034F48
	bl sub_0801A168
	bl sub_080606A0
	bl sub_080424FC
	ldr r0, _0802D228 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802D222
	ldr r0, _0802D22C @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #0xc
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802D222:
	pop {r0}
	bx r0
	.align 2, 0
_0802D228: .4byte gUnknown_03003FC0
_0802D22C: .4byte gUnknown_03003F38

