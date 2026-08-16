	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036E54
sub_08036E54: @ 0x08036E54
	push {lr}
	bl sub_08036B4C
	movs r0, #0
	bl sub_0801B780
	ldr r0, _08036E6C @ =gUnknown_0849D1AC
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_08036E6C: .4byte gUnknown_0849D1AC

