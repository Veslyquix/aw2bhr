	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030E40
sub_08030E40: @ 0x08030E40
	push {r4, r5, r6, lr}
	ldr r4, _08030EBC @ =gUnknown_08090CF0
	ldr r1, [r4]
	ldr r0, [r1]
	ldrb r2, [r0, #6]
	ldr r3, _08030EC0 @ =0x00001AB4
	adds r0, r0, r3
	ldrb r3, [r0]
	movs r3, #0
	strb r2, [r0]
	ldr r0, [r1]
	ldr r2, _08030EC4 @ =0x00001AB3
	adds r0, r0, r2
	ldrb r2, [r0]
	strb r3, [r0]
	ldr r0, [r1]
	ldr r2, _08030EC8 @ =0x00001AB2
	adds r0, r0, r2
	ldrb r2, [r0]
	strb r3, [r0]
	movs r5, #0
	adds r6, r4, #0
	adds r4, r1, #0
_08030E6E:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _08030E9E
	ldr r1, [r4]
	ldr r0, _08030EC4 @ =0x00001AB3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r2, [r4]
	ldr r0, _08030EC8 @ =0x00001AB2
	adds r2, r2, r0
	adds r1, r3, #0
	lsls r1, r5
	ldrb r0, [r2]
	orrs r1, r0
	ldrb r0, [r2]
	strb r1, [r2]
_08030E9E:
	adds r5, #1
	cmp r5, #3
	ble _08030E6E
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, _08030ECC @ =gUnknown_03004008
	ldr r1, [r1]
	ldr r2, _08030ED0 @ =0x00001AB0
	adds r0, r0, r2
	ldrh r2, [r0]
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030EBC: .4byte gUnknown_08090CF0
_08030EC0: .4byte 0x00001AB4
_08030EC4: .4byte 0x00001AB3
_08030EC8: .4byte 0x00001AB2
_08030ECC: .4byte gUnknown_03004008
_08030ED0: .4byte 0x00001AB0

