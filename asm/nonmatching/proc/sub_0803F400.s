	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F400
sub_0803F400: @ 0x0803F400
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803F430 @ =gUnknown_081171EC
	movs r1, #1
	movs r2, #1
	bl sub_0801C210
	str r0, [r4, #0x50]
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #4
	adds r1, #8
	str r1, [r4, #0x54]
	ldr r1, _0803F434 @ =gUnknown_08499590
	ldr r1, [r1]
	movs r2, #6
	ldrsh r1, [r1, r2]
	adds r1, #0x10
	str r1, [r4, #0x58]
	ldr r1, _0803F438 @ =0x000051CA
	strh r1, [r0, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F430: .4byte gUnknown_081171EC
_0803F434: .4byte gUnknown_08499590
_0803F438: .4byte 0x000051CA

