	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080749FC
sub_080749FC: @ 0x080749FC
	push {lr}
	ldr r1, [r0, #0x2c]
	ldr r3, _08074A24 @ =gUnknown_08615194
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #4
	adds r2, r2, r3
	movs r3, #6
	ldrsh r1, [r2, r3]
	movs r3, #8
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_08074C84
	pop {r0}
	bx r0
	.align 2, 0
_08074A24: .4byte gUnknown_08615194

