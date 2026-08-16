	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080752D8
sub_080752D8: @ 0x080752D8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08075300 @ =gUnknown_08614390
	bl Proc_Find
	strh r4, [r0, #0x38]
	adds r0, #0x3c
	movs r2, #9
_080752EA:
	ldr r1, [r0]
	cmp r1, #0
	beq _080752F2
	strh r4, [r1, #0x30]
_080752F2:
	adds r0, #4
	subs r2, #1
	cmp r2, #0
	bge _080752EA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075300: .4byte gUnknown_08614390

