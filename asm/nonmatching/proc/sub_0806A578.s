	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A578
sub_0806A578: @ 0x0806A578
	push {lr}
	ldr r0, [r0, #0x2c]
	adds r0, #0x5a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0806A588
	adds r0, #3
_0806A588:
	asrs r2, r0, #2
	cmp r2, #4
	bgt _0806A5A6
	ldr r1, _0806A5AC @ =gUnknown_03002020
	movs r0, #4
	subs r0, r0, r2
	strh r0, [r1]
	ldr r1, _0806A5B0 @ =gUnknown_03002B28
	adds r0, r2, #0
	adds r0, #0xc
	strh r0, [r1]
	ldr r0, _0806A5B4 @ =sub_0806A534
	movs r1, #0x7f
	bl sub_0801F024
_0806A5A6:
	pop {r0}
	bx r0
	.align 2, 0
_0806A5AC: .4byte gUnknown_03002020
_0806A5B0: .4byte gUnknown_03002B28
_0806A5B4: .4byte sub_0806A534

