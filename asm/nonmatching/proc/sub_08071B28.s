	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071B28
sub_08071B28: @ 0x08071B28
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08071B7C @ =gUnknown_0202F2DC
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	adds r4, r4, r0
	ldr r0, _08071B80 @ =gUnknown_08613E54
	bl Proc_Start
	mov r8, r0
	ldr r0, _08071B84 @ =gPal
	lsls r5, r5, #5
	adds r5, r5, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	str r5, [r4, #0x24]
	mov r0, sb
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x28]
	strh r6, [r4, #0x2a]
	adds r6, #1
	strh r6, [r4, #0x2c]
	mov r0, r8
	str r4, [r0, #0x2c]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08071B7C: .4byte gUnknown_0202F2DC
_08071B80: .4byte gUnknown_08613E54
_08071B84: .4byte gPal

