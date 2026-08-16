	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070478
sub_08070478: @ 0x08070478
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0807049C @ =gUnknown_08242308
	ldr r1, _080704A0 @ =gUnknown_0824238C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl sub_08070BAC
	pop {r0}
	bx r0
	.align 2, 0
_0807049C: .4byte gUnknown_08242308
_080704A0: .4byte gUnknown_0824238C

