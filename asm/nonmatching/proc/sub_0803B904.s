	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B904
sub_0803B904: @ 0x0803B904
	push {lr}
	ldr r0, _0803B924 @ =gUnknown_03003F30
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B928
	movs r0, #2
	bl sub_08016D04
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	lsrs r0, r0, #0x10
	bl sub_08017688
	b _0803B92C
	.align 2, 0
_0803B924: .4byte gUnknown_03003F30
_0803B928:
	bl sub_0803BA00
_0803B92C:
	pop {r0}
	bx r0

