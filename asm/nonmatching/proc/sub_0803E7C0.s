	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E7C0
sub_0803E7C0: @ 0x0803E7C0
	adds r2, r1, #0
	cmp r0, #3
	beq _0803E7CA
	cmp r0, #4
	beq _0803E7D4
_0803E7CA:
	ldr r1, _0803E7D0 @ =gUnknown_0849F688
	b _0803E7D6
	.align 2, 0
_0803E7D0: .4byte gUnknown_0849F688
_0803E7D4:
	ldr r1, _0803E7E0 @ =gUnknown_0849F698
_0803E7D6:
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0803E7E0: .4byte gUnknown_0849F698

