	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080604BC
sub_080604BC: @ 0x080604BC
	push {lr}
	ldr r0, _080604D4 @ =gUnknown_030046C0
	ldrb r0, [r0, #6]
	bl sub_080425FC
	ldr r0, _080604D8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	pop {r0}
	bx r0
	.align 2, 0
_080604D4: .4byte gUnknown_030046C0
_080604D8: .4byte gUnknown_03001FBC

