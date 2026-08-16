	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CBA0
sub_0802CBA0: @ 0x0802CBA0
	push {lr}
	ldr r1, _0802CBBC @ =gUnknown_03003100
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_080422A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0802CBC0
	movs r0, #1
	b _0802CBC2
	.align 2, 0
_0802CBBC: .4byte gUnknown_03003100
_0802CBC0:
	movs r0, #0
_0802CBC2:
	pop {r1}
	bx r1
	.align 2, 0

