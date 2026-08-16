	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043FA8
sub_08043FA8: @ 0x08043FA8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	ldr r2, _08043FD4 @ =gUnknown_084A0090
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, #0x18
	adds r0, r0, r2
	ldr r0, [r0]
	movs r2, #0xc0
	lsls r2, r2, #1
	bl sub_08011E54
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08043AA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043FD4: .4byte gUnknown_084A0090

