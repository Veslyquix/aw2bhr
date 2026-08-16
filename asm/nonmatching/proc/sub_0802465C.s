	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802465C
sub_0802465C: @ 0x0802465C
	push {lr}
	ldr r3, _08024698 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _0802469C @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _080246A0 @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _080246A4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	pop {r0}
	bx r0
	.align 2, 0
_08024698: .4byte gUnknown_03002B6C
_0802469C: .4byte gUnknown_03001FE8
_080246A0: .4byte gUnknown_030030B4
_080246A4: .4byte gUnknown_0300251C

