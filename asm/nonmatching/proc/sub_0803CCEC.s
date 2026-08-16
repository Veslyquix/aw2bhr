	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CCEC
sub_0803CCEC: @ 0x0803CCEC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0803CD08 @ =gUnknown_020280C0
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrb r0, [r0, #0x13]
	cmp r0, #0xff
	beq _0803CD0C
	adds r0, r2, #2
	adds r0, r1, r0
	b _0803CD0E
	.align 2, 0
_0803CD08: .4byte gUnknown_020280C0
_0803CD0C:
	ldr r0, _0803CD10 @ =gUnknown_0849F320
_0803CD0E:
	bx lr
	.align 2, 0
_0803CD10: .4byte gUnknown_0849F320

