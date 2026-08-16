	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080564B8
sub_080564B8: @ 0x080564B8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, r3
	bls _08056510
	movs r1, #0
	subs r7, r2, r3
	cmp r1, r3
	bhs _080564EE
	movs r0, #0x6c
	adds r2, r4, #0
	muls r2, r0, r2
	ldr r6, _08056508 @ =gUnknown_02029816
	movs r5, #1
_080564DC:
	lsls r0, r1, #1
	adds r0, r0, r2
	adds r0, r0, r6
	strh r5, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r3
	blo _080564DC
_080564EE:
	subs r1, #1
	lsls r1, r1, #0x10
	ldr r2, _0805650C @ =gUnknown_02029808
	lsrs r1, r1, #0xf
	movs r0, #0x6c
	muls r0, r4, r0
	adds r1, r1, r0
	adds r2, #0xe
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	b _08056532
	.align 2, 0
_08056508: .4byte gUnknown_02029816
_0805650C: .4byte gUnknown_02029808
_08056510:
	movs r1, #0
	cmp r1, r2
	bhs _08056532
	movs r0, #0x6c
	adds r3, r4, #0
	muls r3, r0, r3
	ldr r5, _08056538 @ =gUnknown_02029816
	movs r4, #1
_08056520:
	lsls r0, r1, #1
	adds r0, r0, r3
	adds r0, r0, r5
	strh r4, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	blo _08056520
_08056532:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056538: .4byte gUnknown_02029816

