	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080758E4
sub_080758E4: @ 0x080758E4
	push {lr}
	ldr r0, _080758F8 @ =gUnknown_086143E0
	bl Proc_Find
	ldr r0, [r0, #0x40]
	cmp r0, #0
	bne _080758FC
	movs r0, #0
	b _080758FE
	.align 2, 0
_080758F8: .4byte gUnknown_086143E0
_080758FC:
	movs r0, #1
_080758FE:
	pop {r1}
	bx r1
	.align 2, 0

