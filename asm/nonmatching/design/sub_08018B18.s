	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018B18
sub_08018B18: @ 0x08018B18
	ldr r3, _08018B38 @ =gUnknown_03002F20
	ldr r2, _08018B3C @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r2, [r0, #4]
	str r2, [r3]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_08018B38: .4byte gUnknown_03002F20
_08018B3C: .4byte gUnknown_0200C528

