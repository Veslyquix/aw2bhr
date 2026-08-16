	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806974C
sub_0806974C: @ 0x0806974C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08069784 @ =gUnknown_08581420
	bl Proc_Start
	adds r4, r0, #0
	ldr r3, _08069788 @ =gUnknown_08581430
	adds r2, r4, #0
	adds r2, #0x2a
	movs r1, #2
_08069760:
	movs r0, #0
	ldrsb r0, [r3, r0]
	strh r0, [r2]
	movs r0, #1
	ldrsb r0, [r3, r0]
	strh r0, [r2, #6]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08069760
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069784: .4byte gUnknown_08581420
_08069788: .4byte gUnknown_08581430

