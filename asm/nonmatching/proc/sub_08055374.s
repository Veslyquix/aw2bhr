	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055374
sub_08055374: @ 0x08055374
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r2, _080553BC @ =gUnknown_020297C0
	strh r4, [r2]
	strh r4, [r2, #0x24]
	ldr r5, _080553C0 @ =gUnknown_085D6EC8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r5
	ldrh r3, [r0]
	adds r6, r3, #0
	ldrh r0, [r2]
	lsls r0, r0, #0x15
	lsrs r2, r0, #0x10
	cmp r3, #0
	beq _080553AC
	adds r0, r5, #4
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r1, _080553C4 @ =0x06010000
	adds r1, r2, r1
	lsrs r2, r3, #2
	bl CpuFastSet
_080553AC:
	lsrs r0, r6, #5
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080553BC: .4byte gUnknown_020297C0
_080553C0: .4byte gUnknown_085D6EC8
_080553C4: .4byte 0x06010000

