	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C114
sub_0806C114: @ 0x0806C114
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r0, #1
	str r0, [r4, #0x38]
	ldr r1, _0806C134 @ =gUnknown_0858265C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0806C138
	adds r0, r4, #0
	bl Proc_Break
	b _0806C148
	.align 2, 0
_0806C134: .4byte gUnknown_0858265C
_0806C138:
	ldr r0, _0806C150 @ =gUnknown_08581C48
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0806C148:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C150: .4byte gUnknown_08581C48

