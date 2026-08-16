	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045D10
sub_08045D10: @ 0x08045D10
	ldr r0, _08045D38 @ =gUnknown_084995FE
	ldrh r0, [r0, #4]
	adds r2, r0, #1
	adds r3, r0, #0
	adds r3, #0x33
	cmp r2, r3
	bge _08045D48
	ldr r0, _08045D3C @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
_08045D2A:
	ldrb r1, [r0]
	cmp r1, #0
	beq _08045D40
	cmp r1, #0x15
	bne _08045D40
	movs r0, #0
	b _08045D4A
	.align 2, 0
_08045D38: .4byte gUnknown_084995FE
_08045D3C: .4byte gUnknown_08499594
_08045D40:
	adds r0, #0xc
	adds r2, #1
	cmp r2, r3
	blt _08045D2A
_08045D48:
	movs r0, #1
_08045D4A:
	bx lr

