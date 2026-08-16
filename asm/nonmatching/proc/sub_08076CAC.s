	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076CAC
sub_08076CAC: @ 0x08076CAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	ldr r3, _08076CE8 @ =gUnknown_081CC590
	ldr r5, [r3]
	ldrh r1, [r5, #4]
	mov ip, r1
	ldrh r2, [r5]
	mov r8, r2
	movs r1, #4
	ldrsh r2, [r5, r1]
	movs r1, #0
	ldrsh r6, [r5, r1]
	adds r1, r2, r6
	lsrs r7, r0, #0x10
	asrs r4, r0, #0x10
	adds r1, r1, r4
	adds r2, r2, r4
	ldr r0, _08076CEC @ =0x0000019F
	cmp r1, r0
	bhi _08076D3A
	adds r0, r2, #0
	subs r0, #0x20
	cmp r0, #0x9f
	bhi _08076CF0
	mov r2, ip
	adds r0, r4, r2
	strh r0, [r5, #4]
	b _08076D3A
	.align 2, 0
_08076CE8: .4byte gUnknown_081CC590
_08076CEC: .4byte 0x0000019F
_08076CF0:
	adds r1, r6, r4
	cmp r2, #0xbf
	bgt _08076CFE
	cmp r1, #0
	blt _08076CFE
	cmp r4, #0
	blt _08076D0C
_08076CFE:
	cmp r2, #0x20
	ble _08076D1A
	cmp r1, #0xbf
	bgt _08076D1A
	lsls r0, r7, #0x10
	cmp r0, #0
	ble _08076D1A
_08076D0C:
	ldr r1, [r3]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	b _08076D3A
_08076D1A:
	cmp r2, #0
	bge _08076D24
	ldr r1, [r3]
	movs r0, #0
	b _08076D38
_08076D24:
	cmp r2, #0xe0
	ble _08076D2E
	ldr r1, [r3]
	movs r0, #0xe0
	b _08076D38
_08076D2E:
	ldr r1, [r3]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r1, #4]
	adds r0, r0, r2
_08076D38:
	strh r0, [r1, #4]
_08076D3A:
	ldr r3, [r3]
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #4
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _08076D58
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r3, r2]
	cmp r0, r1
	beq _08076D5C
_08076D58:
	movs r0, #1
	b _08076D5E
_08076D5C:
	movs r0, #0
_08076D5E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

