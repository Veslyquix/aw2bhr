	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080392F4
sub_080392F4: @ 0x080392F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0x40
	rsbs r5, r5, #0
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb0
	adds r2, r5, #0
	bl Interpolate
	str r0, [r6, #0x2c]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, [r6, #0x2c]
	cmp r0, r5
	bne _08039328
	adds r0, r6, #0
	bl Proc_Break
_08039328:
	adds r0, r6, #0
	bl sub_0803927C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

