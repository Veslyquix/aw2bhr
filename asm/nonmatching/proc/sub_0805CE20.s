	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805CE20
sub_0805CE20: @ 0x0805CE20
	ldr r2, _0805CE3C @ =gUnknown_030046B0
	ldr r1, _0805CE40 @ =gUnknown_030045F0
	movs r0, #0x40
	strb r0, [r1]
	movs r0, #0
	strb r0, [r1, #1]
	str r1, [r2]
	ldr r1, _0805CE44 @ =gUnknown_03004778
	ldr r0, _0805CE48 @ =sub_0805DB70
	str r0, [r1]
	ldr r1, _0805CE4C @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805CE3C: .4byte gUnknown_030046B0
_0805CE40: .4byte gUnknown_030045F0
_0805CE44: .4byte gUnknown_03004778
_0805CE48: .4byte sub_0805DB70
_0805CE4C: .4byte gUnknown_03004780

