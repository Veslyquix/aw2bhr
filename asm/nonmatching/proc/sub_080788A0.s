	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080788A0
sub_080788A0: @ 0x080788A0
	push {r4, lr}
	ldr r4, _080788CC @ =gUnknown_0202FDFC
	ldrb r0, [r4, #0x1a]
	movs r1, #2
	adds r2, r1, #0
	ands r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #0x1b]
	adds r0, r1, #0
	ands r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r2, r0
	ldrb r0, [r4, #0x1c]
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmn r2, r1
	bne _080788D0
	movs r0, #1
	b _080788D2
	.align 2, 0
_080788CC: .4byte gUnknown_0202FDFC
_080788D0:
	movs r0, #0
_080788D2:
	pop {r4}
	pop {r1}
	bx r1

