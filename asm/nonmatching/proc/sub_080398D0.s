	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080398D0
sub_080398D0: @ 0x080398D0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0803990C @ =gUnknown_085D3DD0
	bl sub_080129E0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #1
	ldr r2, [r5, #0x54]
	ldr r1, _08039910 @ =gUnknown_08499598
	ldr r3, [r1]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r1, #0x1d]
	lsls r1, r2, #6
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r4, #0x20
	adds r0, r0, r4
	ldrh r0, [r0]
	bl sub_080397F4
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803990C: .4byte gUnknown_085D3DD0
_08039910: .4byte gUnknown_08499598

