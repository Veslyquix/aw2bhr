	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049E9C
sub_08049E9C: @ 0x08049E9C
	push {lr}
	movs r0, #0xda
	bl sub_0803B524
	ldr r0, _08049EB0 @ =gUnknown_084C325C
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_08049EB0: .4byte gUnknown_084C325C

