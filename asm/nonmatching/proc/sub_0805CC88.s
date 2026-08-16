	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805CC88
sub_0805CC88: @ 0x0805CC88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _0805CD14 @ =gUnknown_0816D9F8
	ldr r5, [r2]
	ldr r1, _0805CD18 @ =gUnknown_0816D9FC
	ldr r0, [r1]
	str r0, [r5]
	ldr r3, _0805CD1C @ =gUnknown_03003F2C
	ldrh r0, [r3]
	adds r4, r0, #1
	adds r0, #0x40
	mov ip, r2
	mov r8, r1
	cmp r4, r0
	bge _0805CCE6
	ldr r7, _0805CD20 @ =gUnknown_08499594
	adds r6, r3, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #2
_0805CCB2:
	ldr r0, [r7]
	adds r0, r2, r0
	ldrb r3, [r0]
	cmp r3, #0
	beq _0805CCDA
	ldrb r1, [r0, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805CCDA
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0805CCDA
	ldr r0, [r5]
	strb r4, [r0]
	adds r0, #1
	str r0, [r5]
_0805CCDA:
	adds r2, #0xc
	adds r4, #1
	ldrh r0, [r6]
	adds r0, #0x40
	cmp r4, r0
	blt _0805CCB2
_0805CCE6:
	mov r0, ip
	ldr r2, [r0]
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0805CD24 @ =gUnknown_0300477C
	ldr r0, [r0]
	bl sub_0805D344
	ldr r1, _0805CD28 @ =gUnknown_03004778
	ldr r0, _0805CD2C @ =sub_0805DB50
	str r0, [r1]
	ldr r1, _0805CD30 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD14: .4byte gUnknown_0816D9F8
_0805CD18: .4byte gUnknown_0816D9FC
_0805CD1C: .4byte gUnknown_03003F2C
_0805CD20: .4byte gUnknown_08499594
_0805CD24: .4byte gUnknown_0300477C
_0805CD28: .4byte gUnknown_03004778
_0805CD2C: .4byte sub_0805DB50
_0805CD30: .4byte gUnknown_03004780

