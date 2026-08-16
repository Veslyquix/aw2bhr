	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B2B8
sub_0807B2B8: @ 0x0807B2B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x54]
	movs r0, #8
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r4, r3]
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r3, r4, #0
	adds r3, #0x64
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl sub_0801A444
	ldr r0, [r4, #0x54]
	cmp r0, #7
	ble _0807B2EA
	adds r0, r4, #0
	bl Proc_Break
_0807B2EA:
	ldr r0, [r4, #0x54]
	adds r0, #1
	str r0, [r4, #0x54]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

