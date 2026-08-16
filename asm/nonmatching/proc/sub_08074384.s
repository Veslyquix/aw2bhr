	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074384
sub_08074384: @ 0x08074384
	push {lr}
	ldr r1, _080743AC @ =gUnknown_03002F08
	movs r0, #0xf
	strb r0, [r1]
	ldr r0, _080743B0 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _080743B4 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	movs r1, #0xf
	bl sub_0802D5CC
	pop {r0}
	bx r0
	.align 2, 0
_080743AC: .4byte gUnknown_03002F08
_080743B0: .4byte gUnknown_030033EC
_080743B4: .4byte gUnknown_08499598

