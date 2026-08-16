	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080185A0
sub_080185A0: @ 0x080185A0
	push {lr}
	ldr r0, _080185B4 @ =gUnknown_08499588
	ldr r0, [r0]
	ldr r1, _080185B8 @ =0x06006800
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011E54
	pop {r0}
	bx r0
	.align 2, 0
_080185B4: .4byte gUnknown_08499588
_080185B8: .4byte 0x06006800

