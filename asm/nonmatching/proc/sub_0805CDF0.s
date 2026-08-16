	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805CDF0
sub_0805CDF0: @ 0x0805CDF0
	ldr r2, _0805CE0C @ =gUnknown_030046B0
	ldr r1, _0805CE10 @ =gUnknown_030045F0
	movs r0, #0x40
	strb r0, [r1]
	movs r0, #0
	strb r0, [r1, #1]
	str r1, [r2]
	ldr r1, _0805CE14 @ =gUnknown_03004778
	ldr r0, _0805CE18 @ =sub_0805DB64
	str r0, [r1]
	ldr r1, _0805CE1C @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805CE0C: .4byte gUnknown_030046B0
_0805CE10: .4byte gUnknown_030045F0
_0805CE14: .4byte gUnknown_03004778
_0805CE18: .4byte sub_0805DB64
_0805CE1C: .4byte gUnknown_03004780

