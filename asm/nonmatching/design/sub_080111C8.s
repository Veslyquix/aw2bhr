	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080111C8
sub_080111C8: @ 0x080111C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r7, [sp, #0x1c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r6, _08011210 @ =gUnknown_03001FDC
	movs r0, #0
	str r0, [r6]
	ldr r0, _08011214 @ =gUnknown_0848927C
	movs r1, #0
	bl Proc_Start
	mov r1, r8
	str r1, [r0, #0x2c]
	mov r1, sb
	str r1, [r0, #0x30]
	strh r4, [r0, #0x34]
	strh r5, [r0, #0x36]
	str r7, [r0, #0x38]
	movs r0, #1
	str r0, [r6]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011210: .4byte gUnknown_03001FDC
_08011214: .4byte gUnknown_0848927C

