	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080441D4
sub_080441D4: @ 0x080441D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804419C
	ldr r3, _08044200 @ =gUnknown_085D3DD0
	ldr r1, _08044204 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x1d]
	lsls r1, r2, #6
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, #0xc
	adds r1, r1, r3
	ldr r1, [r1]
	muls r0, r1, r0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08044200: .4byte gUnknown_085D3DD0
_08044204: .4byte gUnknown_08499598

