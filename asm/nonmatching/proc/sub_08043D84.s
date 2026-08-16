	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043D84
sub_08043D84: @ 0x08043D84
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08043DA4 @ =gUnknown_085D3DD0
	ldr r1, _08043DA8 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	bx lr
	.align 2, 0
_08043DA4: .4byte gUnknown_085D3DD0
_08043DA8: .4byte gUnknown_08499598

