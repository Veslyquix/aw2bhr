	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080540F0
sub_080540F0: @ 0x080540F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r2, _08054144 @ =gUnknown_02029A10
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r6, r1
	adds r0, r0, r1
	adds r4, r0, r2
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08054134
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054134
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	ldr r1, _08054148 @ =gUnknown_02029BA8
	lsls r2, r6, #5
	adds r1, #8
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
_08054134:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0805198C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054144: .4byte gUnknown_02029A10
_08054148: .4byte gUnknown_02029BA8

