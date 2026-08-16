	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FF04
sub_0803FF04: @ 0x0803FF04
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0803FF28 @ =gUnknown_0849FADC
	movs r1, #3
	bl Proc_Start
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_0803FF48
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF28: .4byte gUnknown_0849FADC

