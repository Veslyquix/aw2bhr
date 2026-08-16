	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F318
sub_0800F318: @ 0x0800F318
	push {r4, lr}
	ldr r2, _0800F358 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _0800F35C @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	ldr r2, _0800F360 @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	lsls r1, r1, #1
	ldr r4, _0800F364 @ =0x00000A22
	adds r3, r3, r4
	adds r3, r3, r1
	ldrh r0, [r3]
	movs r1, #0
	cmp r2, #5
	beq _0800F34C
	cmp r2, #0xc
	bne _0800F34E
	subs r0, #0x13
	cmp r0, #1
	bhi _0800F34E
_0800F34C:
	movs r1, #1
_0800F34E:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F358: .4byte gUnknown_08499590
_0800F35C: .4byte 0x0000417A
_0800F360: .4byte 0x00001432
_0800F364: .4byte 0x00000A22

