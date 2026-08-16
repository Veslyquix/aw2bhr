	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061CDC
sub_08061CDC: @ 0x08061CDC
	ldr r0, _08061CF4 @ =gUnknown_084995A0
	ldr r0, [r0]
	movs r2, #0
	movs r1, #0x5b
_08061CE4:
	strb r2, [r0, #5]
	strb r2, [r0, #4]
	strb r2, [r0, #3]
	adds r0, #8
	subs r1, #1
	cmp r1, #0
	bge _08061CE4
	bx lr
	.align 2, 0
_08061CF4: .4byte gUnknown_084995A0

