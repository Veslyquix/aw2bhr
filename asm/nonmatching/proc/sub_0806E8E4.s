	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E8E4
sub_0806E8E4: @ 0x0806E8E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E8FC @ =gUnknown_08582C24
	bl Proc_Find
	adds r1, r0, #0
	cmp r4, #0
	beq _0806E900
	movs r0, #0x10
	str r0, [r1, #0x5c]
	b _0806E904
	.align 2, 0
_0806E8FC: .4byte gUnknown_08582C24
_0806E900:
	movs r0, #0x10
	str r0, [r1, #0x58]
_0806E904:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

