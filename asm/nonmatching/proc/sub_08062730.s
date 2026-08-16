	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062730
sub_08062730: @ 0x08062730
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r1, [r4, #2]
	ldrb r0, [r5, #2]
	subs r2, r1, r0
	cmp r2, #0
	bge _08062742
	rsbs r2, r2, #0
_08062742:
	ldrb r1, [r4, #3]
	ldrb r0, [r5, #3]
	subs r1, r1, r0
	cmp r1, #0
	bge _0806274E
	rsbs r1, r1, #0
_0806274E:
	adds r7, r2, r1
	ldr r6, _08062774 @ =gUnknown_030033EC
	ldrh r0, [r6]
	ldrb r1, [r5]
	bl sub_08042D50
	cmp r0, #1
	bne _08062778
	adds r0, r4, #0
	bl sub_08058224
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08058224
	adds r4, r4, r0
	adds r4, #1
	b _0806278A
	.align 2, 0
_08062774: .4byte gUnknown_030033EC
_08062778:
	adds r0, r4, #0
	bl sub_08058224
	adds r4, r0, #0
	ldrh r0, [r6]
	ldrb r1, [r5]
	bl sub_08042D50
	adds r4, r4, r0
_0806278A:
	cmp r7, r4
	bgt _08062792
	movs r0, #1
	b _08062794
_08062792:
	movs r0, #0
_08062794:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

