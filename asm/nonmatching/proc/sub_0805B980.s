	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B980
sub_0805B980: @ 0x0805B980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0805BA1C @ =gUnknown_03003F20
	ldr r3, [r0]
	movs r5, #0
	ldr r1, _0805BA20 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r5, r0
	bge _0805BA0A
	mov r8, r1
	ldr r0, _0805BA24 @ =gUnknown_03003340
	mov sb, r0
_0805B9A0:
	movs r2, #0
	mov r1, r8
	ldr r0, [r1]
	adds r7, r5, #1
	mov ip, r7
	ldrh r0, [r0]
	cmp r2, r0
	bge _0805B9FE
	lsls r0, r5, #2
	mov r1, sb
	adds r4, r0, r1
	ldr r6, _0805BA20 @ =gUnknown_08499590
	lsls r7, r5, #1
	mov sl, r7
_0805B9BC:
	ldr r0, [r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805B9F4
	ldr r1, [r6]
	ldr r7, _0805BA28 @ =0x0000417A
	adds r0, r1, r7
	add r0, sl
	ldrh r0, [r0]
	adds r0, r0, r2
	ldr r7, _0805BA2C @ =0x00003C72
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805B9F4
	strb r2, [r3]
	strb r5, [r3, #1]
	ldr r0, [r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r3, #2]
	adds r3, #4
_0805B9F4:
	adds r2, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r2, r0
	blt _0805B9BC
_0805B9FE:
	mov r5, ip
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blt _0805B9A0
_0805BA0A:
	ldr r0, _0805BA30 @ =0x0000FFFF
	strh r0, [r3, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA1C: .4byte gUnknown_03003F20
_0805BA20: .4byte gUnknown_08499590
_0805BA24: .4byte gUnknown_03003340
_0805BA28: .4byte 0x0000417A
_0805BA2C: .4byte 0x00003C72
_0805BA30: .4byte 0x0000FFFF

