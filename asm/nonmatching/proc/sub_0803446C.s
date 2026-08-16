	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803446C
sub_0803446C: @ 0x0803446C
	push {r4, lr}
	ldr r4, _080344A0 @ =gUnknown_030040DC
	ldrb r0, [r4]
	cmp r0, #1
	beq _08034498
	ldr r1, _080344A4 @ =gUnknown_030044B0
	ldr r2, _080344A8 @ =gUnknown_03003100
	ldrh r0, [r2]
	strb r0, [r1, #2]
	ldrh r0, [r2, #2]
	strb r0, [r1, #3]
	ldr r2, _080344AC @ =gUnknown_03003F24
	ldrh r0, [r2]
	strb r0, [r1, #4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #5]
	ldr r0, _080344B0 @ =gUnknown_03003110
	adds r1, #0xc
	bl sub_08034400
	movs r0, #1
	strb r0, [r4]
_08034498:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080344A0: .4byte gUnknown_030040DC
_080344A4: .4byte gUnknown_030044B0
_080344A8: .4byte gUnknown_03003100
_080344AC: .4byte gUnknown_03003F24
_080344B0: .4byte gUnknown_03003110

