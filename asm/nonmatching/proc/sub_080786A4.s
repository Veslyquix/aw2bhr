	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080786A4
sub_080786A4: @ 0x080786A4
	push {r4, lr}
	ldr r2, _080786E0 @ =gUnknown_03005958
	ldr r4, _080786E4 @ =gUnknown_03005944
	ldr r1, [r4]
	adds r1, r1, r2
	movs r3, #3
	strb r3, [r1]
	ldr r2, _080786E8 @ =gUnknown_03005948
	ldr r1, [r4]
	adds r1, r1, r2
	strb r3, [r1]
	ldr r2, _080786EC @ =gUnknown_030058E0
	adds r3, r0, r2
	movs r1, #6
	strb r1, [r3]
	adds r0, #1
	adds r3, r0, r2
	movs r1, #7
	strb r1, [r3]
	adds r0, #1
	adds r2, r0, r2
	movs r1, #0x12
	strb r1, [r2]
	adds r0, #1
	ldr r1, [r4]
	adds r1, #1
	str r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080786E0: .4byte gUnknown_03005958
_080786E4: .4byte gUnknown_03005944
_080786E8: .4byte gUnknown_03005948
_080786EC: .4byte gUnknown_030058E0

