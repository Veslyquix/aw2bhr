	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067E1C
sub_08067E1C: @ 0x08067E1C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, [r4, #0x40]
	ldr r0, [r4, #0x34]
	str r0, [sp]
	movs r0, #0
	bl sub_08074234
	ldr r3, _08067E80 @ =0x000001FF
	ands r3, r0
	movs r1, #0x94
	lsls r1, r1, #3
	ldr r2, _08067E84 @ =gUnknown_08581104
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r2, r5, #0
	orrs r2, r0
	ldr r0, [r4, #0x38]
	lsls r0, r0, #0xa
	orrs r2, r0
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl sub_08043C28
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x34]
	cmp r0, r1
	bne _08067E78
	adds r0, r4, #0
	bl Proc_Break
_08067E78:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067E80: .4byte 0x000001FF
_08067E84: .4byte gUnknown_08581104

