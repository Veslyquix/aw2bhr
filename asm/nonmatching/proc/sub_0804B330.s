	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B330
sub_0804B330: @ 0x0804B330
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _0804B35C @ =gUnknown_08136030
	ldr r1, [r2]
	lsls r0, r5, #4
	adds r3, r0, r1
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	ldrh r6, [r3, #0xe]
	movs r7, #0
	ldr r0, _0804B360 @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0804B364
	strh r4, [r3, #8]
	b _0804B370
	.align 2, 0
_0804B35C: .4byte gUnknown_08136030
_0804B360: .4byte gUnknown_03004504
_0804B364:
	cmp r6, #0x28
	bne _0804B36A
	strh r4, [r3, #8]
_0804B36A:
	ldrh r0, [r3, #8]
	cmp r0, #1
	bne _0804B372
_0804B370:
	movs r6, #0
_0804B372:
	ldr r0, [r2]
	lsls r1, r5, #4
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, #2
	bne _0804B38E
	ldrh r0, [r3, #0xe]
	movs r7, #1
	ands r7, r0
	cmp r5, #0
	beq _0804B38E
	rsbs r0, r7, #0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0804B38E:
	ldr r0, [r2]
	adds r0, #4
	adds r0, r1, r0
	ldr r4, [r0]
	ldr r0, _0804B3C4 @ =gUnknown_084C3F70
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r2, [r0]
	ldr r0, _0804B3C8 @ =gUnknown_084C3F78
	adds r1, r1, r0
	ldr r3, [r1]
	ldrh r0, [r2]
	lsls r1, r6, #1
	adds r1, r1, r4
	adds r0, r0, r7
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r2]
	adds r1, #0x50
	ldrh r0, [r1]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B3C4: .4byte gUnknown_084C3F70
_0804B3C8: .4byte gUnknown_084C3F78

