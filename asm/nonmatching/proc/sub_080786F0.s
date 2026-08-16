	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080786F0
sub_080786F0: @ 0x080786F0
	push {r4, lr}
	ldr r2, _08078730 @ =gUnknown_03005958
	ldr r4, _08078734 @ =gUnknown_03005944
	ldr r1, [r4]
	adds r1, r1, r2
	movs r2, #2
	strb r2, [r1]
	ldr r2, _08078738 @ =gUnknown_03005948
	ldr r1, [r4]
	adds r1, r1, r2
	movs r2, #3
	strb r2, [r1]
	ldr r2, _0807873C @ =gUnknown_030058E0
	adds r3, r0, r2
	movs r1, #8
	strb r1, [r3]
	adds r0, #1
	adds r3, r0, r2
	movs r1, #9
	strb r1, [r3]
	adds r0, #1
	adds r2, r0, r2
	movs r1, #0x11
	strb r1, [r2]
	adds r0, #1
	ldr r1, [r4]
	adds r1, #1
	str r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078730: .4byte gUnknown_03005958
_08078734: .4byte gUnknown_03005944
_08078738: .4byte gUnknown_03005948
_0807873C: .4byte gUnknown_030058E0

