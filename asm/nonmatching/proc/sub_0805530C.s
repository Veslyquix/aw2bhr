	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805530C
sub_0805530C: @ 0x0805530C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	ldr r4, _08055368 @ =gUnknown_020298E0
	lsls r3, r0, #3
	adds r3, r3, r0
	lsls r3, r3, #4
	adds r3, r3, r4
	strh r5, [r3]
	lsls r0, r5, #0x15
	lsrs r7, r0, #0x10
	ldr r4, _0805536C @ =gUnknown_085D7768
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrh r2, [r1]
	adds r6, r2, #0
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r2, #0
	beq _08055356
	ldr r1, _08055370 @ =0x06010000
	adds r1, r7, r1
	lsrs r2, r2, #2
	bl CpuFastSet
_08055356:
	lsrs r0, r6, #5
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08055368: .4byte gUnknown_020298E0
_0805536C: .4byte gUnknown_085D7768
_08055370: .4byte 0x06010000

