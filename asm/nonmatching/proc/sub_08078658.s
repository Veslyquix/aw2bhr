	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078658
sub_08078658: @ 0x08078658
	push {r4, lr}
	ldr r2, _08078694 @ =gUnknown_03005958
	ldr r4, _08078698 @ =gUnknown_03005944
	ldr r1, [r4]
	adds r1, r1, r2
	movs r2, #1
	strb r2, [r1]
	ldr r2, _0807869C @ =gUnknown_03005948
	ldr r1, [r4]
	adds r1, r1, r2
	movs r3, #3
	strb r3, [r1]
	ldr r2, _080786A0 @ =gUnknown_030058E0
	adds r1, r0, r2
	strb r3, [r1]
	adds r0, #1
	adds r3, r0, r2
	movs r1, #5
	strb r1, [r3]
	adds r0, #1
	adds r2, r0, r2
	movs r1, #0x10
	strb r1, [r2]
	adds r0, #1
	ldr r1, [r4]
	adds r1, #1
	str r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078694: .4byte gUnknown_03005958
_08078698: .4byte gUnknown_03005944
_0807869C: .4byte gUnknown_03005948
_080786A0: .4byte gUnknown_030058E0

