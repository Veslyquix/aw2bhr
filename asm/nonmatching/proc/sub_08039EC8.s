	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039EC8
sub_08039EC8: @ 0x08039EC8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	lsls r1, r1, #4
	ldr r2, _08039F10 @ =gUnknown_08499590
	ldr r3, [r2]
	movs r5, #4
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	adds r1, #8
	ldr r2, _08039F14 @ =0x000001FF
	ands r1, r2
	adds r2, r4, #0
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	movs r5, #6
	ldrsh r3, [r3, r5]
	subs r2, r2, r3
	adds r2, #8
	movs r3, #0xff
	ands r2, r3
	bl sub_0801C254
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039F0A
	adds r0, r4, #0
	bl Proc_Break
_08039F0A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039F10: .4byte gUnknown_08499590
_08039F14: .4byte 0x000001FF

