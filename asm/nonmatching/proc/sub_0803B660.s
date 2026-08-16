	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B660
sub_0803B660: @ 0x0803B660
	push {lr}
	ldr r2, _0803B678 @ =gUnknown_030005C8
	ldrh r1, [r2]
	ldr r0, _0803B67C @ =0x0000FFFF
	cmp r1, r0
	beq _0803B674
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl sub_0803B4EC
_0803B674:
	pop {r0}
	bx r0
	.align 2, 0
_0803B678: .4byte gUnknown_030005C8
_0803B67C: .4byte 0x0000FFFF

