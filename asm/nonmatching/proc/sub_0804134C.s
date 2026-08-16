	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804134C
sub_0804134C: @ 0x0804134C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08041378 @ =gUnknown_0849FD44
	bl Proc_Find
	adds r5, r0, #0
	adds r2, r4, #0
	adds r2, #0x4c
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0804137C
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r5, #0x34]
	movs r1, #3
	bl sub_0801C4D4
	b _08041386
	.align 2, 0
_08041378: .4byte gUnknown_0849FD44
_0804137C:
	subs r1, #1
	strh r1, [r2]
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
_08041386:
	pop {r4, r5}
	pop {r0}
	bx r0

