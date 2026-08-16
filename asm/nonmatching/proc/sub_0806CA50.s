	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CA50
sub_0806CA50: @ 0x0806CA50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806CA80 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0806CA7A
	bl sub_080718F0
	bl sub_080135A4
	ldr r0, [r4, #0x30]
	subs r0, #1
	str r0, [r4, #0x30]
	cmp r0, #0
	bne _0806CA7A
	bl Proc_Init
	bl sub_0806A454
_0806CA7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CA80: .4byte gUnknown_03004008

