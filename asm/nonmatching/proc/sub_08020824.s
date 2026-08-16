	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020824
sub_08020824: @ 0x08020824
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08020844 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	bne _08020848
	movs r0, #0
	b _08020862
	.align 2, 0
_08020844: .4byte gUnknown_08499598
_08020848:
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2a
	adds r1, #0x2a
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08020860
	movs r0, #2
	b _08020862
_08020860:
	movs r0, #1
_08020862:
	bx lr

