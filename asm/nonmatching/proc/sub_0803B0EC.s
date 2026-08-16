	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B0EC
sub_0803B0EC: @ 0x0803B0EC
	push {lr}
	bl sub_080116E8
	ldr r0, _0803B110 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B10C
	bl sub_0803AF5C
	ldr r1, _0803B114 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
_0803B10C:
	pop {r0}
	bx r0
	.align 2, 0
_0803B110: .4byte gUnknown_03002EE0
_0803B114: .4byte gUnknown_03002F1C

