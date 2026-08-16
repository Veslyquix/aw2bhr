	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E7E4
sub_0803E7E4: @ 0x0803E7E4
	adds r2, r1, #0
	cmp r0, #3
	beq _0803E7EE
	cmp r0, #4
	beq _0803E7F8
_0803E7EE:
	ldr r1, _0803E7F4 @ =gUnknown_0849F688
	b _0803E7FA
	.align 2, 0
_0803E7F4: .4byte gUnknown_0849F688
_0803E7F8:
	ldr r1, _0803E804 @ =gUnknown_0849F698
_0803E7FA:
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0803E804: .4byte gUnknown_0849F698

