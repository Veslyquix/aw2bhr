	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034848
sub_08034848: @ 0x08034848
	push {r4, r5, lr}
	ldr r4, _08034868 @ =gUnknown_03003FC0
	movs r5, #1
	strb r5, [r4, #0xc]
	movs r0, #3
	strb r0, [r4, #1]
	strb r5, [r4, #2]
	bl sub_08034780
	bl sub_08034838
	strb r5, [r4, #9]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034868: .4byte gUnknown_03003FC0

