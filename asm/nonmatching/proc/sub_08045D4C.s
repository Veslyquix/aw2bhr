	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045D4C
sub_08045D4C: @ 0x08045D4C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08045D94 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r5, [r0, #2]
	ldrb r4, [r0, #3]
	ldr r1, _08045D98 @ =gUnknown_08499594
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	adds r1, r1, r0
	lsls r0, r1, #8
	adds r1, r1, r0
	lsls r0, r1, #0x10
	adds r1, r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #8
	ldr r3, _08045D9C @ =gUnknown_0812A0FC
	ldr r0, [r3]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r0, [r0]
	adds r6, r3, #0
	cmp r0, #1
	beq _08045DA0
	cmp r0, #3
	beq _08045D8E
	b _08045EA4
_08045D8E:
	movs r3, #1
	b _08045DA2
	.align 2, 0
_08045D94: .4byte gUnknown_030040D8
_08045D98: .4byte gUnknown_08499594
_08045D9C: .4byte gUnknown_0812A0FC
_08045DA0:
	movs r3, #3
_08045DA2:
	ldr r7, _08045E98 @ =gUnknown_0812A100
	cmp r4, #0
	ble _08045DDE
	ldr r0, [r7]
	ldr r2, [r0]
	subs r1, r4, #1
	lsls r1, r1, #1
	mov ip, r1
	ldr r1, _08045E9C @ =0x0000417A
	adds r0, r2, r1
	add r0, ip
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r1, _08045EA0 @ =0x0000051A
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08045DDE
	asrs r1, r0, #6
	ldr r0, [r6]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, r3
	beq _08045E94
_08045DDE:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r4, r0
	bge _08045E1E
	adds r1, r4, #1
	lsls r1, r1, #1
	mov ip, r1
	ldr r1, _08045E9C @ =0x0000417A
	adds r0, r2, r1
	add r0, ip
	ldrh r1, [r0]
	adds r1, r1, r5
	mov ip, r1
	ldr r1, _08045EA0 @ =0x0000051A
	adds r0, r2, r1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #0
	beq _08045E1E
	asrs r1, r0, #6
	ldr r0, [r6]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, r3
	beq _08045E94
_08045E1E:
	cmp r5, #0
	ble _08045E58
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r2, r4, #1
	mov ip, r2
	ldr r2, _08045E9C @ =0x0000417A
	adds r0, r1, r2
	add r0, ip
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	ldr r2, _08045EA0 @ =0x0000051A
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08045E58
	asrs r1, r0, #6
	ldr r0, [r6]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, r3
	beq _08045E94
_08045E58:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r5, r0
	bge _08045EA4
	lsls r1, r4, #1
	ldr r4, _08045E9C @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r5
	ldr r4, _08045EA0 @ =0x0000051A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08045EA4
	asrs r1, r0, #6
	ldr r0, [r6]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, r3
	bne _08045EA4
_08045E94:
	movs r0, #1
	b _08045EA6
	.align 2, 0
_08045E98: .4byte gUnknown_0812A100
_08045E9C: .4byte 0x0000417A
_08045EA0: .4byte 0x0000051A
_08045EA4:
	movs r0, #0
_08045EA6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

