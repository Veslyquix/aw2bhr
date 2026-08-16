	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026F9C
sub_08026F9C: @ 0x08026F9C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r2, _08026FC8 @ =gUnknown_08499598
	ldr r3, [r2]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r2, #0x66
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x66
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08026FCC
	movs r0, #0
	b _08026FCE
	.align 2, 0
_08026FC8: .4byte gUnknown_08499598
_08026FCC:
	movs r0, #1
_08026FCE:
	bx lr

