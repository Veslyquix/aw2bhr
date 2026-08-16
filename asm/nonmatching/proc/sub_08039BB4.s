	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039BB4
sub_08039BB4: @ 0x08039BB4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08039BD8 @ =gUnknown_0849D82C
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x29
	strb r4, [r1]
	adds r1, #1
	strb r5, [r1]
	strh r6, [r0, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039BD8: .4byte gUnknown_0849D82C

