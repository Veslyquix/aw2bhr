	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B09C
sub_0801B09C: @ 0x0801B09C
	push {r4, r5, lr}
	ldr r0, _0801B0C0 @ =gUnknown_0808EF60
	ldr r3, [r0]
	ldr r2, [r3]
	ldr r1, _0801B0C4 @ =0x73726132
	adds r5, r0, #0
	cmp r2, r1
	bne _0801B118
	ldrb r0, [r3, #4]
	cmp r0, #0x55
	bne _0801B0CC
	ldr r1, _0801B0C8 @ =0x00000FFF
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xaa
	beq _0801B0DA
	b _0801B118
	.align 2, 0
_0801B0C0: .4byte gUnknown_0808EF60
_0801B0C4: .4byte 0x73726132
_0801B0C8: .4byte 0x00000FFF
_0801B0CC:
	cmp r0, #0xaa
	bne _0801B118
	ldr r1, _0801B110 @ =0x00000FFF
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0801B118
_0801B0DA:
	movs r2, #0
	movs r1, #0
	ldr r4, _0801B110 @ =0x00000FFF
	ldr r3, _0801B114 @ =gUnknown_02002000
_0801B0E2:
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r1, #1
	cmp r1, r4
	ble _0801B0E2
	ldr r3, [r5]
	ldrb r0, [r3, #6]
	cmp r0, r2
	bne _0801B118
	mvns r0, r2
	ldrb r1, [r3, #7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _0801B118
	ldrb r0, [r3, #5]
	cmp r0, #0xf
	bne _0801B118
	movs r0, #0
	b _0801B11A
	.align 2, 0
_0801B110: .4byte 0x00000FFF
_0801B114: .4byte gUnknown_02002000
_0801B118:
	movs r0, #1
_0801B11A:
	pop {r4, r5}
	pop {r1}
	bx r1

