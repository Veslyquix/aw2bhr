	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044354
sub_08044354: @ 0x08044354
	ldr r1, _08044370 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x25
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	beq _0804436E
	adds r0, r2, #1
	strb r0, [r1]
_0804436E:
	bx lr
	.align 2, 0
_08044370: .4byte gUnknown_08499598

