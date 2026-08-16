	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B8E0
sub_0803B8E0: @ 0x0803B8E0
	push {lr}
	ldr r0, _0803B8F8 @ =gUnknown_03003F30
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B8FC
	movs r0, #4
	bl sub_08017688
	b _0803B900
	.align 2, 0
_0803B8F8: .4byte gUnknown_03003F30
_0803B8FC:
	bl sub_0803B8C4
_0803B900:
	pop {r0}
	bx r0

