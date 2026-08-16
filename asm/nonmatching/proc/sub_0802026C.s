	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802026C
sub_0802026C: @ 0x0802026C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r3, #0
	ldr r3, [sp, #0x14]
	ldr r4, [sp, #0x18]
	ldr r5, _08020298 @ =gUnknown_03004480
	strh r0, [r5]
	ldr r0, _0802029C @ =gUnknown_030013EC
	str r4, [sp]
	ldr r4, [r0]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r6, #0
	bl _call_via_r4
	ldr r0, _080202A0 @ =gUnknown_030033EC
	ldrh r0, [r0]
	strh r0, [r5]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020298: .4byte gUnknown_03004480
_0802029C: .4byte gUnknown_030013EC
_080202A0: .4byte gUnknown_030033EC

