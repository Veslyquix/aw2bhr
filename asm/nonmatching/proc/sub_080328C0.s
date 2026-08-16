	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080328C0
sub_080328C0: @ 0x080328C0
	ldr r2, _080328E4 @ =0x00006309
	adds r1, r0, #0
	adds r1, #0x12
_080328C6:
	strh r2, [r1]
	subs r2, #1
	subs r1, #2
	cmp r1, r0
	bge _080328C6
	movs r2, #9
	ldr r1, _080328E8 @ =0x00006313
	adds r0, #0x52
_080328D6:
	strh r1, [r0]
	subs r1, #1
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080328D6
	bx lr
	.align 2, 0
_080328E4: .4byte 0x00006309
_080328E8: .4byte 0x00006313

