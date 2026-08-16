	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A6B8
sub_0806A6B8: @ 0x0806A6B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A6EC @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0806A6E6
	bl sub_080718F0
	bl sub_080135A4
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806A6E6
	adds r0, r4, #0
	bl Proc_Break
_0806A6E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A6EC: .4byte gUnknown_03004008

