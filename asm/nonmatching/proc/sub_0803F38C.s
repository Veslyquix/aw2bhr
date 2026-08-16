	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F38C
sub_0803F38C: @ 0x0803F38C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x4c]
	ldrh r1, [r4]
	ldr r0, _0803F3A4 @ =0x0000FFFF
	cmp r1, r0
	bne _0803F3A8
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0803F3C0
	.align 2, 0
_0803F3A4: .4byte 0x0000FFFF
_0803F3A8:
	ldrh r0, [r4]
	str r0, [r5, #0x2c]
	ldrh r1, [r4, #2]
	str r1, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08029088
	adds r4, #4
	str r4, [r5, #0x4c]
_0803F3C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

