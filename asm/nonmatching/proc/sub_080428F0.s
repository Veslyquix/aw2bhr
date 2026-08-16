	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080428F0
sub_080428F0: @ 0x080428F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _08042984 @ =gUnknown_08499594
	ldr r1, _08042988 @ =gUnknown_08091360
	mov r8, r1
	ldr r5, [r1]
	ldr r1, [r5]
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r1, #7
	adds r1, r1, r7
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r2, r2, r0
	ldrb r1, [r2, #1]
	movs r0, #0xf7
	ands r0, r1
	movs r6, #0
	mov ip, r6
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r2, #1]
	ldr r4, _0804298C @ =gUnknown_03003100
	ldr r3, _08042990 @ =gUnknown_0849FFF8
	ldr r1, _08042994 @ =gUnknown_03003F40
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	ldrb r6, [r4]
	adds r0, r0, r6
	strb r0, [r2, #2]
	ldr r0, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	ldrb r4, [r4, #2]
	adds r0, r0, r4
	strb r0, [r2, #3]
	ldr r0, [r5]
	adds r0, #7
	adds r0, r0, r7
	mov r1, ip
	strb r1, [r0]
	mov r6, r8
	cmp r7, #0
	bne _08042968
	ldr r1, [r5]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08042968
	strb r0, [r1, #7]
	ldr r0, [r5]
	strb r7, [r0, #8]
_08042968:
	ldr r0, [r6]
	ldr r6, [r0]
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _0804297A
	ldrb r1, [r6, #1]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r6, #1]
_0804297A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042984: .4byte gUnknown_08499594
_08042988: .4byte gUnknown_08091360
_0804298C: .4byte gUnknown_03003100
_08042990: .4byte gUnknown_0849FFF8
_08042994: .4byte gUnknown_03003F40

