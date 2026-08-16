	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067A4C
sub_08067A4C: @ 0x08067A4C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r3, [r5, #0x3c]
	ldr r0, [r5, #0x38]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r3, [r5, #0x3c]
	ldr r0, [r5, #0x38]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r3, _08067AC4 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08067AC8 @ =gUnknown_03002020
	strh r0, [r1]
	ldr r2, _08067ACC @ =gUnknown_03002B28
	movs r1, #0x10
	subs r1, r1, r0
	strh r1, [r2]
	ldr r1, _08067AD0 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	bl sub_08072C40
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x38]
	cmp r1, r0
	bne _08067AB6
	movs r0, #0
	str r0, [r5, #0x38]
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	bl Proc_Break
_08067AB6:
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067AC4: .4byte gUnknown_030030E0
_08067AC8: .4byte gUnknown_03002020
_08067ACC: .4byte gUnknown_03002B28
_08067AD0: .4byte gUnknown_03001FFC

