	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086DF4
sub_08086DF4: @ 0x08086DF4
	push {lr}
	ldr r0, _08086E1C @ =gUnknown_0849957C
	ldr r0, [r0]
	movs r1, #0xc4
	lsls r1, r1, #7
	bl sub_08037A20
	ldr r1, _08086E20 @ =gUnknown_03005918
	ldr r0, _08086E24 @ =gUnknown_03003F68
	ldr r2, [r0]
	ldrb r0, [r2]
	str r0, [r1]
	ldr r1, _08086E28 @ =gUnknown_030058F4
	ldrb r0, [r2, #1]
	str r0, [r1]
	bl sub_08013AFC
	pop {r0}
	bx r0
	.align 2, 0
_08086E1C: .4byte gUnknown_0849957C
_08086E20: .4byte gUnknown_03005918
_08086E24: .4byte gUnknown_03003F68
_08086E28: .4byte gUnknown_030058F4

