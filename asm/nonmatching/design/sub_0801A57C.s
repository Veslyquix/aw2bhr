	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A57C
sub_0801A57C: @ 0x0801A57C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _0801A5A8 @ =gUnknown_0810E6E0
	ldr r1, _0801A5AC @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1a]
	adds r0, #4
	lsls r0, r0, #5
	adds r0, r0, r3
	movs r1, #0xb0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_08013618
	pop {r0}
	bx r0
	.align 2, 0
_0801A5A8: .4byte gUnknown_0810E6E0
_0801A5AC: .4byte gUnknown_08499598

