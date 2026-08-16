	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BCD0
sub_0800BCD0: @ 0x0800BCD0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r3, _0800BD0C @ =gUnknown_0808D864
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r7, _0800BD10 @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800BD14 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0
	adds r7, r3, #0
	cmp r0, #0x13
	beq _0800BCFE
	cmp r0, #7
	bne _0800BD00
_0800BCFE:
	movs r1, #1
_0800BD00:
	lsls r0, r1, #4
	orrs r5, r0
	cmp r5, #0
	bne _0800BD18
	movs r0, #0
	b _0800BEA6
	.align 2, 0
_0800BD0C: .4byte gUnknown_0808D864
_0800BD10: .4byte 0x0000417A
_0800BD14: .4byte 0x00001432
_0800BD18:
	cmp r6, #0
	ble _0800BDAA
	subs r3, r6, #1
	cmp r4, #0
	ble _0800BD4E
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r0, r3, #1
	mov ip, r0
	ldr r2, _0800BEAC @ =0x0000417A
	adds r0, r1, r2
	add r0, ip
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r2, _0800BEB0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BD48
	cmp r0, #7
	bne _0800BD4A
_0800BD48:
	movs r1, #1
_0800BD4A:
	lsls r0, r1, #8
	orrs r5, r0
_0800BD4E:
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r0, r3, #1
	mov ip, r0
	ldr r2, _0800BEAC @ =0x0000417A
	adds r0, r1, r2
	add r0, ip
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800BEB0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BD72
	cmp r0, #7
	bne _0800BD74
_0800BD72:
	movs r1, #1
_0800BD74:
	lsls r0, r1, #7
	orrs r5, r0
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r4, r0
	bge _0800BDAA
	lsls r1, r3, #1
	ldr r3, _0800BEAC @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r4
	ldr r3, _0800BEB0 @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BDA4
	cmp r0, #7
	bne _0800BDA6
_0800BDA4:
	movs r1, #1
_0800BDA6:
	lsls r0, r1, #6
	orrs r5, r0
_0800BDAA:
	cmp r4, #0
	ble _0800BDD8
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0800BEAC @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r2, _0800BEB0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BDD2
	cmp r0, #7
	bne _0800BDD4
_0800BDD2:
	movs r1, #1
_0800BDD4:
	lsls r0, r1, #5
	orrs r5, r0
_0800BDD8:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r4, r0
	bge _0800BE0A
	lsls r1, r6, #1
	ldr r3, _0800BEAC @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r4
	ldr r3, _0800BEB0 @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BE04
	cmp r0, #7
	bne _0800BE06
_0800BE04:
	movs r1, #1
_0800BE06:
	lsls r0, r1, #3
	orrs r5, r0
_0800BE0A:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800BE9A
	adds r6, #1
	cmp r4, #0
	ble _0800BE42
	lsls r1, r6, #1
	ldr r3, _0800BEAC @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, #1
	adds r1, r1, r4
	ldr r3, _0800BEB0 @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BE3C
	cmp r0, #7
	bne _0800BE3E
_0800BE3C:
	movs r1, #1
_0800BE3E:
	lsls r0, r1, #2
	orrs r5, r0
_0800BE42:
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0800BEAC @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800BEB0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BE64
	cmp r0, #7
	bne _0800BE66
_0800BE64:
	movs r1, #1
_0800BE66:
	lsls r0, r1, #1
	orrs r5, r0
	ldr r0, [r7]
	ldr r3, [r0]
	ldrh r0, [r3]
	subs r0, #1
	cmp r4, r0
	bge _0800BE9A
	lsls r1, r6, #1
	ldr r7, _0800BEAC @ =0x0000417A
	adds r0, r3, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r4
	ldr r2, _0800BEB0 @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	cmp r0, #0x13
	beq _0800BE96
	cmp r0, #7
	bne _0800BE98
_0800BE96:
	movs r1, #1
_0800BE98:
	orrs r5, r1
_0800BE9A:
	movs r1, #0
	ldr r0, _0800BEB4 @ =0x000001FF
	cmp r5, r0
	bne _0800BEA4
	movs r1, #1
_0800BEA4:
	adds r0, r1, #0
_0800BEA6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800BEAC: .4byte 0x0000417A
_0800BEB0: .4byte 0x00001432
_0800BEB4: .4byte 0x000001FF

