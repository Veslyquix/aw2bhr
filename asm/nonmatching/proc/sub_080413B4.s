	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080413B4
sub_080413B4: @ 0x080413B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _080413E0 @ =gUnknown_03003338
	ldr r6, [r4]
	ldr r4, _080413E4 @ =gUnknown_030040A8
	mov r8, r4
	ldr r5, [r4]
	lsls r4, r5, #3
	adds r4, r4, r6
	strh r0, [r4, #4]
	strh r1, [r4, #6]
	strh r2, [r4]
	strh r3, [r4, #2]
	adds r5, #1
	mov r0, r8
	str r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080413E0: .4byte gUnknown_03003338
_080413E4: .4byte gUnknown_030040A8

