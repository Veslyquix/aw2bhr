	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018890
sub_08018890: @ 0x08018890
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _080188C4 @ =gUnknown_03002F08
	movs r0, #8
	strb r0, [r1]
	ldr r0, _080188C8 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0801A57C
	ldr r0, _080188CC @ =gUnknown_0200C528
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080188C4: .4byte gUnknown_03002F08
_080188C8: .4byte gUnknown_030033EC
_080188CC: .4byte gUnknown_0200C528

