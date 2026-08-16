	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043DAC
sub_08043DAC: @ 0x08043DAC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08043DDC @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x1e]
	cmp r1, #1
	beq _08043DE0
	cmp r1, #1
	ble _08043DCC
	cmp r1, #2
	beq _08043DE8
_08043DCC:
	adds r0, r2, #0
	bl sub_08043D84
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B4EC
	b _08043DEE
	.align 2, 0
_08043DDC: .4byte gUnknown_08499598
_08043DE0:
	ldrb r0, [r0, #0x1d]
	bl sub_08043DF4
	b _08043DEE
_08043DE8:
	ldrb r0, [r0, #0x1d]
	bl sub_08043E18
_08043DEE:
	pop {r1}
	bx r1
	.align 2, 0

