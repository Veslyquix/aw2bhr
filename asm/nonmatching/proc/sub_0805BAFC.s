	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BAFC
sub_0805BAFC: @ 0x0805BAFC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	mov ip, r2
	adds r6, r3, #0
	cmp r4, #0
	blt _0805BB70
	cmp r5, #0
	blt _0805BB70
	ldr r0, _0805BB78 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r4, r0
	bge _0805BB70
	ldrh r3, [r2, #2]
	cmp r5, r3
	bge _0805BB70
	lsls r1, r5, #1
	ldr r7, _0805BB7C @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r4
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BB70
	ldr r0, _0805BB80 @ =gUnknown_085D3DD0
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r7, _0805BB84 @ =0x00001432
	adds r0, r2, r7
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	ldr r2, _0805BB88 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	adds r0, r0, r2
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, r3, r1
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805BB70
	strh r4, [r6]
	strh r5, [r6, #2]
_0805BB70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB78: .4byte gUnknown_08499590
_0805BB7C: .4byte 0x0000417A
_0805BB80: .4byte gUnknown_085D3DD0
_0805BB84: .4byte 0x00001432
_0805BB88: .4byte gUnknown_085D5ABC

