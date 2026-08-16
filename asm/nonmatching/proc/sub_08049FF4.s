	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049FF4
sub_08049FF4: @ 0x08049FF4
	push {lr}
	ldr r0, _0804A008 @ =gUnknown_084C3814
	bl sub_0801537C
	ldr r0, _0804A00C @ =gUnknown_084C3824
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0804A008: .4byte gUnknown_084C3814
_0804A00C: .4byte gUnknown_084C3824

