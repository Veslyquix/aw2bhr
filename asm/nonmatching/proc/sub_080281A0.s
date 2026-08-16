	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080281A0
sub_080281A0: @ 0x080281A0
	push {lr}
	ldr r0, _080281B8 @ =gUnknown_08499EE4
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080281BC
	movs r0, #1
	b _080281BE
	.align 2, 0
_080281B8: .4byte gUnknown_08499EE4
_080281BC:
	movs r0, #0
_080281BE:
	pop {r1}
	bx r1
	.align 2, 0

