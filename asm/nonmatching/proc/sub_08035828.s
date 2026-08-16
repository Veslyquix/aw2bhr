	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035828
sub_08035828: @ 0x08035828
	push {lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x30]
	cmp r2, #0
	beq _0803583A
	ldrb r1, [r2, #1]
	movs r0, #0xf9
	ands r0, r1
	strb r0, [r2, #1]
_0803583A:
	adds r0, r3, #0
	bl Proc_End
	ldr r1, _0803584C @ =gUnknown_030040E4
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803584C: .4byte gUnknown_030040E4

