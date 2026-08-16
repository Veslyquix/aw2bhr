	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E8C8
sub_0806E8C8: @ 0x0806E8C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E8E0 @ =gUnknown_08582C24
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x5c]
	str r1, [r0, #0x58]
	str r4, [r0, #0x60]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8E0: .4byte gUnknown_08582C24

