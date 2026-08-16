	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080303B0
sub_080303B0: @ 0x080303B0
	ldr r0, _080303C0 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080303C4
	movs r0, #1
	b _080303C6
	.align 2, 0
_080303C0: .4byte gUnknown_0849B018
_080303C4:
	movs r0, #0
_080303C6:
	bx lr

