	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D064
sub_0802D064: @ 0x0802D064
	push {lr}
	bl sub_08034F48
	bl sub_0801A168
	bl sub_0802C57C
	bl sub_08042650
	bl sub_080424FC
	bl sub_0802C594
	ldr r0, _0802D09C @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802D096
	ldr r0, _0802D0A0 @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802D096:
	pop {r0}
	bx r0
	.align 2, 0
_0802D09C: .4byte gUnknown_03003FC0
_0802D0A0: .4byte gUnknown_03003F38

