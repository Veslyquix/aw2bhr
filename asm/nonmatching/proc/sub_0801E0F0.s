	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E0F0
sub_0801E0F0: @ 0x0801E0F0
	push {lr}
	movs r0, #0
	movs r1, #0x80
	bl sub_0801E0C8
	ldr r1, _0801E104 @ =gUnknown_03002B54
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801E104: .4byte gUnknown_03002B54

