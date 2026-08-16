	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D92C
sub_0803D92C: @ 0x0803D92C
	push {r4, lr}
	movs r0, #1
	bl sub_08016D04
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0803D944
	adds r0, r4, #0
	movs r1, #0
	bl sub_08016CEC
_0803D944:
	bl sub_0803861C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D956
	ldr r0, _0803D95C @ =gUnknown_0849F3A8
	bl sub_080193B0
	strb r4, [r0, #0x10]
_0803D956:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D95C: .4byte gUnknown_0849F3A8

