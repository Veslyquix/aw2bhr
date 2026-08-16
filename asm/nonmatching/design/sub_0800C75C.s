	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C75C
sub_0800C75C: @ 0x0800C75C
	push {r4, lr}
	adds r4, r1, #0
	cmp r0, #0x48
	beq _0800C77C
	cmp r0, #0x48
	bgt _0800C76E
	cmp r0, #0x28
	beq _0800C778
	b _0800C798
_0800C76E:
	cmp r0, #0x68
	beq _0800C780
	cmp r0, #0x88
	beq _0800C784
	b _0800C798
_0800C778:
	movs r3, #0
	b _0800C786
_0800C77C:
	movs r3, #1
	b _0800C786
_0800C780:
	movs r3, #2
	b _0800C786
_0800C784:
	movs r3, #3
_0800C786:
	ldr r0, _0800C7A0 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	adds r1, #0x17
	adds r1, r1, r3
	strb r4, [r1]
	ldr r0, [r0]
	adds r0, #0x1b
	adds r0, r0, r3
	strb r2, [r0]
_0800C798:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C7A0: .4byte gUnknown_0200B0B0

