	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CBC8
sub_0802CBC8: @ 0x0802CBC8
	push {lr}
	bl sub_0802CBA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CBEE
	ldr r0, _0802CBF4 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldr r2, _0802CBF8 @ =gUnknown_03003100
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r3, #2
	ldrsh r2, [r2, r3]
	bl sub_080421D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0802CBFC
_0802CBEE:
	movs r0, #1
	b _0802CBFE
	.align 2, 0
_0802CBF4: .4byte gUnknown_030040D8
_0802CBF8: .4byte gUnknown_03003100
_0802CBFC:
	movs r0, #0
_0802CBFE:
	pop {r1}
	bx r1
	.align 2, 0

