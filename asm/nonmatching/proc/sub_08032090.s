	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032090
sub_08032090: @ 0x08032090
	push {lr}
	adds r1, r0, #0
	ldr r0, _080320A8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	cmp r0, #0xb3
	bhi _080320A4
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080320A4:
	pop {r0}
	bx r0
	.align 2, 0
_080320A8: .4byte gUnknown_03003FC0

