	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FF2C
sub_0803FF2C: @ 0x0803FF2C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803FF44 @ =gUnknown_030044D4
	ldr r1, [r2, #0x54]
	ldr r0, [r0]
	cmp r1, r0
	beq _0803FF40
	adds r0, r2, #0
	bl Proc_End
_0803FF40:
	pop {r0}
	bx r0
	.align 2, 0
_0803FF44: .4byte gUnknown_030044D4

