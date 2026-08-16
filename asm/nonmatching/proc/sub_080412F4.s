	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080412F4
sub_080412F4: @ 0x080412F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08041320 @ =gUnknown_0849FD44
	bl Proc_Find
	adds r5, r0, #0
	adds r2, r4, #0
	adds r2, #0x4c
	adds r0, r4, #0
	adds r0, #0x4e
	ldrh r3, [r2]
	movs r6, #0
	ldrsh r1, [r2, r6]
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	blt _08041324
	adds r0, r4, #0
	bl Proc_Break
	b _0804132E
	.align 2, 0
_08041320: .4byte gUnknown_0849FD44
_08041324:
	adds r1, r3, #1
	strh r1, [r2]
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
_0804132E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

