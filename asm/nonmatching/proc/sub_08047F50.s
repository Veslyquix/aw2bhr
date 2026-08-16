	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047F50
sub_08047F50: @ 0x08047F50
	adds r1, r0, #0
	ldrh r0, [r1, #0x26]
	cmp r0, #0x61
	bls _08047F5C
	movs r0, #0
	strh r0, [r1, #0x26]
_08047F5C:
	ldrh r2, [r1, #0x26]
	ldrh r0, [r1, #0x24]
	cmp r0, #0
	bne _08047F6A
	adds r0, r2, #1
	strh r0, [r1, #0x26]
	b _08047F6E
_08047F6A:
	subs r0, #1
	strh r0, [r1, #0x24]
_08047F6E:
	bx lr

