	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801AD70
sub_0801AD70: @ 0x0801AD70
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	beq _0801AD88
	adds r0, r4, #0
	bl sub_0801B120
	lsls r0, r0, #0x10
	ldr r1, _0801AD8C @ =0xFFFF0000
	cmp r0, r1
	bne _0801AD90
_0801AD88:
	movs r0, #1
	b _0801ADC0
	.align 2, 0
_0801AD8C: .4byte 0xFFFF0000
_0801AD90:
	movs r3, #0
	ldr r2, _0801ADAC @ =gUnknown_0200CC38
	adds r5, r2, #0
	adds r5, #0x20
_0801AD98:
	adds r0, r3, r5
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0801ADB0
	ldrb r0, [r2]
	cmp r0, r4
	bne _0801ADB6
	b _0801AD88
	.align 2, 0
_0801ADAC: .4byte gUnknown_0200CC38
_0801ADB0:
	ldrb r0, [r2]
	cmp r0, r4
	bne _0801AD88
_0801ADB6:
	adds r2, #1
	adds r3, #1
	cmp r3, #0xf
	ble _0801AD98
	movs r0, #0
_0801ADC0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

