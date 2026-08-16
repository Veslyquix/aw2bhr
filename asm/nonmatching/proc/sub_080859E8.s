	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080859E8
sub_080859E8: @ 0x080859E8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x64
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xf0
	movs r2, #0x38
	bl Interpolate
	ldr r1, _08085A34 @ =0x000001FF
	ands r1, r0
	movs r5, #0
	str r5, [sp]
	movs r0, #0x92
	movs r2, #0x38
	movs r3, #0
	bl sub_0801F34C
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bne _08085A2C
	strh r5, [r4]
	adds r0, r6, #0
	bl Proc_Break
_08085A2C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085A34: .4byte 0x000001FF

