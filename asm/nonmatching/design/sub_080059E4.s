	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080059E4
sub_080059E4: @ 0x080059E4
	push {lr}
	ldr r0, _080059F4 @ =gUnknown_0808DF4C
	ldr r1, _080059F8 @ =0x060158C0
	movs r2, #0x40
	bl sub_08011E54
	pop {r0}
	bx r0
	.align 2, 0
_080059F4: .4byte gUnknown_0808DF4C
_080059F8: .4byte 0x060158C0

