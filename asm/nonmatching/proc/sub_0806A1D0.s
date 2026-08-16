	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A1D0
sub_0806A1D0: @ 0x0806A1D0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0xf0
	rsbs r1, r1, #0
	ldr r3, [r4, #0x58]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_08074234
	ldr r1, _0806A214 @ =gUnknown_0202F20C
	str r0, [r1]
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0xa
	bne _0806A20C
	movs r0, #0
	bl sub_080638D0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	adds r0, r4, #0
	bl Proc_Break
_0806A20C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A214: .4byte gUnknown_0202F20C

