	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A95C
sub_0805A95C: @ 0x0805A95C
	push {r4, r5, lr}
	ldr r3, _0805A984 @ =gUnknown_0816D9A4
	ldr r2, [r3]
	ldr r1, _0805A988 @ =gUnknown_0816D9A8
	ldr r0, [r1]
	ldr r4, [r0]
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #4
	bne _0805A990
	ldrb r0, [r4, #9]
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _0805A990
	ldr r0, _0805A98C @ =gUnknown_030046AC
	strb r1, [r0]
	b _0805A9A0
	.align 2, 0
_0805A984: .4byte gUnknown_0816D9A4
_0805A988: .4byte gUnknown_0816D9A8
_0805A98C: .4byte gUnknown_030046AC
_0805A990:
	ldr r2, _0805A9A8 @ =gUnknown_030046AC
	ldr r1, [r3]
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
_0805A9A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A9A8: .4byte gUnknown_030046AC

