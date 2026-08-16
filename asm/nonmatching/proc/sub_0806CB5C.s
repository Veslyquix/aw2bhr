	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CB5C
sub_0806CB5C: @ 0x0806CB5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0806CB76
	ldr r0, _0806CB84 @ =gUnknown_08581E28
	adds r1, r4, #0
	bl Proc_Start
	ldr r1, [r4, #0x34]
	str r1, [r0, #0x34]
	bl sub_0803B5E8
_0806CB76:
	movs r0, #0
	str r0, [r4, #0x30]
	bl sub_0806CC4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB84: .4byte gUnknown_08581E28

