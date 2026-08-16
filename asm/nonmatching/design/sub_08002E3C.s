	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002E3C
sub_08002E3C: @ 0x08002E3C
	push {lr}
	ldr r0, _08002E54 @ =gUnknown_0808D8AC
	ldr r1, _08002E58 @ =0x06014D40
	movs r2, #0x8c
	lsls r2, r2, #3
	bl sub_08011E54
	bl sub_08002EF8
	pop {r0}
	bx r0
	.align 2, 0
_08002E54: .4byte gUnknown_0808D8AC
_08002E58: .4byte 0x06014D40

