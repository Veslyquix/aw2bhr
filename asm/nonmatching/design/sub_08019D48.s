	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019D48
sub_08019D48: @ 0x08019D48
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08022ADC
	bl sub_08019C24
	ldr r0, _08019D70 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08019D74 @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	ldr r0, [r4, #0x44]
	bl sub_080153B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019D70: .4byte gUnknown_08499578
_08019D74: .4byte 0x06007000

