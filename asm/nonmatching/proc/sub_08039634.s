	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039634
sub_08039634: @ 0x08039634
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0803964C @ =gUnknown_0849D77C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	str r5, [r0, #0x58]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803964C: .4byte gUnknown_0849D77C

