	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806775C
sub_0806775C: @ 0x0806775C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08067784 @ =gUnknown_08580FCC
	bl Proc_Start
	ldr r1, _08067788 @ =gUnknown_08580FC0
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	str r2, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x38]
	movs r1, #0
	ldrsb r1, [r2, r1]
	str r1, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067784: .4byte gUnknown_08580FCC
_08067788: .4byte gUnknown_08580FC0

