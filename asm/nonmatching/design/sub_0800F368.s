	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F368
sub_0800F368: @ 0x0800F368
	push {r4, lr}
	ldr r2, _0800F3A8 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _0800F3AC @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	ldr r2, _0800F3B0 @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	lsls r1, r1, #1
	ldr r4, _0800F3B4 @ =0x00000A22
	adds r3, r3, r4
	adds r3, r3, r1
	ldrh r1, [r3]
	movs r0, #0
	cmp r2, #5
	beq _0800F39E
	cmp r2, #0xc
	bne _0800F3A0
	cmp r1, #0x16
	beq _0800F39E
	cmp r1, #0x36
	bne _0800F3A0
_0800F39E:
	movs r0, #1
_0800F3A0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F3A8: .4byte gUnknown_08499590
_0800F3AC: .4byte 0x0000417A
_0800F3B0: .4byte 0x00001432
_0800F3B4: .4byte 0x00000A22

