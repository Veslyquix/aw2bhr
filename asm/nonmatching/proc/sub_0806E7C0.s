	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E7C0
sub_0806E7C0: @ 0x0806E7C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0806E7F8 @ =gUnknown_08582BFC
	bl Proc_StartBlocking
	movs r1, #1
	ands r1, r5
	str r1, [r0, #0x34]
	lsls r3, r1, #7
	movs r2, #0x38
	rsbs r2, r2, #0
	subs r2, r2, r3
	str r2, [r0, #0x2c]
	lsls r4, r4, #7
	subs r2, r2, r4
	str r2, [r0, #0x30]
	movs r2, #0
	str r2, [r0, #0x38]
	lsls r1, r1, #5
	adds r1, #0x40
	adds r0, r5, #0
	bl sub_0806F000
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E7F8: .4byte gUnknown_08582BFC

