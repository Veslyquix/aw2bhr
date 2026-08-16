	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800492C
sub_0800492C: @ 0x0800492C
	push {lr}
	movs r0, #0xd8
	bl sub_0803B524
	movs r0, #1
	bl sub_0800056C
	ldr r0, _08004948 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	adds r0, #0xae
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08004948: .4byte gUnknown_0200B0B0

