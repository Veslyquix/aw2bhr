	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027C8C
sub_08027C8C: @ 0x08027C8C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, _08027CC4 @ =gUnknown_08499E08
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	bl sub_0801BEBC
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08027CBA
	adds r0, r4, #0
	bl Proc_Break
_08027CBA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027CC4: .4byte gUnknown_08499E08

