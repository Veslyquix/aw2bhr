	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804074C
sub_0804074C: @ 0x0804074C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	mov r6, sp
	mov r1, sp
	bl sub_0803DFE0
	ldr r0, _0804078C @ =gUnknown_0849FBEC
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	str r0, [r2, #0x2c]
	ldrh r0, [r6, #2]
	str r0, [r2, #0x30]
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	adds r1, r2, #0
	adds r1, #0x64
	strh r0, [r1]
	ldrb r0, [r4, #4]
	adds r1, #2
	strh r0, [r1]
	str r4, [r2, #0x4c]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804078C: .4byte gUnknown_0849FBEC

