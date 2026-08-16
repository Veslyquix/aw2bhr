	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008B70
sub_08008B70: @ 0x08008B70
	push {r4, r5, lr}
	movs r4, #0x19
	ldr r2, _08008BAC @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r5, _08008BB0 @ =0x0000417A
	adds r2, r3, r5
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	adds r3, #0x12
	adds r3, r3, r1
	ldrb r2, [r3]
	movs r3, #0xc0
	ands r3, r2
	cmp r2, #0
	ble _08008BA2
	ldr r0, _08008BB4 @ =gUnknown_08499594
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	orrs r4, r3
_08008BA2:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08008BAC: .4byte gUnknown_08499590
_08008BB0: .4byte 0x0000417A
_08008BB4: .4byte gUnknown_08499594

