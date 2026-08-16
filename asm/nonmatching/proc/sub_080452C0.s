	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080452C0
sub_080452C0: @ 0x080452C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080452E0 @ =gUnknown_084A096C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x3c]
	str r5, [r0, #0x40]
	adds r0, #0x2c
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080452E0: .4byte gUnknown_084A096C

