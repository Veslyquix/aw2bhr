	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072A3C
sub_08072A3C: @ 0x08072A3C
	adds r3, r1, #0
	cmp r0, #1
	beq _08072A60
	cmp r0, #1
	bgt _08072A4C
	cmp r0, #0
	beq _08072A56
	b _08072A84
_08072A4C:
	cmp r0, #2
	beq _08072A68
	cmp r0, #3
	beq _08072A70
	b _08072A84
_08072A56:
	ldr r0, _08072A5C @ =gUnknown_08499578
	b _08072A72
	.align 2, 0
_08072A5C: .4byte gUnknown_08499578
_08072A60:
	ldr r0, _08072A64 @ =gUnknown_0849957C
	b _08072A72
	.align 2, 0
_08072A64: .4byte gUnknown_0849957C
_08072A68:
	ldr r0, _08072A6C @ =gUnknown_08499580
	b _08072A72
	.align 2, 0
_08072A6C: .4byte gUnknown_08499580
_08072A70:
	ldr r0, _08072A80 @ =gUnknown_08499584
_08072A72:
	lsls r1, r2, #5
	adds r1, r1, r3
	lsls r1, r1, #1
	ldr r0, [r0]
	adds r0, r0, r1
	b _08072A86
	.align 2, 0
_08072A80: .4byte gUnknown_08499584
_08072A84:
	movs r0, #0
_08072A86:
	bx lr

