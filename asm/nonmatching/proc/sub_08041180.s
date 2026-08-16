	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041180
sub_08041180: @ 0x08041180
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804119C @ =gUnknown_0849FD44
	bl Proc_Find
	adds r4, #0x48
	ldrb r1, [r4]
	subs r1, #0x14
	lsls r1, r1, #1
	adds r0, #0x40
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804119C: .4byte gUnknown_0849FD44

