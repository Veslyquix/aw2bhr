	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B3E0
sub_0804B3E0: @ 0x0804B3E0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _0804B40C @ =gUnknown_02028E5C
	lsls r0, r4, #2
	adds r2, r0, r1
	ldrh r0, [r2]
	cmp r0, #1
	bne _0804B422
	movs r3, #0
	ldrh r0, [r2, #2]
	cmp r0, #4
	bhi _0804B414
	adds r0, #1
	strh r0, [r2, #2]
	ldr r1, _0804B410 @ =gUnknown_085644C8
	ldrh r0, [r2, #2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	b _0804B418
	.align 2, 0
_0804B40C: .4byte gUnknown_02028E5C
_0804B410: .4byte gUnknown_085644C8
_0804B414:
	strh r3, [r2, #2]
	strh r3, [r2]
_0804B418:
	ldr r0, _0804B428 @ =gUnknown_084C3F78
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	strh r3, [r0]
_0804B422:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B428: .4byte gUnknown_084C3F78

