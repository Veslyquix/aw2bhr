	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075E0C
sub_08075E0C: @ 0x08075E0C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl sub_08075AC4
	bl sub_080135A4
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08075E36
	adds r0, r5, #0
	bl Proc_Break
_08075E36:
	pop {r4, r5}
	pop {r0}
	bx r0

