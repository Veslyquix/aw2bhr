	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EF90
sub_0801EF90: @ 0x0801EF90
	push {lr}
	movs r0, #0x10
	movs r1, #0x70
	bl sub_0801E0C8
	ldr r1, _0801EFA4 @ =gUnknown_03002B54
	movs r0, #0x10
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801EFA4: .4byte gUnknown_03002B54

