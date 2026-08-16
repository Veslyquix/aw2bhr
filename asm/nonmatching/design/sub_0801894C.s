	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801894C
sub_0801894C: @ 0x0801894C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0801897C @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0801A548
	ldr r0, _08018980 @ =gUnknown_0200C528
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
_0801897C: .4byte gUnknown_030033EC
_08018980: .4byte gUnknown_0200C528

