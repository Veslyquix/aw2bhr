	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080227F4
sub_080227F4: @ 0x080227F4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08022840 @ =gUnknown_08499578
	ldr r2, _08022844 @ =gUnknown_08499590
	ldr r5, [r2]
	ldrh r2, [r5, #0xc]
	subs r2, r0, r2
	movs r4, #0xf
	ands r2, r4
	lsls r2, r2, #2
	ldr r3, [r3]
	adds r3, r3, r2
	ldrh r2, [r5, #0xe]
	subs r2, r1, r2
	ands r2, r4
	lsls r2, r2, #7
	adds r3, r3, r2
	ldr r2, _08022848 @ =gUnknown_03003340
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802284C
	movs r0, #0
	strh r0, [r3]
	strh r0, [r3, #2]
	adds r1, r3, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r1, #2
	b _08022868
	.align 2, 0
_08022840: .4byte gUnknown_08499578
_08022844: .4byte gUnknown_08499590
_08022848: .4byte gUnknown_03003340
_0802284C:
	ldr r1, _08022870 @ =0x000081B0
	adds r0, r1, #0
	strh r0, [r3]
	ldr r2, _08022874 @ =0x000081B1
	adds r0, r2, #0
	strh r0, [r3, #2]
	adds r1, r3, #0
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
_08022868:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08022870: .4byte 0x000081B0
_08022874: .4byte 0x000081B1

