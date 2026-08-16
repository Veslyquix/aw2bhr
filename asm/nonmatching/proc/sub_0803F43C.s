	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F43C
sub_0803F43C: @ 0x0803F43C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, _0803F4B8 @ =gUnknown_08499590
	ldr r3, [r1]
	movs r1, #4
	ldrsh r2, [r3, r1]
	ldr r1, [r4, #0x54]
	subs r1, r1, r2
	ldr r2, _0803F4BC @ =0x000001FF
	ands r1, r2
	movs r2, #6
	ldrsh r3, [r3, r2]
	ldr r2, [r4, #0x58]
	subs r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	bl sub_0801C254
	ldr r1, [r4, #0x58]
	adds r1, #0xa
	str r1, [r4, #0x58]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	adds r0, #0x10
	cmp r0, r1
	bge _0803F4B0
	ldr r0, [r4, #0x50]
	bl sub_0801C240
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	adds r0, #8
	str r0, [r4, #0x58]
	ldr r0, _0803F4C0 @ =gUnknown_081171EC
	movs r1, #1
	movs r2, #1
	bl sub_0801C210
	str r0, [r4, #0x50]
	ldr r1, _0803F4C4 @ =0x000051CA
	strh r1, [r0, #0x22]
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl sub_0801C4D4
	movs r0, #0xea
	lsls r0, r0, #1
	bl sub_0803B4DC
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl sub_08013338
	adds r0, r4, #0
	bl Proc_Break
_0803F4B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F4B8: .4byte gUnknown_08499590
_0803F4BC: .4byte 0x000001FF
_0803F4C0: .4byte gUnknown_081171EC
_0803F4C4: .4byte 0x000051CA

