	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080717C4
sub_080717C4: @ 0x080717C4
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _080717E0 @ =gUnknown_081BA00C
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080717E0: .4byte gUnknown_081BA00C

