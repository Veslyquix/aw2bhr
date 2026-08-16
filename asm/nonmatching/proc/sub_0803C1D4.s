	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C1D4
sub_0803C1D4: @ 0x0803C1D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0803C278 @ =gUnknown_08091134
	ldr r0, [r4]
	mov ip, r0
	ldr r3, _0803C27C @ =gUnknown_08091138
	ldr r5, [r3]
	ldr r1, [r5]
	ldrb r0, [r1, #2]
	mov r2, ip
	strb r0, [r2, #9]
	ldr r2, _0803C280 @ =gUnknown_0200C420
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xe]
	ldrb r0, [r1]
	mov r2, ip
	strb r0, [r2, #0xd]
	ldrb r2, [r1, #3]
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	movs r2, #4
	ldrsh r0, [r1, r2]
	mov r2, ip
	str r0, [r2, #0x28]
	ldrb r0, [r1, #7]
	adds r2, #0x31
	strb r0, [r2]
	ldrb r0, [r1, #1]
	mov r1, ip
	strb r0, [r1, #8]
	movs r6, #0
	mov r8, r4
	adds r7, r3, #0
	mov r3, ip
	adds r3, #0x42
_0803C21E:
	adds r2, r6, #1
	mov r4, ip
	adds r4, #0x3d
	adds r1, r2, r4
	ldr r0, [r5]
	adds r0, #0x20
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x38
	adds r1, r2, r1
	ldr r0, [r5]
	adds r0, #9
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x33
	adds r1, r2, r1
	ldr r0, [r5]
	adds r0, #0xd
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	ldr r0, [r5]
	adds r0, #0x11
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r6, #3
	bls _0803C21E
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r3, [r0, #6]
	cmp r3, #1
	beq _0803C2C4
	cmp r3, #1
	bgt _0803C284
	cmp r3, #0
	beq _0803C28E
	b _0803C2C4
	.align 2, 0
_0803C278: .4byte gUnknown_08091134
_0803C27C: .4byte gUnknown_08091138
_0803C280: .4byte gUnknown_0200C420
_0803C284:
	cmp r3, #2
	beq _0803C296
	cmp r3, #3
	beq _0803C2AE
	b _0803C2C4
_0803C28E:
	adds r1, r4, #0
	subs r1, #0x10
	movs r0, #1
	b _0803C29C
_0803C296:
	adds r1, r4, #0
	subs r1, #0x10
	movs r0, #3
_0803C29C:
	strb r0, [r1]
	adds r0, r4, #0
	subs r0, #0x11
	strb r3, [r0]
	adds r0, #2
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	b _0803C2DC
_0803C2AE:
	adds r0, r4, #0
	subs r0, #0x10
	strb r3, [r0]
	subs r0, #1
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _0803C2DC
_0803C2C4:
	mov r0, r8
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	subs r1, #1
	strb r0, [r1]
	adds r1, #2
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
_0803C2DC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

