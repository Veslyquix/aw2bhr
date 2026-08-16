	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BED8
sub_0806BED8: @ 0x0806BED8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	movs r6, #0
	ldr r0, _0806BEFC @ =gUnknown_08581A34
	bl Proc_Start
	adds r3, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, #8
	str r0, [r3, #0x58]
	str r6, [r3, #0x5c]
	str r6, [r3, #0x60]
	b _0806BF32
	.align 2, 0
_0806BEFC: .4byte gUnknown_08581A34
_0806BF00:
	cmp r0, #0x2d
	bne _0806BF08
	movs r2, #0x34
	b _0806BF20
_0806BF08:
	cmp r0, #0x20
	bne _0806BF10
	movs r2, #0x38
	b _0806BF20
_0806BF10:
	cmp r0, #0x7e
	bne _0806BF18
	movs r2, #0x3a
	b _0806BF20
_0806BF18:
	ldrb r0, [r5]
	subs r0, #0x41
	lsls r0, r0, #0x11
	lsrs r2, r0, #0x10
_0806BF20:
	lsls r0, r6, #1
	adds r1, r3, #0
	adds r1, #0x2a
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xa0
	strh r0, [r1]
	adds r5, #1
	adds r6, #1
_0806BF32:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0806BF00
	str r6, [r3, #0x54]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

