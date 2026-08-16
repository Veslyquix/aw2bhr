	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026588
sub_08026588: @ 0x08026588
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080265AC @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x16]
	adds r2, r0, #1
	strh r2, [r1, #0x16]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r1, #0x18]
	cmp r0, r3
	bls _080265AA
	strh r2, [r1, #0x18]
_080265AA:
	bx lr
	.align 2, 0
_080265AC: .4byte gUnknown_08499598

