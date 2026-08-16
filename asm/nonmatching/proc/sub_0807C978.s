	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C978
sub_0807C978: @ 0x0807C978
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0807F238
	ldr r0, _0807C990 @ =gUnknown_08616638
	adds r1, r4, #0
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C990: .4byte gUnknown_08616638

