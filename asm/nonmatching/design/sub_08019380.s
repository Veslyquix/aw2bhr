	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019380
sub_08019380: @ 0x08019380
	push {r4, r5, lr}
	movs r1, #7
	ldr r0, _0801939C @ =gUnknown_0200C508
	adds r4, r0, #0
	adds r4, #0x1c
	movs r5, #0
_0801938C:
	ldr r0, [r4]
	cmp r0, #0
	beq _080193A0
	bl sub_080193B0
	str r5, [r4]
	b _080193A8
	.align 2, 0
_0801939C: .4byte gUnknown_0200C508
_080193A0:
	subs r4, #4
	subs r1, #1
	cmp r1, #0
	bge _0801938C
_080193A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

