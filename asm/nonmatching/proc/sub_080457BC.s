	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080457BC
sub_080457BC: @ 0x080457BC
	ldr r0, _080457C8 @ =gUnknown_03002EE4
	ldrh r0, [r0]
	cmp r0, #0
	bne _080457CC
	movs r0, #1
	b _080457CE
	.align 2, 0
_080457C8: .4byte gUnknown_03002EE4
_080457CC:
	movs r0, #0
_080457CE:
	bx lr

