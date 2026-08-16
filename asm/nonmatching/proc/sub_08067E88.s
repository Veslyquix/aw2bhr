	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067E88
sub_08067E88: @ 0x08067E88
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, [r0, #0x30]
	ldr r1, _08067EC8 @ =0x000001FF
	ands r4, r1
	movs r1, #0x94
	lsls r1, r1, #3
	ldr r3, _08067ECC @ =gUnknown_08581104
	adds r2, r0, #0
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r2, r5, #0
	orrs r2, r3
	ldr r3, [r0, #0x38]
	lsls r3, r3, #0xa
	orrs r2, r3
	adds r0, #0x3c
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #0
	bl sub_08043C28
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067EC8: .4byte 0x000001FF
_08067ECC: .4byte gUnknown_08581104

