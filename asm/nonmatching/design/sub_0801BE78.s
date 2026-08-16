	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BE78
sub_0801BE78: @ 0x0801BE78
	push {r4, r5, lr}
	movs r3, #0xf
	ldr r4, _0801BEB0 @ =gUnknown_0808F090
	ldr r0, [r4]
	movs r2, #0
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r0, r5
	adds r0, #0xf0
_0801BE8A:
	str r1, [r0]
	str r2, [r0, #0xc]
	subs r1, #0x10
	subs r0, #0x10
	subs r3, #1
	cmp r3, #0
	bge _0801BE8A
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0xf0
	movs r0, #0
	str r0, [r1]
	str r0, [r2, #0x40]
	ldr r1, _0801BEB4 @ =gUnknown_03002B24
	ldr r0, _0801BEB8 @ =gUnknown_0200CD10
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801BEB0: .4byte gUnknown_0808F090
_0801BEB4: .4byte gUnknown_03002B24
_0801BEB8: .4byte gUnknown_0200CD10

