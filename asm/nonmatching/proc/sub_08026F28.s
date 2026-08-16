	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026F28
sub_08026F28: @ 0x08026F28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08026F54 @ =gUnknown_08499598
	ldr r3, [r2]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r2, #0x2a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2a
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08026F58
	movs r0, #0
	b _08026F5A
	.align 2, 0
_08026F54: .4byte gUnknown_08499598
_08026F58:
	movs r0, #1
_08026F5A:
	bx lr

