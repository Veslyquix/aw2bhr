	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B6A8
sub_0803B6A8: @ 0x0803B6A8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x64
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0x13
	ble _0803B6C0
	adds r0, r4, #0
	bl Proc_Break
_0803B6C0:
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x54]
	ldrh r3, [r5]
	adds r0, r3, #1
	strh r0, [r5]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x14
	str r0, [sp]
	movs r0, #0
	bl sub_08074234
	bl sub_0803B35C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

