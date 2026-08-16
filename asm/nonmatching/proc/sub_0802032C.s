	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802032C
sub_0802032C: @ 0x0802032C
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _08020350 @ =gUnknown_030013EC
	ldrb r5, [r0, #2]
	ldrb r1, [r0, #3]
	ldrb r2, [r0]
	movs r0, #0
	str r0, [sp]
	ldr r4, [r3]
	adds r0, r5, #0
	movs r3, #0x78
	bl _call_via_r4
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020350: .4byte gUnknown_030013EC

