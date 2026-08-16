	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080745C0
sub_080745C0: @ 0x080745C0
	ldr r3, _080745D8 @ =gUnknown_0202FE38
	movs r2, #0
	movs r1, #0x29
	subs r0, r3, #1
_080745C8:
	strb r2, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _080745C8
	ldr r0, _080745DC @ =0x0000FFFF
	strh r0, [r3]
	bx lr
	.align 2, 0
_080745D8: .4byte gUnknown_0202FE38
_080745DC: .4byte 0x0000FFFF

