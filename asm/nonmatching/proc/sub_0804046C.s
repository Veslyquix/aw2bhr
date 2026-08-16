	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804046C
sub_0804046C: @ 0x0804046C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r1, [sp, #0x14]
	ldr r0, _0804049C @ =gUnknown_0849FB8C
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	lsls r4, r4, #0xc
	mov r1, r8
	orrs r4, r1
	adds r0, #0x4a
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804049C: .4byte gUnknown_0849FB8C

