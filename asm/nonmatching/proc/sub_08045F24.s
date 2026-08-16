	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045F24
sub_08045F24: @ 0x08045F24
	push {lr}
	ldr r0, _08045F3C @ =0x000001C7
	bl sub_0803B4DC
	movs r0, #0x14
	movs r1, #0x64
	movs r2, #0x3c
	movs r3, #0
	bl sub_080130DC
	pop {r0}
	bx r0
	.align 2, 0
_08045F3C: .4byte 0x000001C7

