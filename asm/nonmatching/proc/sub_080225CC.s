	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080225CC
sub_080225CC: @ 0x080225CC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08022610 @ =gUnknown_08499590
	ldr r4, [r2]
	ldrh r2, [r4, #0xc]
	subs r0, r0, r2
	movs r3, #0xf
	ands r0, r3
	ldrh r2, [r4, #0xe]
	subs r1, r1, r2
	ands r1, r3
	ldr r2, _08022614 @ =gUnknown_08499580
	ldr r2, [r2]
	lsls r1, r1, #7
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r1, r1, r0
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r2, r0, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	adds r0, r1, #0
	adds r0, #0x40
	strh r2, [r0]
	adds r1, #0x42
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022610: .4byte gUnknown_08499590
_08022614: .4byte gUnknown_08499580

