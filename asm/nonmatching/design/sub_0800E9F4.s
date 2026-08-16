	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800E9F4
sub_0800E9F4: @ 0x0800E9F4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, _0800EA2C @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r0, r5, #1
	ldr r4, _0800EA30 @ =0x0000417A
	adds r3, r1, r4
	adds r0, r3, r0
	ldrh r4, [r0]
	adds r0, r4, r2
	lsls r0, r0, #1
	ldr r7, _0800EA34 @ =0x00000A22
	adds r1, r1, r7
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x65
	bgt _0800EAEA
	cmp r0, #0x64
	bge _0800EAB2
	cmp r0, #0x24
	blt _0800EAEA
	cmp r0, #0x25
	ble _0800EA38
	cmp r0, #0x27
	beq _0800EA72
	b _0800EAEA
	.align 2, 0
_0800EA2C: .4byte gUnknown_08499590
_0800EA30: .4byte 0x0000417A
_0800EA34: .4byte 0x00000A22
_0800EA38:
	adds r0, r4, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800EAEA
	adds r0, r5, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800EAEA
	adds r0, r3, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800EAEA
	movs r6, #1
	b _0800EAEA
_0800EA72:
	subs r0, r4, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800EAEA
	adds r0, r5, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	subs r0, r3, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800EAEA
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800EAEA
	movs r6, #2
	b _0800EAEA
_0800EAB2:
	subs r0, r5, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r3, [r0]
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800EAEA
	adds r0, r3, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800EAEA
	adds r0, r4, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x67
	bne _0800EAEA
	movs r6, #3
_0800EAEA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

