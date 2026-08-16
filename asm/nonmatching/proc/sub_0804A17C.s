	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A17C
sub_0804A17C: @ 0x0804A17C
	ldr r1, _0804A188 @ =gUnknown_02028E41
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0804A188: .4byte gUnknown_02028E41

