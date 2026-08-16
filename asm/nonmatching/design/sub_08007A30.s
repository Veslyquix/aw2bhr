	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007A30
sub_08007A30: @ 0x08007A30
	push {r4, r5, r6, lr}
	ldr r0, _08007A50 @ =gUnknown_0808D7E8
	ldr r5, [r0]
	ldr r2, [r5]
	adds r4, r2, #0
	adds r4, #0x6c
	ldrb r1, [r4]
	adds r6, r0, #0
	cmp r1, #0xa
	beq _08007AA4
	cmp r1, #0xa
	bgt _08007A54
	cmp r1, #0
	beq _08007A5A
	b _08007B10
	.align 2, 0
_08007A50: .4byte gUnknown_0808D7E8
_08007A54:
	cmp r1, #0x14
	beq _08007AF8
	b _08007B10
_08007A5A:
	adds r0, r2, #0
	adds r0, #0x6e
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0xe6
	lsls r0, r0, #3
	subs r0, r0, r3
	asrs r0, r0, #3
	adds r3, r3, r0
	movs r0, #0xea
	lsls r0, r0, #3
	cmp r3, r0
	bgt _08007A7A
	adds r3, r0, #0
	movs r0, #0xa
	strb r0, [r4]
_08007A7A:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x6e
	strh r3, [r1]
	adds r1, #2
	movs r0, #0
	ldrsh r5, [r1, r0]
	movs r0, #0x9c
	lsls r0, r0, #4
	subs r0, r0, r5
	asrs r0, r0, #3
	adds r5, r5, r0
	ldr r0, _08007AA0 @ =0x0000099F
	cmp r5, r0
	ble _08007AEE
	movs r5, #0x9a
	lsls r5, r5, #4
	b _08007AEE
	.align 2, 0
_08007AA0: .4byte 0x0000099F
_08007AA4:
	adds r0, r2, #0
	adds r0, #0x6e
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0xf4
	lsls r0, r0, #3
	subs r0, r0, r3
	asrs r0, r0, #3
	adds r3, r3, r0
	ldr r0, _08007AF4 @ =0x0000077F
	cmp r3, r0
	ble _08007ACC
	movs r3, #0xf0
	lsls r3, r3, #3
	movs r0, #0x14
	strb r0, [r4]
	ldr r0, [r5]
	adds r0, #0x6d
	movs r1, #0x1e
	strb r1, [r0]
_08007ACC:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x6e
	strh r3, [r1]
	adds r1, #2
	movs r0, #0
	ldrsh r5, [r1, r0]
	movs r0, #0x95
	lsls r0, r0, #4
	subs r0, r0, r5
	asrs r0, r0, #3
	adds r5, r5, r0
	movs r0, #0x97
	lsls r0, r0, #4
	cmp r5, r0
	bgt _08007AEE
	adds r5, r0, #0
_08007AEE:
	strh r5, [r1]
	b _08007B10
	.align 2, 0
_08007AF4: .4byte 0x0000077F
_08007AF8:
	adds r0, r2, #0
	adds r0, #0x6d
	ldrb r1, [r0]
	subs r2, r1, #1
	strb r2, [r0]
	lsls r1, r1, #0x18
	cmp r1, #0
	bgt _08007B10
	ldr r0, [r5]
	adds r0, #0x6c
	movs r1, #0
	strb r1, [r0]
_08007B10:
	ldr r0, [r6]
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x6e
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x14
	adds r1, #0x70
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x14
	movs r4, #0x80
	lsls r4, r4, #3
	orrs r3, r4
	ldr r2, _08007B4C @ =gUnknown_08488880
	movs r0, #0x64
	adds r1, r3, #0
	movs r3, #0
	bl sub_0801BD00
	orrs r5, r4
	ldr r2, _08007B50 @ =gUnknown_08488888
	movs r0, #0x86
	adds r1, r5, #0
	movs r3, #0
	bl sub_0801BD00
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007B4C: .4byte gUnknown_08488880
_08007B50: .4byte gUnknown_08488888

