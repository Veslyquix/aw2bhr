	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C994
sub_0807C994: @ 0x0807C994
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x48
	ldrh r0, [r4]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _0807C9E4 @ =gUnknown_08234AF0
	adds r0, r0, r1
	movs r1, #0x86
	lsls r1, r1, #2
	movs r2, #2
	bl sub_08013618
	ldrh r0, [r4]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _0807C9E8 @ =gUnknown_08239F84
	adds r0, r0, r1
	movs r1, #0xee
	lsls r1, r1, #2
	movs r2, #2
	bl sub_08013618
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C9E4: .4byte gUnknown_08234AF0
_0807C9E8: .4byte gUnknown_08239F84

