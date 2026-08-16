	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078608
sub_08078608: @ 0x08078608
	push {r4, lr}
	ldr r2, _08078648 @ =gUnknown_03005958
	ldr r4, _0807864C @ =gUnknown_03005944
	ldr r1, [r4]
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	ldr r2, _08078650 @ =gUnknown_03005948
	ldr r1, [r4]
	adds r1, r1, r2
	movs r2, #3
	strb r2, [r1]
	ldr r2, _08078654 @ =gUnknown_030058E0
	adds r3, r0, r2
	movs r1, #1
	strb r1, [r3]
	adds r0, #1
	adds r3, r0, r2
	movs r1, #4
	strb r1, [r3]
	adds r0, #1
	adds r2, r0, r2
	movs r1, #2
	strb r1, [r2]
	adds r0, #1
	ldr r1, [r4]
	adds r1, #1
	str r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078648: .4byte gUnknown_03005958
_0807864C: .4byte gUnknown_03005944
_08078650: .4byte gUnknown_03005948
_08078654: .4byte gUnknown_030058E0

