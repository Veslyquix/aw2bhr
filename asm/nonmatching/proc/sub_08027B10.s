	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027B10
sub_08027B10: @ 0x08027B10
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x14]
	ldr r0, _08027B64 @ =gUnknown_08499E18
	bl Proc_Start
	adds r2, r0, #0
	str r5, [r2, #0x2c]
	str r6, [r2, #0x30]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r2, #0x34]
	str r0, [r2, #0x38]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #0xe5
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r1, #0
	adds r1, r2, #0
	adds r1, #0x4a
	orrs r4, r0
	strh r4, [r1]
	adds r0, r2, #0
	adds r0, #0x6a
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027B64: .4byte gUnknown_08499E18

