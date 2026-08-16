	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A010
sub_0804A010: @ 0x0804A010
	ldr r1, _0804A024 @ =gUnknown_02028E41
	movs r0, #0xa5
	strb r0, [r1]
	movs r0, #0x5a
	strb r0, [r1, #1]
	movs r0, #0xc3
	strb r0, [r1, #2]
	movs r0, #0x3c
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
_0804A024: .4byte gUnknown_02028E41

