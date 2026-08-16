	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F8E0
sub_0803F8E0: @ 0x0803F8E0
	push {lr}
	adds r0, r1, #0
	ldr r2, _0803F8FC @ =gUnknown_080D20C4
	lsls r0, r0, #2
	ldr r1, _0803F900 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	ldr r1, _0803F904 @ =0x06010900
	movs r2, #0x20
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_0803F8FC: .4byte gUnknown_080D20C4
_0803F900: .4byte 0x000003FF
_0803F904: .4byte 0x06010900

