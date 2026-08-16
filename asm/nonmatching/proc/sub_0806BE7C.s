	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BE7C
sub_0806BE7C: @ 0x0806BE7C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	bne _0806BEC6
	ldr r0, _0806BED4 @ =gUnknown_08581A24
	movs r1, #3
	bl Proc_Start
	ldr r1, [r4, #0x5c]
	lsls r1, r1, #3
	adds r1, #0x48
	str r1, [r0, #0x2c]
	ldr r1, [r4, #0x58]
	str r1, [r0, #0x30]
	str r5, [r0, #0x58]
	ldr r1, [r4, #0x5c]
	str r1, [r0, #0x5c]
	ldr r2, [r4, #0x5c]
	lsls r2, r2, #1
	adds r1, r4, #0
	adds r1, #0x2a
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	ldr r1, [r4, #0x54]
	cmp r0, r1
	bne _0806BEC6
	adds r0, r4, #0
	bl Proc_Break
_0806BEC6:
	ldr r0, [r4, #0x60]
	adds r0, #1
	str r0, [r4, #0x60]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BED4: .4byte gUnknown_08581A24

