	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B964
sub_0801B964: @ 0x0801B964
	push {r4, lr}
	ldr r4, _0801B980 @ =gUnknown_03000058
	ldr r1, [r4]
	adds r3, r1, r0
	str r3, [r4]
	ldr r2, _0801B984 @ =gUnknown_0300005C
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	cmp r3, #7
	bgt _0801B988
	movs r0, #0
	b _0801B990
	.align 2, 0
_0801B980: .4byte gUnknown_03000058
_0801B984: .4byte gUnknown_0300005C
_0801B988:
	adds r0, r3, #0
	subs r0, #8
	str r0, [r4]
	movs r0, #1
_0801B990:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

