	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075058
sub_08075058: @ 0x08075058
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080750A0 @ =gUnknown_08614370
	mov r1, sb
	bl Proc_Start
	movs r1, #0
	strh r4, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	mov r2, r8
	strh r2, [r0, #0x2a]
	strh r6, [r0, #0x30]
	str r1, [r0, #0x34]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080750A0: .4byte gUnknown_08614370

