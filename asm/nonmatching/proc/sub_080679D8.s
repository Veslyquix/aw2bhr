	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080679D8
sub_080679D8: @ 0x080679D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x2c]
	ldr r0, _08067A20 @ =gUnknown_08581014
	bl Proc_Start
	lsls r4, r4, #4
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	str r7, [r0, #0x38]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x40]
	ldr r1, [sp, #0x24]
	str r1, [r0, #0x44]
	ldr r1, [sp, #0x28]
	str r1, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	movs r1, #0
	str r1, [r0, #0x54]
	adds r0, #0x50
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067A20: .4byte gUnknown_08581014

