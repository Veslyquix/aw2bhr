	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801220C
sub_0801220C: @ 0x0801220C
	push {lr}
	movs r0, #0x14
	movs r1, #6
	bl sub_0801224C
	ldr r1, _08012234 @ =gUnknown_03000042
	ldr r0, _08012238 @ =gUnknown_03000044
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0801223C @ =gUnknown_03000040
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08012240 @ =gUnknown_03002F04
	strh r1, [r0]
	ldr r0, _08012244 @ =gUnknown_030024C8
	strh r1, [r0]
	ldr r0, _08012248 @ =gUnknown_030030B0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08012234: .4byte gUnknown_03000042
_08012238: .4byte gUnknown_03000044
_0801223C: .4byte gUnknown_03000040
_08012240: .4byte gUnknown_03002F04
_08012244: .4byte gUnknown_030024C8
_08012248: .4byte gUnknown_030030B0

