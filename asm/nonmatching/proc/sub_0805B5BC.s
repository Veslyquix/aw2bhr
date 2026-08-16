	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B5BC
sub_0805B5BC: @ 0x0805B5BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	str r1, [sp, #8]
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, _0805B638 @ =gUnknown_02029ED8
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r1, [r1]
	adds r1, r1, r0
	ldr r3, _0805B63C @ =gUnknown_030033EC
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #0xa
	adds r1, r1, r0
	adds r1, r1, r4
	ldrb r5, [r1]
	cmp r5, #0xff
	beq _0805B68E
	mov sl, r4
	mov sb, r3
_0805B5F2:
	lsls r2, r5, #3
	mov r1, r8
	ldr r0, [r1]
	lsls r3, r0, #5
	subs r0, r3, r0
	lsls r0, r0, #5
	adds r2, r2, r0
	mov r7, sb
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r2, r2, r0
	add r2, sl
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r4, [r0]
	cmp r4, #0xfe
	bne _0805B640
	ldr r1, [sp, #8]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x1f
	bgt _0805B68E
	adds r2, r0, r3
	mov r3, sb
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r2, r2, r0
	add r2, sl
	ldrb r5, [r2]
	b _0805B68A
	.align 2, 0
_0805B638: .4byte gUnknown_02029ED8
_0805B63C: .4byte gUnknown_030033EC
_0805B640:
	adds r0, r2, #0
	adds r0, #0x61
	ldrb r6, [r0]
	ldr r0, _0805B678 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldr r1, _0805B67C @ =gUnknown_08499590
	ldr r2, [r1]
	lsls r3, r6, #1
	ldr r7, _0805B680 @ =0x0000417A
	adds r1, r2, r7
	adds r1, r1, r3
	ldrh r1, [r1]
	adds r1, r1, r4
	ldr r3, _0805B684 @ =0x00001432
	adds r2, r2, r3
	adds r2, r2, r1
	ldrb r1, [r2]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805B688
	ldr r7, [sp]
	str r4, [r7]
	ldr r0, [sp, #4]
	str r6, [r0]
	movs r0, #1
	b _0805B690
	.align 2, 0
_0805B678: .4byte gUnknown_03003F38
_0805B67C: .4byte gUnknown_08499590
_0805B680: .4byte 0x0000417A
_0805B684: .4byte 0x00001432
_0805B688:
	adds r5, #1
_0805B68A:
	cmp r5, #0xff
	bne _0805B5F2
_0805B68E:
	movs r0, #0
_0805B690:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

