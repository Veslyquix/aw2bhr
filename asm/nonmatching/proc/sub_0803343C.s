	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803343C
sub_0803343C: @ 0x0803343C
	push {lr}
	movs r1, #1
	rsbs r1, r1, #0
	movs r2, #1
	bl sub_080324C4
	ldr r0, _08033464 @ =gUnknown_08614284
	movs r1, #3
	bl Proc_Start
	ldr r2, _08033468 @ =gUnknown_030030E0
	ldrh r1, [r2]
	ldr r0, _0803346C @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08033464: .4byte gUnknown_08614284
_08033468: .4byte gUnknown_030030E0
_0803346C: .4byte 0x0000FFE0

