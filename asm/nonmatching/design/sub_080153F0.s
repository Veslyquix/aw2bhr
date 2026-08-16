	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080153F0
sub_080153F0: @ 0x080153F0
	ldr r2, _08015408 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	ldr r0, [r1]
	cmp r0, #0
	bne _0801540C
	movs r0, #0
	b _0801540E
	.align 2, 0
_08015408: .4byte gUnknown_03001470
_0801540C:
	movs r0, #1
_0801540E:
	bx lr

