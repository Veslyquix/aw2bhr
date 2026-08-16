	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CC00
sub_0806CC00: @ 0x0806CC00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806CC18 @ =gUnknown_08581CF8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x34]
	cmp r4, #0
	beq _0806CC20
	ldr r1, _0806CC1C @ =gUnknown_0202F2C4
	movs r0, #0xb4
	b _0806CC26
	.align 2, 0
_0806CC18: .4byte gUnknown_08581CF8
_0806CC1C: .4byte gUnknown_0202F2C4
_0806CC20:
	ldr r1, _0806CC30 @ =gUnknown_0202F2C4
	movs r0, #0xb4
	lsls r0, r0, #1
_0806CC26:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CC30: .4byte gUnknown_0202F2C4

