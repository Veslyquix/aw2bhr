	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026FD0
sub_08026FD0: @ 0x08026FD0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x1d
	cmp r3, #0
	beq _08027000
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, _08027004 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x66
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08027008
_08027000:
	movs r0, #0
	b _0802700A
	.align 2, 0
_08027004: .4byte gUnknown_08499598
_08027008:
	movs r0, #1
_0802700A:
	bx lr

