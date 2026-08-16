	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080704F0
sub_080704F0: @ 0x080704F0
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0807051C @ =gUnknown_08242308
	ldr r1, _08070520 @ =gUnknown_0824238C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _08070524
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_08070BAC
	b _08070540
	.align 2, 0
_0807051C: .4byte gUnknown_08242308
_08070520: .4byte gUnknown_0824238C
_08070524:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _08070536
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_08070BAC
	b _08070540
_08070536:
	cmp r2, #0
	bge _08070540
	adds r0, r1, #0
	bl sub_080703B8
_08070540:
	pop {r0}
	bx r0

