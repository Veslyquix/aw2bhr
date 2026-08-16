	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080116E8
sub_080116E8: @ 0x080116E8
	push {lr}
	ldr r0, _080116FC @ =gUnknown_080A1424
	ldr r1, _08011700 @ =0x06017800
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
	pop {r0}
	bx r0
	.align 2, 0
_080116FC: .4byte gUnknown_080A1424
_08011700: .4byte 0x06017800

