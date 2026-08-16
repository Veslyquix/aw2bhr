	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040554
sub_08040554: @ 0x08040554
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, _0804058C @ =gUnknown_0849FBBC
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	lsls r4, r4, #0xc
	mov r1, r8
	orrs r4, r1
	adds r1, r0, #0
	adds r1, #0x4a
	strh r4, [r1]
	adds r0, #0x44
	strh r7, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804058C: .4byte gUnknown_0849FBBC

