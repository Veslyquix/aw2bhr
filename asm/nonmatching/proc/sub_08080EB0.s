	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080EB0
sub_08080EB0: @ 0x08080EB0
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	bne _08080ECC
	ldr r0, _08080EC8 @ =gUnknown_08616794
	bl Proc_Find
	cmp r0, #0
	beq _08080EDC
	movs r0, #1
	b _08080EDC
	.align 2, 0
_08080EC8: .4byte gUnknown_08616794
_08080ECC:
	cmp r1, #2
	bne _08080EDC
	ldr r0, _08080EE0 @ =gUnknown_08616844
	bl Proc_Find
	cmp r0, #0
	beq _08080EDC
	movs r0, #1
_08080EDC:
	pop {r1}
	bx r1
	.align 2, 0
_08080EE0: .4byte gUnknown_08616844

