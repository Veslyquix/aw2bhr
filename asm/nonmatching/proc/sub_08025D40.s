	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025D40
sub_08025D40: @ 0x08025D40
	ldr r1, _08025D5C @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3b
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	beq _08025D5A
	adds r0, r2, #1
	strb r0, [r1]
_08025D5A:
	bx lr
	.align 2, 0
_08025D5C: .4byte gUnknown_08499598

