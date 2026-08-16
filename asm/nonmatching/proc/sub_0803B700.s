	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B700
sub_0803B700: @ 0x0803B700
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0803B71C @ =gUnknown_0849E778
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _0803B720
	ldr r0, [r0, #0x54]
	str r0, [r4, #0x54]
	adds r0, r5, #0
	bl Proc_EndEach
	b _0803B726
	.align 2, 0
_0803B71C: .4byte gUnknown_0849E778
_0803B720:
	adds r0, r4, #0
	bl Proc_End
_0803B726:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

