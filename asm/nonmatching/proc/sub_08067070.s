	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067070
sub_08067070: @ 0x08067070
	push {lr}
	bl sub_080733B8
	ldr r0, _08067094 @ =gUnknown_08580CC4
	bl sub_0801537C
	ldr r0, _08067098 @ =gUnknown_0202F200
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806708E
	bl sub_080658AC
	ldr r0, _0806709C @ =gUnknown_08580DD8
	bl sub_0801537C
_0806708E:
	pop {r0}
	bx r0
	.align 2, 0
_08067094: .4byte gUnknown_08580CC4
_08067098: .4byte gUnknown_0202F200
_0806709C: .4byte gUnknown_08580DD8

