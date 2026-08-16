	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803EB84
sub_0803EB84: @ 0x0803EB84
	push {lr}
	adds r2, r0, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _0803EBA0 @ =gUnknown_03003F40
	ldr r0, [r0]
	cmp r1, r0
	bne _0803EB9C
	adds r0, r2, #0
	bl Proc_End
_0803EB9C:
	pop {r0}
	bx r0
	.align 2, 0
_0803EBA0: .4byte gUnknown_03003F40

