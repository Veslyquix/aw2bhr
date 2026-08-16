	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080555F0
sub_080555F0: @ 0x080555F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _08055644 @ =gUnknown_030045A0
	lsls r5, r4, #1
	adds r3, r5, r0
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08055648 @ =gUnknown_085D6A48
	ldr r0, _0805564C @ =gUnknown_03004580
	lsls r1, r4, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x10]
	cmp r0, #1
	bne _08055624
	movs r0, #3
	strh r0, [r3]
_08055624:
	ldr r0, _08055650 @ =gUnknown_02029BE8
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #1
	bne _08055630
	strh r0, [r3]
_08055630:
	ldrh r0, [r1]
	cmp r0, #2
	bne _0805563C
	cmp r6, r4
	bne _0805563C
	strh r0, [r3]
_0805563C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055644: .4byte gUnknown_030045A0
_08055648: .4byte gUnknown_085D6A48
_0805564C: .4byte gUnknown_03004580
_08055650: .4byte gUnknown_02029BE8

