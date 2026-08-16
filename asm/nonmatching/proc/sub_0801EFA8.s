	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EFA8
sub_0801EFA8: @ 0x0801EFA8
	push {lr}
	movs r0, #0
	movs r1, #0x10
	bl sub_0801E0C8
	ldr r1, _0801EFBC @ =gUnknown_03001FE4
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801EFBC: .4byte gUnknown_03001FE4

