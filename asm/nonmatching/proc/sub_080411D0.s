	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080411D0
sub_080411D0: @ 0x080411D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080411F8 @ =gUnknown_0849FE34
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r4, #0
	adds r1, #0x48
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4c
	strh r2, [r1]
	adds r4, #0x49
	ldrb r1, [r4]
	adds r0, #0x4e
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080411F8: .4byte gUnknown_0849FE34

