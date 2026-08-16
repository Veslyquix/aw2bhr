	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C8D8
sub_0800C8D8: @ 0x0800C8D8
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r2, #0
	ldr r4, _0800C920 @ =gUnknown_0200B0B0
	movs r3, #0xff
_0800C8E2:
	ldr r1, [r4]
	adds r1, #0x17
	adds r1, r1, r2
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, #0x1b
	adds r1, r1, r2
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble _0800C8E2
	ldr r1, _0800C924 @ =gUnknown_03003150
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800C94E
	adds r4, r1, #0
	adds r6, r4, #0
_0800C90C:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800C93C
	cmp r0, #0x48
	beq _0800C930
	cmp r0, #0x48
	bgt _0800C928
	cmp r0, #0x28
	beq _0800C930
	b _0800C93C
	.align 2, 0
_0800C920: .4byte gUnknown_0200B0B0
_0800C924: .4byte gUnknown_03003150
_0800C928:
	cmp r0, #0x68
	beq _0800C930
	cmp r0, #0x88
	bne _0800C93C
_0800C930:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	bl sub_0800C75C
	adds r5, #1
_0800C93C:
	adds r4, #4
	movs r1, #0xb6
	lsls r1, r1, #1
	adds r0, r6, r1
	cmp r4, r0
	bgt _0800C94E
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _0800C90C
_0800C94E:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

