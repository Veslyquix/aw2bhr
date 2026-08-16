	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080546BC
sub_080546BC: @ 0x080546BC
	ldr r2, _080546E8 @ =gUnknown_03004504
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080546EC @ =0x0000FFFF
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_080546E8: .4byte gUnknown_03004504
_080546EC: .4byte 0x0000FFFF

