	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084BD4
sub_08084BD4: @ 0x08084BD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08084C10 @ =gUnknown_030033EC
	ldrh r0, [r0]
	adds r5, r4, #0
	adds r5, #0x66
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #2
	strh r1, [r0]
	adds r0, r4, #0
	bl sub_08085298
	adds r0, r4, #0
	bl sub_080852A8
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08043834
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084C10: .4byte gUnknown_030033EC

