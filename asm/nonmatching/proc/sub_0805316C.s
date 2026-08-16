	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805316C
sub_0805316C: @ 0x0805316C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08053F0C
	bl sub_0804B3CC
	ldr r0, _08053198 @ =gUnknown_03004508
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0x96
	lsls r0, r0, #0x11
	cmp r1, r0
	bne _08053190
	adds r0, r4, #0
	bl Proc_Break
_08053190:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053198: .4byte gUnknown_03004508

