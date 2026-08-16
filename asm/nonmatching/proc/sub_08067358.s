	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067358
sub_08067358: @ 0x08067358
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, _080673A4 @ =gUnknown_030030E0
	ldrh r0, [r3]
	ldr r2, _080673A8 @ =0x0000FFE0
	ands r2, r0
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	movs r1, #0xf
	orrs r0, r1
	orrs r2, r0
	strh r2, [r3]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	movs r0, #0
	bl sub_08074234
	ldr r1, _080673AC @ =gUnknown_03001FFC
	strh r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	cmp r1, r0
	bne _08067394
	adds r0, r4, #0
	bl Proc_Break
_08067394:
	ldr r0, [r4, #0x38]
	adds r0, #1
	str r0, [r4, #0x38]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080673A4: .4byte gUnknown_030030E0
_080673A8: .4byte 0x0000FFE0
_080673AC: .4byte gUnknown_03001FFC

