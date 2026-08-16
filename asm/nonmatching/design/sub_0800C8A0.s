	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C8A0
sub_0800C8A0: @ 0x0800C8A0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _0800C8D4 @ =gUnknown_03003150
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800C8CC
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r4, r1, r0
_0800C8B4:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800C8C0
	cmp r0, r3
	bne _0800C8C0
	adds r2, #1
_0800C8C0:
	adds r1, #4
	cmp r1, r4
	bgt _0800C8CC
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0800C8B4
_0800C8CC:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800C8D4: .4byte gUnknown_03003150

