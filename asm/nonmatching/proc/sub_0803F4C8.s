	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F4C8
sub_0803F4C8: @ 0x0803F4C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, _0803F508 @ =gUnknown_08499590
	ldr r3, [r1]
	movs r1, #4
	ldrsh r2, [r3, r1]
	ldr r1, [r4, #0x54]
	subs r1, r1, r2
	ldr r2, _0803F50C @ =0x000001FF
	ands r1, r2
	movs r2, #6
	ldrsh r3, [r3, r2]
	ldr r2, [r4, #0x58]
	subs r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	bl sub_0801C254
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F500
	ldr r0, [r4, #0x50]
	bl sub_0801C240
	adds r0, r4, #0
	bl Proc_Break
_0803F500:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F508: .4byte gUnknown_08499590
_0803F50C: .4byte 0x000001FF

