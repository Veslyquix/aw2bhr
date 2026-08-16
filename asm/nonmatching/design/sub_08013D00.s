	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013D00
sub_08013D00: @ 0x08013D00
	adds r3, r1, #0
	cmp r0, #1
	beq _08013D1C
	cmp r0, #1
	ble _08013D12
	cmp r0, #2
	beq _08013D24
	cmp r0, #3
	beq _08013D2C
_08013D12:
	ldr r0, _08013D18 @ =gUnknown_08499578
	b _08013D2E
	.align 2, 0
_08013D18: .4byte gUnknown_08499578
_08013D1C:
	ldr r0, _08013D20 @ =gUnknown_0849957C
	b _08013D2E
	.align 2, 0
_08013D20: .4byte gUnknown_0849957C
_08013D24:
	ldr r0, _08013D28 @ =gUnknown_08499580
	b _08013D2E
	.align 2, 0
_08013D28: .4byte gUnknown_08499580
_08013D2C:
	ldr r0, _08013D3C @ =gUnknown_08499584
_08013D2E:
	lsls r1, r2, #6
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r1, r3, #1
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08013D3C: .4byte gUnknown_08499584

