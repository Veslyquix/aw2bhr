	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017994
sub_08017994: @ 0x08017994
	push {lr}
	ldr r0, _080179A8 @ =gUnknown_08499588
	ldr r0, [r0]
	adds r0, #0x4e
	bl sub_080179D0
	bl sub_080185A0
	pop {r0}
	bx r0
	.align 2, 0
_080179A8: .4byte gUnknown_08499588

