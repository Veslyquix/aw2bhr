	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B6A0
sub_0805B6A0: @ 0x0805B6A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, _0805B710 @ =gUnknown_02029ED8
	ldr r6, [r0]
	lsls r5, r6, #5
	ldr r1, [r4]
	adds r1, r1, r5
	ldr r0, _0805B714 @ =gUnknown_030033EC
	mov ip, r0
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #0xa
	adds r1, r1, r0
	adds r1, r1, r7
	ldrb r2, [r1]
	cmp r2, #0xff
	beq _0805B736
	adds r3, r5, #0
	subs r0, r3, r6
	lsls r6, r0, #5
	mov r5, ip
_0805B6D6:
	lsls r0, r2, #3
	adds r2, r0, r6
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adds r0, r0, r7
	adds r1, r0, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #0xfe
	beq _0805B718
	ldrb r0, [r1]
	mov r1, r8
	str r0, [r1]
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adds r0, r0, r7
	adds r0, #0x61
	ldrb r0, [r0]
	mov r1, sb
	str r0, [r1]
	movs r0, #1
	b _0805B738
	.align 2, 0
_0805B710: .4byte gUnknown_02029ED8
_0805B714: .4byte gUnknown_030033EC
_0805B718:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	cmp r0, #0x1f
	bgt _0805B736
	adds r2, r0, r3
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r2, r2, r0
	adds r2, r2, r7
	ldrb r2, [r2]
	cmp r2, #0xff
	bne _0805B6D6
_0805B736:
	movs r0, #0
_0805B738:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

