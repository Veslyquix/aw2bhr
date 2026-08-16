	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805D2A0
sub_0805D2A0: @ 0x0805D2A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _0805D31C @ =gUnknown_0816DA38
	ldr r5, [r2]
	ldr r1, _0805D320 @ =gUnknown_0816DA3C
	ldr r0, [r1]
	str r0, [r5]
	ldr r3, _0805D324 @ =gUnknown_03003F2C
	ldrh r0, [r3]
	adds r4, r0, #1
	adds r0, #0x40
	mov ip, r2
	mov r8, r1
	cmp r4, r0
	bge _0805D2F6
	ldr r7, _0805D328 @ =gUnknown_08499594
	adds r6, r3, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #2
_0805D2CA:
	ldr r0, [r7]
	adds r0, r2, r0
	ldrb r3, [r0]
	cmp r3, #0
	beq _0805D2EA
	ldrb r1, [r0, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805D2EA
	cmp r3, #7
	bne _0805D2EA
	ldr r0, [r5]
	strb r4, [r0]
	adds r0, #1
	str r0, [r5]
_0805D2EA:
	adds r2, #0xc
	adds r4, #1
	ldrh r0, [r6]
	adds r0, #0x40
	cmp r4, r0
	blt _0805D2CA
_0805D2F6:
	mov r0, ip
	ldr r2, [r0]
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	str r0, [r2]
	ldr r1, _0805D32C @ =gUnknown_03004778
	ldr r0, _0805D330 @ =sub_0805E3BC
	str r0, [r1]
	ldr r1, _0805D334 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D31C: .4byte gUnknown_0816DA38
_0805D320: .4byte gUnknown_0816DA3C
_0805D324: .4byte gUnknown_03003F2C
_0805D328: .4byte gUnknown_08499594
_0805D32C: .4byte gUnknown_03004778
_0805D330: .4byte sub_0805E3BC
_0805D334: .4byte gUnknown_03004780

