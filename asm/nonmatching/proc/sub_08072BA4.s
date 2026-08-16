	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072BA4
sub_08072BA4: @ 0x08072BA4
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08072BB8 @ =sub_08072BBC
	adds r1, r3, #0
	bl sub_0807298C
	pop {r0}
	bx r0
	.align 2, 0
_08072BB8: .4byte sub_08072BBC

