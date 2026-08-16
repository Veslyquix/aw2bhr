	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BD40
sub_0805BD40: @ 0x0805BD40
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	mov ip, r2
	ldr r7, [sp, #0x14]
	cmp r4, #0
	blt _0805BDB8
	cmp r5, #0
	blt _0805BDB8
	ldr r0, _0805BDBC @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r4, r0
	bge _0805BDB8
	ldrh r6, [r2, #2]
	cmp r5, r6
	bge _0805BDB8
	ldr r0, _0805BDC0 @ =gUnknown_030045C8
	ldr r0, [r0]
	cmp r3, r0
	beq _0805BDB8
	lsls r1, r5, #1
	ldr r3, _0805BDC4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r4
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BDB8
	ldr r0, _0805BDC8 @ =gUnknown_085D3DD0
	movs r6, #0xaa
	lsls r6, r6, #1
	adds r0, r0, r6
	ldr r3, [r0]
	ldr r6, _0805BDCC @ =0x00001432
	adds r0, r2, r6
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	ldr r2, _0805BDD0 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	mov r6, ip
	muls r6, r0, r6
	adds r0, r6, #0
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
	bne _0805BDD4
_0805BDB8:
	movs r0, #0
	b _0805BDDA
	.align 2, 0
_0805BDBC: .4byte gUnknown_08499590
_0805BDC0: .4byte gUnknown_030045C8
_0805BDC4: .4byte 0x0000417A
_0805BDC8: .4byte gUnknown_085D3DD0
_0805BDCC: .4byte 0x00001432
_0805BDD0: .4byte gUnknown_085D5ABC
_0805BDD4:
	strh r4, [r7]
	strh r5, [r7, #2]
	movs r0, #1
_0805BDDA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

