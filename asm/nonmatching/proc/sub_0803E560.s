	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E560
sub_0803E560: @ 0x0803E560
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _0803E58C @ =gUnknown_03003338
	ldr r6, [r4]
	ldr r4, _0803E590 @ =gUnknown_03003F40
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
_0803E58C: .4byte gUnknown_03003338
_0803E590: .4byte gUnknown_03003F40

