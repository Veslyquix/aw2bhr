	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805319C
sub_0805319C: @ 0x0805319C
	ldr r2, _080531CC @ =gUnknown_03004504
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #0x7f
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
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080531D0 @ =0x0000FFFF
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_080531CC: .4byte gUnknown_03004504
_080531D0: .4byte 0x0000FFFF

