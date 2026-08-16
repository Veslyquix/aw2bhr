	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067D6C
sub_08067D6C: @ 0x08067D6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	subs r2, #5
	str r2, [r4, #0x30]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	movs r1, #0
	bl sub_08072C40
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bgt _08067D8E
	adds r0, r4, #0
	bl Proc_Break
_08067D8E:
	pop {r4}
	pop {r0}
	bx r0

