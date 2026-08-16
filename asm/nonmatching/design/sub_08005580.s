	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005580
sub_08005580: @ 0x08005580
	push {lr}
	movs r0, #0x70
	bl sub_0801B780
	bl sub_0801A664
	movs r0, #0x66
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0

