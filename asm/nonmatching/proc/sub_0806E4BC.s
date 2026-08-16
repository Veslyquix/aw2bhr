	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E4BC
sub_0806E4BC: @ 0x0806E4BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0806E50C @ =gUnknown_08582B14
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	adds r1, r0, #0
	adds r1, #0x40
	movs r2, #0
	movs r3, #0
	strh r4, [r1]
	str r7, [r0, #0x38]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #0x3e]
	strh r1, [r0, #0x3c]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x44]
	adds r1, r0, #0
	adds r1, #0x48
	strb r2, [r1]
	str r3, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806E50C: .4byte gUnknown_08582B14

