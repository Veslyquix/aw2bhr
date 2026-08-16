	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045EAC
sub_08045EAC: @ 0x08045EAC
	push {lr}
	movs r0, #2
	movs r1, #0x8c
	movs r2, #0
	bl sub_08013338
	movs r0, #2
	movs r1, #0
	movs r2, #0xb4
	movs r3, #0
	bl sub_080130DC
	ldr r0, _08045ED0 @ =0x000001D5
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0
_08045ED0: .4byte 0x000001D5

